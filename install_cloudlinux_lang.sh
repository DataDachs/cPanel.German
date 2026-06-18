#!/bin/bash

set -e

LOCALE="i_dd_de"
LEGACY_LOCALE="i-dd_de"

BASE_I18N="/usr/share/l.v.e-manager/commons/spa-resources/i18n"
USER_I18N="/usr/share/l.v.e-locales"
TARGET_I18N="/usr/share/l.v.e-manager/cpanel/spa/assets/i18n"
AWP_TARGET="/usr/share/l.v.e-manager/awp-user/spa/assets/i18n"
XRAY_TARGET="/usr/share/l.v.e-manager/xray-user/spa/assets/i18n"
SYNC_SCRIPT="/usr/share/l.v.e-manager/utils/sync_locales.py"
PYTHON="/opt/cloudlinux/venv/bin/python3"

USER_LOCALE_URL="https://raw.githubusercontent.com/datadachs/cPanel.German/main/usr/share/l.v.e-locales/${LOCALE}.json"

# Create the base locale file from the CloudLinux translation template
if [ ! -f "${BASE_I18N}/${LOCALE}.json" ]; then
    cp "${BASE_I18N}/translate_template.json" "${BASE_I18N}/${LOCALE}.json"
fi

# Download the custom user locale file
wget -q -O "${USER_I18N}/${LOCALE}.json" "${USER_LOCALE_URL}"

# Validate the downloaded JSON file
if ! ${PYTHON} -m json.tool "${USER_I18N}/${LOCALE}.json" >/dev/null; then
    echo "ERROR: Invalid JSON in ${USER_I18N}/${LOCALE}.json"
    exit 1
fi

# Generate the cPanel locale file
${PYTHON} "${SYNC_SCRIPT}" --panel cPanel

# Create a compatibility copy for current CloudLinux releases
cp "${TARGET_I18N}/${LOCALE}.json" \
   "${TARGET_I18N}/${LEGACY_LOCALE}.json"

# Make the locale available immediately without waiting for the next cPanel update cycle
cp "${TARGET_I18N}/${LEGACY_LOCALE}.json" \
   "/usr/local/cpanel/whostmgr/docroot/3rdparty/cloudlinux/assets/i18n/${LEGACY_LOCALE}.json"

chmod 644 "${TARGET_I18N}/${LOCALE}.json"
chmod 644 "${TARGET_I18N}/${LEGACY_LOCALE}.json"
chmod 644 "/usr/local/cpanel/whostmgr/docroot/3rdparty/cloudlinux/assets/i18n/${LEGACY_LOCALE}.json"

# Copy for AccelerateWP (awp-user) if the directory exists
if [ -d "${AWP_TARGET}" ]; then
    cp "${TARGET_I18N}/${LOCALE}.json" "${AWP_TARGET}/i_-i_.json"
    chmod 644 "${AWP_TARGET}/i_-i_.json"
fi

# Copy for PHP X-Ray (xray-user) if the directory exists
if [ -d "${XRAY_TARGET}" ]; then
    cp "${TARGET_I18N}/${LOCALE}.json" "${XRAY_TARGET}/i_-i_.json"
    chmod 644 "${XRAY_TARGET}/i_-i_.json"
fi

# Restart cPanel web service
/usr/local/cpanel/scripts/restartsrv_cpsrvd

echo "CloudLinux cPanel locale installed successfully."
echo "Primary locale : ${LOCALE}"
echo "Compatibility  : ${LEGACY_LOCALE}"
