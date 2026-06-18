# cPanel & WHM – German Translation

German locale for cPanel & WHM. Over 21,000 strings, XLIFF 1.2, formal register.

🇩🇪 [Deutsche Version](README_DE.md)

## Installation

Since `i_dd_de` is a custom (non-standard) language, it must be registered in WHM before importing.

1. WHM → **Locale** → **Non-Standard Locale Configuration**
2. Create a new language with code `i_dd_de`

### WHM

1. WHM → **Locale** → **Locale XML Upload**
2. Upload `i_dd_de.xlf`
3. Done

### Command Line

Run directly on the server

```bash
wget https://raw.githubusercontent.com/datadachs/cPanel.German/main/i_dd_de.xlf
/usr/local/cpanel/bin/locale_import i_dd_de.xlf
```

### Switching Language

- **cPanel:** Username in the top right → *Change Language* → Deutsch
- **Packages:** The default language can be changed per package as needed.

## Files

| File | Description |
|---|---|
| `i_dd_de.xlf` | German translation |
| `en.xlf` | English reference from cPanel |

## Compatibility

Tested with cPanel & WHM 134.0.40. Structurally based on the official `en.xlf`.

## License

MIT: See [LICENSE](LICENSE).

The translations were created with the help of an LLM and have been manually reviewed and corrected by me. The English source strings in the `<source>` tags belong to cPanel, L.L.C.

## Say Thanks

If this project helps you and you'd like to donate:

[![Donate](https://img.shields.io/badge/Donate-Stripe-blueviolet?style=for-the-badge&logo=stripe)](https://donate.stripe.com/9B614p8Zq13U2oJaQZ3F602)
