# CRAN submission comments — hmrc 0.3.2

## Resubmission

This is a resubmission addressing CRAN feedback (Prof Ripley, 2026-03-15).
Changes since hmrc 0.3.0 (currently on CRAN):

* Examples now cache to `tempdir()` instead of the user's home directory,
  fixing CRAN policy compliance for `\donttest` examples.
* Cache directory is now configurable via `options(hmrc.cache_dir = ...)`.
* Removed non-existent pkgdown URL from DESCRIPTION (was returning 404).

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
  Content API (`https://www.gov.uk/api/content`) rather than hardcoded, as the
  underlying asset URLs rotate on each publication cycle.
* Local caching uses `tools::R_user_dir("hmrc", "cache")` (base R, no
  additional dependencies). In examples, caching is redirected to `tempdir()`
  so that no files are written to the user's home filespace.
