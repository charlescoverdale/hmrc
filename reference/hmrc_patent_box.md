# Download HMRC Patent Box relief statistics

Downloads and tidies Table 1 of the HMRC Patent Box Relief Statistics:
annual number of companies electing into the Patent Box regime and the
total relief claimed (in GBP million). The Patent Box was introduced
from 1 April 2013; data runs from tax year 2013-14 to the most recent
published year (typically with a one-year provisional lag). Published
annually each September.

## Usage

``` r
hmrc_patent_box(tax_year = NULL, cache = TRUE)
```

## Source

<https://www.gov.uk/government/statistics/patent-box-reliefs-statistics>

## Arguments

- tax_year:

  Character vector or `NULL` (default = all years). Filter to specific
  tax years, e.g. `"2023-24"`.

- cache:

  Logical. Use cached file if available (default `TRUE`).

## Value

An `hmrc_tbl` with columns:

- tax_year:

  Character. Tax year, e.g. `"2023-24"`.

- companies:

  Numeric. Number of companies electing into the regime (rounded to
  nearest 5 by HMRC).

- relief_gbp_m:

  Numeric. Total relief in millions of pounds.

## See also

Other data fetchers:
[`hmrc_capital_gains()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_capital_gains.md),
[`hmrc_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_corporation_tax.md),
[`hmrc_creative_industries()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_creative_industries.md),
[`hmrc_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_fuel_duties.md),
[`hmrc_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_income_tax_stats.md),
[`hmrc_inheritance_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_inheritance_tax.md),
[`hmrc_property_transactions()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_property_transactions.md),
[`hmrc_rd_credits()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_rd_credits.md),
[`hmrc_stamp_duty()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_stamp_duty.md),
[`hmrc_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_gap.md),
[`hmrc_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_receipts.md),
[`hmrc_tobacco_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tobacco_duties.md),
[`hmrc_vat()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_vat.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
hmrc_patent_box()
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [444ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [380ms]
#> 
#> ℹ Parsing data
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> ✔ Parsing data [37ms]
#> 
#> # Patent Box reliefs statistics (Table 1)
#> # Source: https://www.gov.uk/government/statistics/patent-box-reliefs-statistics
#> # Fetched 2026-04-26 13:01:59 UTC | Vintage: latest | Cells: counts/cash | Freq: annual | 10 rows x 3 cols
#> 
#>    tax_year companies relief_gbp_m
#> 1   2013-14       835          376
#> 2   2014-15      1175          658
#> 3   2015-16      1295          770
#> 4   2016-17      1425         1047
#> 5   2017-18      1545         1142
#> 6   2018-19      1575         1164
#> 7   2019-20      1600         1240
#> 8   2020-21      1610         1198
#> 9   2021-22      1630         1326
#> 10  2022-23      1640         1449
hmrc_patent_box(tax_year = "2022-23")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [19ms]
#> 
#> ℹ Using cached file
#> ✔ Using cached file [5ms]
#> 
#> ℹ Parsing data
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> ✔ Parsing data [39ms]
#> 
#> # Patent Box reliefs statistics (Table 1)
#> # Source: https://www.gov.uk/government/statistics/patent-box-reliefs-statistics
#> # Fetched 2026-04-26 13:02:00 UTC | Vintage: latest | Cells: counts/cash | Freq: annual | 1 rows x 3 cols
#> 
#>   tax_year companies relief_gbp_m
#> 1  2022-23      1640         1449
options(op)
# }
```
