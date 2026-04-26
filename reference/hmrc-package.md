# hmrc: Download and Tidy HMRC Statistical Data

Provides functions to download, parse, and tidy statistical data
published by HM Revenue and Customs (HMRC) on GOV.UK. Returns annotated
`hmrc_tbl` data frames with provenance metadata (source URL, fetch time,
vintage, cell methods) for reproducible fiscal research. File URLs are
resolved at runtime via the GOV.UK Content API, so data is always
current.

## Data fetchers

- [`hmrc_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_receipts.md)
  — monthly tax receipts and NICs (April 2008+)

- [`hmrc_property_transactions()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_property_transactions.md)
  — monthly property transactions (April 2005+)

- [`hmrc_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_income_tax_stats.md)
  — annual Income Tax liabilities by income range

- [`hmrc_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_gap.md)
  — annual tax gap estimates by tax type

- [`hmrc_stamp_duty()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_stamp_duty.md)
  — annual stamp duty receipts (SDLT, SDRT)

- [`hmrc_vat()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_vat.md)
  — monthly VAT receipts breakdown (April 1973+)

- [`hmrc_rd_credits()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_rd_credits.md)
  — annual R&D tax credit statistics (2000-01+)

- [`hmrc_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_fuel_duties.md)
  — monthly fuel duty receipts (January 1990+)

- [`hmrc_tobacco_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tobacco_duties.md)
  — monthly tobacco duty receipts (January 1991+)

- [`hmrc_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_corporation_tax.md)
  — annual Corporation Tax receipts by type

- [`hmrc_capital_gains()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_capital_gains.md)
  — annual CGT taxpayers, gains, liabilities (1987-88+)

- [`hmrc_inheritance_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_inheritance_tax.md)
  — IHT estates and liabilities by net-estate band

- [`hmrc_patent_box()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_patent_box.md)
  — annual Patent Box election counts and relief

- [`hmrc_creative_industries()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_creative_industries.md)
  — annual Film/HETV/Games/Theatre/etc reliefs

## Discovery and infrastructure

- [`hmrc_search()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_search.md)
  — keyword search of the dataset catalogue

- [`hmrc_publications()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_publications.md)
  — index of implemented + planned publications

- [`hmrc_list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_list_tax_heads.md)
  — lookup table of tax-receipts identifiers

- [`hmrc_cache_info()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_cache_info.md)
  — inspect locally cached files

- [`hmrc_clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_clear_cache.md)
  — manage locally cached files

- [`hmrc_meta()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_meta.md)
  — extract provenance metadata from any `hmrc_tbl` result

## Citation

Run `citation("hmrc")` for the structured citation, or see the
`CITATION.cff` file at the package root for the GitHub citation widget.

## Data source

All data is published by HMRC on GOV.UK under the Open Government
Licence. See
<https://www.gov.uk/government/organisations/hm-revenue-customs/about/statistics>.

## See also

Useful links:

- <https://charlescoverdale.github.io/hmrc/>

- <https://github.com/charlescoverdale/hmrc>

- Report bugs at <https://github.com/charlescoverdale/hmrc/issues>

## Author

**Maintainer**: Charles Coverdale <charlesfcoverdale@gmail.com>
