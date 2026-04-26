# CRAN submission comments — hmrc 0.4.0

## Summary

Minor feature release of an existing CRAN package (current CRAN version: 0.3.3).
This is not a resubmission and does not address reviewer feedback; it adds new
data fetchers, attaches provenance metadata to results, and renames the
exported function family with a deprecation period for the old names.

## What's new since 0.3.3

* New `hmrc_tbl` S3 class (subclass of `data.frame`) with a `hmrc_meta`
  attribute carrying source URL, fetch time, vintage, cell methods, and
  frequency. Helper `hmrc_meta()` extracts the list. `print()`, `format()`,
  `as.data.frame()`, and `[` methods are provided.
* New dataset catalogue (`catalogue` data, `hmrc_search()`,
  `hmrc_publications()`) for keyword search and roadmap visibility.
* New cache inspection helper `hmrc_cache_info()`.
* Four new data fetchers: `hmrc_capital_gains()` (CGT Table 1, 1987-88+),
  `hmrc_inheritance_tax()` (IHT Table 12.1a estates by net-estate band),
  `hmrc_patent_box()` (Patent Box Table 1, 2013-14+), and
  `hmrc_creative_industries()` (Creative Industries Table 1 across eight
  sectors: film, high-end TV, animation, children's TV, video games,
  theatre, orchestra, museums and galleries).
* Renamed `get_*` exports to `hmrc_*` for consistency with sibling packages
  (`boe`, `fred`, `ons`, `obr`). The old names continue to work as deprecated
  aliases via `lifecycle::deprecate_warn()` and will be removed in v0.6.0.
* Added `inst/CITATION` and `CITATION.cff` for structured citation.

No CRAN policy changes; the cache-to-`tempdir()` redirect introduced in
0.3.1 is preserved for every example, and every network test continues to
skip on CRAN via `skip_on_cran()` and `skip_if_offline()`.

## Test environments

* macOS Sequoia 15.6.1, R 4.5.2 (aarch64-apple-darwin20) — local

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies

None — no reverse dependencies.

## Notes for CRAN reviewers

* All functions that make network requests are wrapped in `\donttest{}` in
  examples and `skip_on_cran()` + `skip_if_offline()` in tests.
* Download URLs for HMRC data files are resolved at runtime via the GOV.UK
  Content API (`https://www.gov.uk/api/content`) rather than hardcoded, as
  the underlying asset URLs rotate on each publication cycle.
* Local caching uses `tools::R_user_dir("hmrc", "cache")` (base R, no
  additional dependencies). In examples, caching is redirected to
  `tempdir()` via `options(hmrc.cache_dir = tempdir())` so that no files
  are written to the user's home filespace.
* The `lifecycle` import is new in this version; it is used solely to issue
  one-time-per-session deprecation warnings on the renamed `get_*`
  aliases.
