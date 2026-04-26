# Download HMRC Inheritance Tax liabilities by estate band

Downloads and tidies HMRC Table 12.1a of the Inheritance Tax Liabilities
Statistics: numbers of estates, tax due, average tax, and average
effective tax rate, broken down by net-estate band, for the latest
published year of death. Published annually in July, ~3 years after the
year of death due to the administration window.

## Usage

``` r
hmrc_inheritance_tax(cache = TRUE)
```

## Source

<https://www.gov.uk/government/statistics/inheritance-tax-liabilities-statistics>

## Arguments

- cache:

  Logical. Use cached file if available (default `TRUE`).

## Value

An `hmrc_tbl` (long format) with columns:

- tax_year:

  Character. Year of death, e.g. `"2022-23"`.

- estate_band_lower_gbp:

  Numeric. Lower limit of the net-estate band in pounds.

- estate_band:

  Character. Plain-English label, e.g. `"GBP 0-100k"`, `"Total"`.

- measure:

  Character. One of `"number_not_taxed"`, `"number_taxed"`,
  `"tax_due_gbp_m"`, `"avg_tax_gbp"`, `"effective_rate_pct"`.

- value:

  Numeric. Value, with `[z]` (no tax due to NRB) and `[c]` (disclosure
  suppression) returned as `NA`.

## See also

