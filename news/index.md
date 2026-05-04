# Changelog

## hmrc 0.4.0

CRAN release: 2026-04-26

### New data fetchers (Phase 2 of the v1.0.0 roadmap, partial)

- [`hmrc_capital_gains()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_capital_gains.md)
  — Table 1 of the Capital Gains Tax statistics: estimated number of CGT
  taxpayers, gains, and tax liabilities by year of disposal, in tidy
  long format (`tax_year`, `measure`, `value`). Series begins 1987-88;
  published annually each summer.
- [`hmrc_inheritance_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_inheritance_tax.md)
  — Table 12.1a of the Inheritance Tax Liabilities Statistics: numbers
  of estates, tax due, average tax, and average effective tax rate by
  net-estate band, for the latest year of death. Annual cross-section
  (~3-year publication lag).
- [`hmrc_patent_box()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_patent_box.md)
  — Table 1 of the Patent Box reliefs statistics: annual companies
  electing into the regime and total relief claimed. Series begins
  2013-14; published annually in September.
- [`hmrc_creative_industries()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_creative_industries.md)
  — Table 1 of the Creative Industries statistics for all eight sector
  reliefs (Film, High-end TV, Animation, Children’s TV, Video Games,
  Theatre, Orchestra, Museums and Galleries). Annual time series back to
  the relief introduction date for each sector.

The catalogue (`catalogue` data,
[`hmrc_search()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_search.md),
[`hmrc_publications()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_publications.md))
now reflects 14 implemented datasets (out of 23 known publications).

### Architecture refresh (Phase 1 of the v1.0.0 roadmap)

This release brings the package up to feature parity with sibling
Coverdale packages (`boe`, `fred`, `ons`, `obr`) on infrastructure: a
provenance-aware S3 class, a searchable dataset catalogue, and cache
inspection.

#### New: `hmrc_tbl` S3 class with provenance metadata

- All `hmrc_*` data fetchers now return an `hmrc_tbl` (a subclass of
  `data.frame`) with a `"hmrc_meta"` attribute containing the source
  URL, attachment URL, fetch time, vintage, cell methods (cash /
  accruals / liabilities / counts), frequency, and package version.
- New generic `print.hmrc_tbl()` shows a 2-line provenance header
  followed by the data, e.g. `Source:`,
  `Fetched: ... | Vintage: latest | Cells: cash | Freq: monthly | 1,234 rows x 4 cols`.
- New helper
  [`hmrc_meta()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_meta.md)
  extracts the metadata list for citation, audit trails, and
  reproducibility.
- [`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html) strips
  the class and metadata cleanly for downstream tidyverse use;
  subsetting via `[` preserves the class and provenance.

#### New: dataset catalogue and discovery

- New exported data frame `catalogue` describes every HMRC dataset known
  to the package, including those on the development roadmap (where
  `function_name` is `NA`).
- New `hmrc_search(query, implemented, frequency)` for fuzzy keyword
  search across publication name, description, tags, and dataset
  identifier.
- New `hmrc_publications(status)` returns a tidy index of implemented
  versus planned publications.

#### New: cache inspection

- New
  [`hmrc_cache_info()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_cache_info.md)
  returns a tidy table of cached files with size, modified time, and age
  in days. The cache directory is attached as the `"cache_dir"`
  attribute.

#### Renamed: `get_*` -\> `hmrc_*`

All exported data functions adopt the `hmrc_*` prefix to match sibling
packages and improve discoverability:

| Before | After |
|----|----|
| [`get_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_receipts.md) |
| [`get_vat()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_vat()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_vat.md) |
| [`get_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_fuel_duties.md) |
| [`get_tobacco_duties()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_tobacco_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tobacco_duties.md) |
| [`get_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_corporation_tax.md) |
| [`get_stamp_duty()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_stamp_duty()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_stamp_duty.md) |
| [`get_property_transactions()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_property_transactions()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_property_transactions.md) |
| [`get_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_income_tax_stats.md) |
| [`get_rd_credits()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_rd_credits()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_rd_credits.md) |
| [`get_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_gap.md) |
| [`list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_list_tax_heads.md) |
| [`clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md) | [`hmrc_clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_clear_cache.md) |

The old `get_*` and
[`clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md)
/
[`list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md)
names continue to work but emit a one-time-per-session deprecation
warning via
[`lifecycle::deprecate_warn()`](https://lifecycle.r-lib.org/reference/deprecate_soft.html).
They will be removed in v0.6.0.

#### Citation infrastructure

- New `inst/CITATION` so `citation("hmrc")` returns a structured
  citation.
- New `CITATION.cff` at the repo root for the GitHub citation widget and
  Zenodo DOI deposit.

#### Internals

- `resolve_govuk_url()` is now a thin wrapper around new
  `resolve_govuk_attachment()`, which returns both the publication page
  URL and the attachment URL plus public-update timestamp. This enables
  every `hmrc_*` function to record a stable source URL on every result.
- New `Imports`: `lifecycle` (for deprecation warnings), `utils`.

## hmrc 0.3.3

- [`get_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md)
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
  [`get_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  annual Income Tax liabilities by income range, including taxpayer
  counts, total income, tax liabilities, and average tax rates (Table
  2.5).

## hmrc 0.2.0

- Added
  [`get_vat()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  monthly VAT receipts by component (payments, repayments, import VAT,
  home VAT) from April 1973.
- Added
  [`get_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  monthly hydrocarbon oil duty receipts by fuel type (petrol, diesel,
  other) from January 1990.
- Added
  [`get_tobacco_duties()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  monthly tobacco duty receipts by product (cigarettes, cigars,
  hand-rolling, other) from January 1991.
- Added
  [`get_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  annual Corporation Tax receipts by levy type (onshore, offshore, Bank
  Levy, Bank Surcharge, RPDT, EPL, EGL) from 2019-20.
- Added
  [`get_stamp_duty()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  annual stamp duty receipts by type (SDLT, SDRT, stamp duty on
  documents) from 2003-04.
- Added
  [`get_rd_credits()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  annual R&D tax credit claims and cost by scheme (SME R&D Relief and
  RDEC) from 2000-01.
- Added
  [`get_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  cross-sectional tax gap estimates by tax type, taxpayer group, and
  behaviour component for the most recent year.
- Updated DESCRIPTION to reflect full package scope.
- Updated vignette to cover all functions.

## hmrc 0.1.0

- Initial release.
- [`get_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  monthly cash receipts for 41 tax heads, April 2016 to present.
- [`list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  catalogue of available tax head identifiers.
- [`get_property_transactions()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  monthly residential and non-residential property transaction counts by
  UK nation, April 2005 to present.
- [`clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/deprecated.md):
  delete locally cached HMRC files.
