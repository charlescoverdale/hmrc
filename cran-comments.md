# CRAN submission comments — hmrc 0.3.0

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
  additional dependencies).
