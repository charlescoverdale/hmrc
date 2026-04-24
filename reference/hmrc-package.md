# hmrc: Download and Tidy HMRC Statistical Data

Provides functions to download, parse, and tidy statistical data
published by HM Revenue and Customs (HMRC) on GOV.UK. Covers tax
receipts, National Insurance contributions, and property transactions.
File URLs are resolved at runtime via the GOV.UK Content API, so data is
always current.

## Main functions

- [`get_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/get_tax_receipts.md)
  — monthly tax receipts and NICs (all heads, April 2016+)

- [`get_property_transactions()`](https://charlescoverdale.github.io/hmrc/reference/get_property_transactions.md)
  — monthly property transaction counts (April 2005+)

- [`get_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/get_income_tax_stats.md)
  — annual Income Tax liabilities by income range

- [`get_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/get_tax_gap.md)
  — annual tax gap estimates by tax type

- [`get_stamp_duty()`](https://charlescoverdale.github.io/hmrc/reference/get_stamp_duty.md)
  — annual stamp duty receipts (SDLT, SDRT)

- [`get_vat()`](https://charlescoverdale.github.io/hmrc/reference/get_vat.md)
  — monthly VAT receipts breakdown (April 1973+)

- [`get_rd_credits()`](https://charlescoverdale.github.io/hmrc/reference/get_rd_credits.md)
  — annual R&D tax credit statistics (2000-01+)

- [`get_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/get_fuel_duties.md)
  — monthly fuel duty receipts (January 1990+)

- [`get_tobacco_duties()`](https://charlescoverdale.github.io/hmrc/reference/get_tobacco_duties.md)
  — monthly tobacco duty receipts (January 1991+)

- [`get_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/get_corporation_tax.md)
  — annual Corporation Tax receipts by type

- [`list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/list_tax_heads.md)
  — lookup table of available tax head identifiers

- [`clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/clear_cache.md)
  — manage locally cached files

## Data source

All data is published by HMRC on GOV.UK under the Open Government
Licence. See
<https://www.gov.uk/government/organisations/hm-revenue-customs/about/statistics>.

## See also

Useful links:

- <https://github.com/charlescoverdale/hmrc>

- Report bugs at <https://github.com/charlescoverdale/hmrc/issues>

## Author

**Maintainer**: Charles Coverdale <charlesfcoverdale@gmail.com>
