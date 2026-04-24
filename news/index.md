# Changelog

## hmrc 0.3.3

- [`get_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/get_corporation_tax.md)
  now dynamically detects the latest publication year instead of using a
  hardcoded slug. This prevents the function from breaking when HMRC
  publishes a new annual edition.

## hmrc 0.3.2

CRAN release: 2026-03-17

- Removed non-existent pkgdown URL from DESCRIPTION.

## hmrc 0.3.1

- Examples now cache to
  [`tempdir()`](https://rdrr.io/r/base/tempfile.html) instead of the
  user’s home directory, fixing CRAN policy compliance for `\donttest`
  examples.
- Cache directory is now configurable via
  `options(hmrc.cache_dir = ...)`.

## hmrc 0.3.0

CRAN release: 2026-03-12

- Added
  [`get_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/get_income_tax_stats.md):
  annual Income Tax liabilities by income range, including taxpayer
  counts, total income, tax liabilities, and average tax rates (Table
  2.5).

## hmrc 0.2.0

- Added
  [`get_vat()`](https://charlescoverdale.github.io/hmrc/reference/get_vat.md):
  monthly VAT receipts by component (payments, repayments, import VAT,
  home VAT) from April 1973.
- Added
  [`get_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/get_fuel_duties.md):
  monthly hydrocarbon oil duty receipts by fuel type (petrol, diesel,
  other) from January 1990.
- Added
  [`get_tobacco_duties()`](https://charlescoverdale.github.io/hmrc/reference/get_tobacco_duties.md):
  monthly tobacco duty receipts by product (cigarettes, cigars,
  hand-rolling, other) from January 1991.
- Added
  [`get_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/get_corporation_tax.md):
  annual Corporation Tax receipts by levy type (onshore, offshore, Bank
  Levy, Bank Surcharge, RPDT, EPL, EGL) from 2019-20.
- Added
  [`get_stamp_duty()`](https://charlescoverdale.github.io/hmrc/reference/get_stamp_duty.md):
  annual stamp duty receipts by type (SDLT, SDRT, stamp duty on
  documents) from 2003-04.
- Added
  [`get_rd_credits()`](https://charlescoverdale.github.io/hmrc/reference/get_rd_credits.md):
  annual R&D tax credit claims and cost by scheme (SME R&D Relief and
  RDEC) from 2000-01.
- Added
  [`get_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/get_tax_gap.md):
  cross-sectional tax gap estimates by tax type, taxpayer group, and
  behaviour component for the most recent year.
- Updated DESCRIPTION to reflect full package scope.
- Updated vignette to cover all functions.

## hmrc 0.1.0

- Initial release.
- [`get_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/get_tax_receipts.md):
  monthly cash receipts for 41 tax heads, April 2016 to present.
- [`list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/list_tax_heads.md):
  catalogue of available tax head identifiers.
- [`get_property_transactions()`](https://charlescoverdale.github.io/hmrc/reference/get_property_transactions.md):
  monthly residential and non-residential property transaction counts by
  UK nation, April 2005 to present.
- [`clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/clear_cache.md):
  delete locally cached HMRC files.