Other data fetchers:
[`hmrc_capital_gains()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_capital_gains.md),
[`hmrc_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_corporation_tax.md),
[`hmrc_creative_industries()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_creative_industries.md),
[`hmrc_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_fuel_duties.md),
[`hmrc_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_income_tax_stats.md),
[`hmrc_patent_box()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_patent_box.md),
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
hmrc_inheritance_tax()
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [138ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [411ms]
#> 
#> ℹ Parsing data
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> ✔ Parsing data [56ms]
#> 
#> # Inheritance Tax liabilities statistics (Table 12.1a)
#> # Source: https://www.gov.uk/government/statistics/inheritance-tax-liabilities-statistics
#> # Fetched 2026-04-26 13:01:57 UTC | Vintage: latest | Cells: liabilities | Freq: annual | 95 rows x 5 cols
#> 
#>    tax_year estate_band_lower_gbp   estate_band            measure    value
#> 1   2022-23               0.0e+00    GBP 0-100k        avg_tax_gbp       NA
#> 2   2022-23               0.0e+00    GBP 0-100k effective_rate_pct       NA
#> 3   2022-23               0.0e+00    GBP 0-100k   number_not_taxed 7.52e+02
#> 4   2022-23               0.0e+00    GBP 0-100k       number_taxed       NA
#> 5   2022-23               0.0e+00    GBP 0-100k      tax_due_gbp_m       NA
#> 6   2022-23               1.0e+05 GBP 100k-200k        avg_tax_gbp       NA
#> 7   2022-23               1.0e+05 GBP 100k-200k effective_rate_pct       NA
#> 8   2022-23               1.0e+05 GBP 100k-200k   number_not_taxed 8.71e+02
#> 9   2022-23               1.0e+05 GBP 100k-200k       number_taxed       NA
#> 10  2022-23               1.0e+05 GBP 100k-200k      tax_due_gbp_m       NA
#> 11  2022-23               2.0e+05 GBP 200k-300k        avg_tax_gbp       NA
#> 12  2022-23               2.0e+05 GBP 200k-300k effective_rate_pct       NA
#> 13  2022-23               2.0e+05 GBP 200k-300k   number_not_taxed 2.06e+03
#> 14  2022-23               2.0e+05 GBP 200k-300k       number_taxed       NA
#> 15  2022-23               2.0e+05 GBP 200k-300k      tax_due_gbp_m       NA
#> 16  2022-23               3.0e+05 GBP 300k-400k        avg_tax_gbp 1.35e+04
#> 17  2022-23               3.0e+05 GBP 300k-400k effective_rate_pct 4.00e-02
#> 18  2022-23               3.0e+05 GBP 300k-400k   number_not_taxed 7.71e+03
#> 19  2022-23               3.0e+05 GBP 300k-400k       number_taxed 2.42e+03
#> 20  2022-23               3.0e+05 GBP 300k-400k      tax_due_gbp_m 3.30e+01
#> 21  2022-23               4.0e+05 GBP 400k-500k        avg_tax_gbp 4.25e+04
#> 22  2022-23               4.0e+05 GBP 400k-500k effective_rate_pct 9.00e-02
#> 23  2022-23               4.0e+05 GBP 400k-500k   number_not_taxed 8.64e+03
#> 24  2022-23               4.0e+05 GBP 400k-500k       number_taxed 2.73e+03
#> 25  2022-23               4.0e+05 GBP 400k-500k      tax_due_gbp_m 1.16e+02
#> 26  2022-23               5.0e+05 GBP 500k-600k        avg_tax_gbp 5.20e+04
#> 27  2022-23               5.0e+05 GBP 500k-600k effective_rate_pct 9.00e-02
#> 28  2022-23               5.0e+05 GBP 500k-600k   number_not_taxed 2.96e+03
#> 29  2022-23               5.0e+05 GBP 500k-600k       number_taxed 3.25e+03
#> 30  2022-23               5.0e+05 GBP 500k-600k      tax_due_gbp_m 1.69e+02
#> 31  2022-23               6.0e+05 GBP 600k-700k        avg_tax_gbp 7.45e+04
#> 32  2022-23               6.0e+05 GBP 600k-700k effective_rate_pct 1.20e-01
#> 33  2022-23               6.0e+05 GBP 600k-700k   number_not_taxed 3.86e+03
#> 34  2022-23               6.0e+05 GBP 600k-700k       number_taxed 2.60e+03
#> 35  2022-23               6.0e+05 GBP 600k-700k      tax_due_gbp_m 1.94e+02
#> 36  2022-23               7.0e+05 GBP 700k-800k        avg_tax_gbp 9.07e+04
#> 37  2022-23               7.0e+05 GBP 700k-800k effective_rate_pct 1.20e-01
#> 38  2022-23               7.0e+05 GBP 700k-800k   number_not_taxed 3.70e+03
#> 39  2022-23               7.0e+05 GBP 700k-800k       number_taxed 2.45e+03
#> 40  2022-23               7.0e+05 GBP 700k-800k      tax_due_gbp_m 2.22e+02
#> 41  2022-23               8.0e+05 GBP 800k-900k        avg_tax_gbp 1.11e+05
#> 42  2022-23               8.0e+05 GBP 800k-900k effective_rate_pct 1.30e-01
#> 43  2022-23               8.0e+05 GBP 800k-900k   number_not_taxed 2.84e+03
#> 44  2022-23               8.0e+05 GBP 800k-900k       number_taxed 1.99e+03
#> 45  2022-23               8.0e+05 GBP 800k-900k      tax_due_gbp_m 2.21e+02
#> 46  2022-23               9.0e+05   GBP 900k-1m        avg_tax_gbp 1.30e+05
#> 47  2022-23               9.0e+05   GBP 900k-1m effective_rate_pct 1.40e-01
#> 48  2022-23               9.0e+05   GBP 900k-1m   number_not_taxed 1.94e+03
#> 49  2022-23               9.0e+05   GBP 900k-1m       number_taxed 1.81e+03
#> 50  2022-23               9.0e+05   GBP 900k-1m      tax_due_gbp_m 2.35e+02
#> 51  2022-23               1.0e+06   GBP 1m-1.5m        avg_tax_gbp 1.53e+05
#> 52  2022-23               1.0e+06   GBP 1m-1.5m effective_rate_pct 1.20e-01
#> 53  2022-23               1.0e+06   GBP 1m-1.5m   number_not_taxed 1.18e+03
#> 54  2022-23               1.0e+06   GBP 1m-1.5m       number_taxed 7.89e+03
#> 55  2022-23               1.0e+06   GBP 1m-1.5m      tax_due_gbp_m 1.21e+03
#> 56  2022-23               1.5e+06   GBP 1.5m-2m        avg_tax_gbp 3.22e+05
#> 57  2022-23               1.5e+06   GBP 1.5m-2m effective_rate_pct 1.90e-01
#> 58  2022-23               1.5e+06   GBP 1.5m-2m   number_not_taxed 2.63e+02
#> 59  2022-23               1.5e+06   GBP 1.5m-2m       number_taxed 2.78e+03
#> 60  2022-23               1.5e+06   GBP 1.5m-2m      tax_due_gbp_m 8.94e+02
#> 61  2022-23               2.0e+06     GBP 2m-3m        avg_tax_gbp 5.61e+05
#> 62  2022-23               2.0e+06     GBP 2m-3m effective_rate_pct 2.30e-01
#> 63  2022-23               2.0e+06     GBP 2m-3m   number_not_taxed 4.64e+02
#> 64  2022-23               2.0e+06     GBP 2m-3m       number_taxed 1.98e+03
#> 65  2022-23               2.0e+06     GBP 2m-3m      tax_due_gbp_m 1.11e+03
#> 66  2022-23               3.0e+06     GBP 3m-4m        avg_tax_gbp 8.73e+05
#> 67  2022-23               3.0e+06     GBP 3m-4m effective_rate_pct 2.60e-01
#> 68  2022-23               3.0e+06     GBP 3m-4m   number_not_taxed       NA
#> 69  2022-23               3.0e+06     GBP 3m-4m       number_taxed 6.71e+02
#> 70  2022-23               3.0e+06     GBP 3m-4m      tax_due_gbp_m 5.86e+02
#> 71  2022-23               4.0e+06     GBP 4m-5m        avg_tax_gbp 1.04e+06
#> 72  2022-23               4.0e+06     GBP 4m-5m effective_rate_pct 2.30e-01
#> 73  2022-23               4.0e+06     GBP 4m-5m   number_not_taxed       NA
#> 74  2022-23               4.0e+06     GBP 4m-5m       number_taxed 3.40e+02
#> 75  2022-23               4.0e+06     GBP 4m-5m      tax_due_gbp_m 3.52e+02
#> 76  2022-23               5.0e+06   GBP 5m-7.5m        avg_tax_gbp 1.38e+06
#> 77  2022-23               5.0e+06   GBP 5m-7.5m effective_rate_pct 2.30e-01
#> 78  2022-23               5.0e+06   GBP 5m-7.5m   number_not_taxed       NA
#> 79  2022-23               5.0e+06   GBP 5m-7.5m       number_taxed 3.07e+02
#> 80  2022-23               5.0e+06   GBP 5m-7.5m      tax_due_gbp_m 4.25e+02
#> 81  2022-23               7.5e+06  GBP 7.5m-10m        avg_tax_gbp 1.67e+06
#> 82  2022-23               7.5e+06  GBP 7.5m-10m effective_rate_pct 2.00e-01
#> 83  2022-23               7.5e+06  GBP 7.5m-10m   number_not_taxed       NA
#> 84  2022-23               7.5e+06  GBP 7.5m-10m       number_taxed 1.20e+02
#> 85  2022-23               7.5e+06  GBP 7.5m-10m      tax_due_gbp_m 2.01e+02
#> 86  2022-23               1.0e+07      GBP 10m+        avg_tax_gbp 3.63e+06
#> 87  2022-23               1.0e+07      GBP 10m+ effective_rate_pct 1.70e-01
#> 88  2022-23               1.0e+07      GBP 10m+   number_not_taxed       NA
#> 89  2022-23               1.0e+07      GBP 10m+       number_taxed 2.02e+02
#> 90  2022-23               1.0e+07      GBP 10m+      tax_due_gbp_m 7.34e+02
#> 91  2022-23                    NA         Total        avg_tax_gbp 2.12e+05
#> 92  2022-23                    NA         Total effective_rate_pct 1.30e-01
#> 93  2022-23                    NA         Total   number_not_taxed 3.77e+04
#> 94  2022-23                    NA         Total       number_taxed 3.15e+04
#> 95  2022-23                    NA         Total      tax_due_gbp_m 6.70e+03
options(op)
# }
```
