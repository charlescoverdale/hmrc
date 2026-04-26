# Download HMRC Corporation Tax receipts by type

Downloads and tidies the HMRC Corporation Tax Statistics annual
publication, reporting receipts broken down by tax type for the most
recent six financial years. Published annually in September.

## Usage

``` r
hmrc_corporation_tax(cache = TRUE)
```

## Source

<https://www.gov.uk/government/collections/analyses-of-corporation-tax-receipts-and-liabilities>

## Arguments

- cache:

  Logical. Use cached file if available (default `TRUE`).

## Value

An `hmrc_tbl` with columns `tax_year`, `type`, `description`,
`receipts_gbp_m`.

## Details

Some levies (e.g. Residential Property Developer Tax, Electricity
Generators Levy) were introduced mid-series and have `NA` values for
earlier years.

## See also

Other data fetchers:
[`hmrc_capital_gains()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_capital_gains.md),
[`hmrc_creative_industries()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_creative_industries.md),
[`hmrc_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_fuel_duties.md),
[`hmrc_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_income_tax_stats.md),
[`hmrc_inheritance_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_inheritance_tax.md),
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
hmrc_corporation_tax()
#> ℹ Resolving download URL from GOV.UK Content API
#> ✖ Resolving download URL from GOV.UK Content API [969ms]
#> 
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [178ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [813ms]
#> 
#> ℹ Parsing data
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> • `` -> `...7`
#> ✔ Parsing data [104ms]
#> 
#> # Corporation Tax statistics
#> # Source: https://www.gov.uk/government/statistics/corporation-tax-statistics-2025
#> # Fetched 2026-04-26 13:11:17 UTC | Vintage: latest | Cells: cash | Freq: annual | 54 rows x 4 cols
#> 
#>    tax_year                        type
#> 1   2019-20         all_corporate_taxes
#> 2   2020-21         all_corporate_taxes
#> 3   2021-22         all_corporate_taxes
#> 4   2022-23         all_corporate_taxes
#> 5   2023-24         all_corporate_taxes
#> 6   2024-25         all_corporate_taxes
#> 7   2019-20                   bank_levy
#> 8   2020-21                   bank_levy
#> 9   2021-22                   bank_levy
#> 10  2022-23                   bank_levy
#> 11  2023-24                   bank_levy
#> 12  2024-25                   bank_levy
#> 13  2019-20              bank_surcharge
#> 14  2020-21              bank_surcharge
#> 15  2021-22              bank_surcharge
#> 16  2022-23              bank_surcharge
#> 17  2023-24              bank_surcharge
#> 18  2024-25              bank_surcharge
#> 19  2019-20 electricity_generators_levy
#> 20  2020-21 electricity_generators_levy
#> 21  2021-22 electricity_generators_levy
#> 22  2022-23 electricity_generators_levy
#> 23  2023-24 electricity_generators_levy
#> 24  2024-25 electricity_generators_levy
#> 25  2019-20         energy_profits_levy
#> 26  2020-21         energy_profits_levy
#> 27  2021-22         energy_profits_levy
#> 28  2022-23         energy_profits_levy
#> 29  2023-24         energy_profits_levy
#> 30  2024-25         energy_profits_levy
#> 31  2019-20                 offshore_ct
#> 32  2020-21                 offshore_ct
#> 33  2021-22                 offshore_ct
#> 34  2022-23                 offshore_ct
#> 35  2023-24                 offshore_ct
#> 36  2024-25                 offshore_ct
#> 37  2019-20                  onshore_ct
#> 38  2020-21                  onshore_ct
#> 39  2021-22                  onshore_ct
#> 40  2022-23                  onshore_ct
#> 41  2023-24                  onshore_ct
#> 42  2024-25                  onshore_ct
#> 43  2019-20                        rpdt
#> 44  2020-21                        rpdt
#> 45  2021-22                        rpdt
#> 46  2022-23                        rpdt
#> 47  2023-24                        rpdt
#> 48  2024-25                        rpdt
#> 49  2019-20                    total_ct
#> 50  2020-21                    total_ct
#> 51  2021-22                    total_ct
#> 52  2022-23                    total_ct
#> 53  2023-24                    total_ct
#> 54  2024-25                    total_ct
#>                                              description receipts_gbp_m
#> 1                                    All Corporate Taxes          66025
#> 2                                    All Corporate Taxes          54238
#> 3                                    All Corporate Taxes          67548
#> 4                                    All Corporate Taxes          84595
#> 5                                    All Corporate Taxes          93675
#> 6                                    All Corporate Taxes          97161
#> 7                                         Bank Levy (BL)           2472
#> 8                                         Bank Levy (BL)           2343
#> 9                                         Bank Levy (BL)           1469
#> 10                                        Bank Levy (BL)           1332
#> 11                                        Bank Levy (BL)           1428
#> 12                                        Bank Levy (BL)           1320
#> 13                                   Bank Surcharge (BS)           1988
#> 14                                   Bank Surcharge (BS)           1409
#> 15                                   Bank Surcharge (BS)           2335
#> 16                                   Bank Surcharge (BS)           2580
#> 17                                   Bank Surcharge (BS)           1446
#> 18                                   Bank Surcharge (BS)            974
#> 19                      Electricity Generator Levy (EGL)             NA
#> 20                      Electricity Generator Levy (EGL)             NA
#> 21                      Electricity Generator Levy (EGL)             NA
#> 22                      Electricity Generator Levy (EGL)             NA
#> 23                      Electricity Generator Levy (EGL)           1473
#> 24                      Electricity Generator Levy (EGL)            749
#> 25                             Energy Profits Levy (EPL)             NA
#> 26                             Energy Profits Levy (EPL)             NA
#> 27                             Energy Profits Levy (EPL)             NA
#> 28                             Energy Profits Levy (EPL)           2632
#> 29                             Energy Profits Levy (EPL)           3587
#> 30                             Energy Profits Levy (EPL)           2857
#> 31              Offshore Corporation Tax (excluding EPL)           1274
#> 32              Offshore Corporation Tax (excluding EPL)            498
#> 33              Offshore Corporation Tax (excluding EPL)           1996
#> 34              Offshore Corporation Tax (excluding EPL)           6613
#> 35              Offshore Corporation Tax (excluding EPL)           2951
#> 36              Offshore Corporation Tax (excluding EPL)           1962
#> 37 Onshore Corporation Tax (excluding BL, BS, RPDT, EGL)          60292
#> 38 Onshore Corporation Tax (excluding BL, BS, RPDT, EGL)          49988
#> 39 Onshore Corporation Tax (excluding BL, BS, RPDT, EGL)          61749
#> 40 Onshore Corporation Tax (excluding BL, BS, RPDT, EGL)          71281
#> 41 Onshore Corporation Tax (excluding BL, BS, RPDT, EGL)          82686
#> 42 Onshore Corporation Tax (excluding BL, BS, RPDT, EGL)          89197
#> 43             Residential Property Developer Tax (RPDT)             NA
#> 44             Residential Property Developer Tax (RPDT)             NA
#> 45             Residential Property Developer Tax (RPDT)             NA
#> 46             Residential Property Developer Tax (RPDT)            157
#> 47             Residential Property Developer Tax (RPDT)            103
#> 48             Residential Property Developer Tax (RPDT)            102
#> 49            Total onshore and offshore Corporation Tax          61565
#> 50            Total onshore and offshore Corporation Tax          50486
#> 51            Total onshore and offshore Corporation Tax          63745
#> 52            Total onshore and offshore Corporation Tax          77894
#> 53            Total onshore and offshore Corporation Tax          85637
#> 54            Total onshore and offshore Corporation Tax          91159
options(op)
# }
```
