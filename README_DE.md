# cPanel & WHM – Deutsche Übersetzung

Deutsche Locale für cPanel & WHM. Über 21.000 Strings, XLIFF 1.2, Formelle-Form.

🇬🇧 [English Version](README.md)

## Installation

Da `i_dd_de` eine benutzerdefinierte (nicht-standardisierte) Sprache ist, muss sie vor dem Import in WHM registriert werden.

1. WHM → **Locale** → **Non-Standard Locale Configuration**
2. Neue Sprache mit Code `i_dd_de` anlegen

### WHM

1. WHM → **Locale** → **Locale XML Upload**
2. `i_dd_de.xlf` hochladen
3. Fertig

### Kommandozeile

Direkt auf dem Server ausführen

```bash
wget https://raw.githubusercontent.com/datadachs/cPanel.German/main/i_dd_de.xlf
/usr/local/cpanel/bin/locale_import i_dd_de.xlf
```

### Sprache umstellen

- **cPanel:** Benutzername oben rechts → *Change Language* → Deutsch
- **Packages:** In den Packages kann nach Bedarf die Standardsprache geändert werden.

## Dateien

| Datei | Was |
|---|---|
| `i_dd_de.xlf` | Deutsche Übersetzung |
| `en.xlf` | Englische Referenz von cPanel |

## Kompatibilität

Getestet mit cPanel & WHM 134.0.40. Basiert strukturell auf der offiziellen `en.xlf`.

## Lizenz

MIT: Siehe [LICENSE](LICENSE).

Die Übersetzungen sind mithilfe von einer LLM erstellt worden und durch mich Menschlich überschrieben und Korrigiert worden. Die englischen Quelltexte in den `<source>`-Tags gehören cPanel, L.L.C.

## Danke sagen

Wenn dir dieses Projekt hilft und du etwas spenden möchtest:

[![Spenden](https://img.shields.io/badge/Spenden-Stripe-blueviolet?style=for-the-badge&logo=stripe)](https://donate.stripe.com/3cIfZjb7y8wm2oJ8IR3F601)
