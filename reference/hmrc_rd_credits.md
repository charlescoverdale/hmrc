# Download HMRC R&D tax credit statistics

Downloads and tidies the HMRC Research and Development Tax Credits
Statistics publication, covering the SME R&D Relief and Research and
Development Expenditure Credit (RDEC) schemes. Annual data runs from
2000-01 to the most recent financial year, published annually in
September.

## Usage

``` r
hmrc_rd_credits(scheme = NULL, measure = NULL, cache = TRUE)
```

## Source

<https://www.gov.uk/government/statistics/corporate-tax-research-and-development-tax-credit>

## Arguments

- scheme:

  Character vector or `NULL` (default = all schemes). Valid values:
  `"sme"`, `"rdec"`, `"total"`.

- measure:

  Character vector or `NULL` (default = all measures). Valid values:
  `"claims"`, `"amount_gbp_m"`.

- cache:

  Logical. Use cached file if available (default `TRUE`).

## Value

An `hmrc_tbl` with columns `tax_year`, `scheme`, `description`,
`measure`, `value`.

## Details

Data before 2003-04 covers only the SME scheme (RDEC was introduced in
2002). Figures for the most recent two years are provisional and subject
to revision as late claims are processed.

## See also

Other data fetchers:
[`hmrc_capital_gains()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_capital_gains.md),
[`hmrc_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_corporation_tax.md),
[`hmrc_creative_industries()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_creative_industries.md),
[`hmrc_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_fuel_duties.md),
[`hmrc_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_income_tax_stats.md),
[`hmrc_inheritance_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_inheritance_tax.md),
[`hmrc_patent_box()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_patent_box.md),
[`hmrc_property_transactions()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_property_transactions.md),
[`hmrc_stamp_duty()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_stamp_duty.md),
[`hmrc_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_gap.md),
[`hmrc_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_receipts.md),
[`hmrc_tobacco_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tobacco_duties.md),
[`hmrc_vat()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_vat.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
hmrc_rd_credits()
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [129ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [561ms]
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
#> • `` -> `...8`
#> • `` -> `...9`
#> • `` -> `...10`
#> • `` -> `...11`
#> • `` -> `...12`
#> • `` -> `...13`
#> • `` -> `...14`
#> • `` -> `...15`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> • `` -> `...7`
#> • `` -> `...8`
#> • `` -> `...9`
#> • `` -> `...10`
#> • `` -> `...11`
#> ✔ Parsing data [218ms]
#> 
#> # R&D Tax Credits Statistics
#> # Source: https://www.gov.uk/government/statistics/corporate-tax-research-and-development-tax-credit
#> # Fetched 2026-05-04 19:13:21 UTC | Vintage: latest | Cells: counts/cash | Freq: annual | 144 rows x 5 cols
#> 
#>     tax_year scheme                   description      measure value
#> 1    2000-01   rdec R&D Expenditure Credit (RDEC) amount_gbp_m    NA
#> 2    2001-02   rdec R&D Expenditure Credit (RDEC) amount_gbp_m    NA
#> 3    2002-03   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   200
#> 4    2003-04   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   340
#> 5    2004-05   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   400
#> 6    2005-06   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   460
#> 7    2006-07   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   490
#> 8    2007-08   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   560
#> 9    2008-09   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   740
#> 10   2009-10   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   690
#> 11   2010-11   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   760
#> 12   2011-12   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   790
#> 13   2012-13   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   770
#> 14   2013-14   rdec R&D Expenditure Credit (RDEC) amount_gbp_m   930
#> 15   2014-15   rdec R&D Expenditure Credit (RDEC) amount_gbp_m  1710
#> 16   2015-16   rdec R&D Expenditure Credit (RDEC) amount_gbp_m  2215
#> 17   2016-17   rdec R&D Expenditure Credit (RDEC) amount_gbp_m  2225
#> 18   2017-18   rdec R&D Expenditure Credit (RDEC) amount_gbp_m  2415
#> 19   2018-19   rdec R&D Expenditure Credit (RDEC) amount_gbp_m  2800
#> 20   2019-20   rdec R&D Expenditure Credit (RDEC) amount_gbp_m  2710
#> 21   2020-21   rdec R&D Expenditure Credit (RDEC) amount_gbp_m  2655
#> 22   2021-22   rdec R&D Expenditure Credit (RDEC) amount_gbp_m  2980
#> 23   2022-23   rdec R&D Expenditure Credit (RDEC) amount_gbp_m  3245
#> 24   2023-24   rdec R&D Expenditure Credit (RDEC) amount_gbp_m  4405
#> 25   2000-01   rdec R&D Expenditure Credit (RDEC)       claims    NA
#> 26   2001-02   rdec R&D Expenditure Credit (RDEC)       claims    NA
#> 27   2002-03   rdec R&D Expenditure Credit (RDEC)       claims   690
#> 28   2003-04   rdec R&D Expenditure Credit (RDEC)       claims  1050
#> 29   2004-05   rdec R&D Expenditure Credit (RDEC)       claims  1310
#> 30   2005-06   rdec R&D Expenditure Credit (RDEC)       claims  1490
#> 31   2006-07   rdec R&D Expenditure Credit (RDEC)       claims  1670
#> 32   2007-08   rdec R&D Expenditure Credit (RDEC)       claims  2030
#> 33   2008-09   rdec R&D Expenditure Credit (RDEC)       claims  2260
#> 34   2009-10   rdec R&D Expenditure Credit (RDEC)       claims  2320
#> 35   2010-11   rdec R&D Expenditure Credit (RDEC)       claims  2490
#> 36   2011-12   rdec R&D Expenditure Credit (RDEC)       claims  2660
#> 37   2012-13   rdec R&D Expenditure Credit (RDEC)       claims  2960
#> 38   2013-14   rdec R&D Expenditure Credit (RDEC)       claims  3750
#> 39   2014-15   rdec R&D Expenditure Credit (RDEC)       claims  5785
#> 40   2015-16   rdec R&D Expenditure Credit (RDEC)       claims  6560
#> 41   2016-17   rdec R&D Expenditure Credit (RDEC)       claims  7575
#> 42   2017-18   rdec R&D Expenditure Credit (RDEC)       claims  8380
#> 43   2018-19   rdec R&D Expenditure Credit (RDEC)       claims  8595
#> 44   2019-20   rdec R&D Expenditure Credit (RDEC)       claims  9815
#> 45   2020-21   rdec R&D Expenditure Credit (RDEC)       claims 11045
#> 46   2021-22   rdec R&D Expenditure Credit (RDEC)       claims 11415
#> 47   2022-23   rdec R&D Expenditure Credit (RDEC)       claims 10635
#> 48   2023-24   rdec R&D Expenditure Credit (RDEC)       claims 10065
#> 49   2000-01    sme                SME R&D Relief amount_gbp_m    70
#> 50   2001-02    sme                SME R&D Relief amount_gbp_m   170
#> 51   2002-03    sme                SME R&D Relief amount_gbp_m   210
#> 52   2003-04    sme                SME R&D Relief amount_gbp_m   195
#> 53   2004-05    sme                SME R&D Relief amount_gbp_m   190
#> 54   2005-06    sme                SME R&D Relief amount_gbp_m   185
#> 55   2006-07    sme                SME R&D Relief amount_gbp_m   200
#> 56   2007-08    sme                SME R&D Relief amount_gbp_m   245
#> 57   2008-09    sme                SME R&D Relief amount_gbp_m   265
#> 58   2009-10    sme                SME R&D Relief amount_gbp_m   320
#> 59   2010-11    sme                SME R&D Relief amount_gbp_m   355
#> 60   2011-12    sme                SME R&D Relief amount_gbp_m   435
#> 61   2012-13    sme                SME R&D Relief amount_gbp_m   615
#> 62   2013-14    sme                SME R&D Relief amount_gbp_m   705
#> 63   2014-15    sme                SME R&D Relief amount_gbp_m  1315
#> 64   2015-16    sme                SME R&D Relief amount_gbp_m  1760
#> 65   2016-17    sme                SME R&D Relief amount_gbp_m  2265
#> 66   2017-18    sme                SME R&D Relief amount_gbp_m  2740
#> 67   2018-19    sme                SME R&D Relief amount_gbp_m  3510
#> 68   2019-20    sme                SME R&D Relief amount_gbp_m  4185
#> 69   2020-21    sme                SME R&D Relief amount_gbp_m  4200
#> 70   2021-22    sme                SME R&D Relief amount_gbp_m  4620
#> 71   2022-23    sme                SME R&D Relief amount_gbp_m  4440
#> 72   2023-24    sme                SME R&D Relief amount_gbp_m  3145
#> 73   2000-01    sme                SME R&D Relief       claims  1860
#> 74   2001-02    sme                SME R&D Relief       claims  3410
#> 75   2002-03    sme                SME R&D Relief       claims  4640
#> 76   2003-04    sme                SME R&D Relief       claims  5160
#> 77   2004-05    sme                SME R&D Relief       claims  5310
#> 78   2005-06    sme                SME R&D Relief       claims  4960
#> 79   2006-07    sme                SME R&D Relief       claims  5270
#> 80   2007-08    sme                SME R&D Relief       claims  5990
#> 81   2008-09    sme                SME R&D Relief       claims  6670
#> 82   2009-10    sme                SME R&D Relief       claims  7470
#> 83   2010-11    sme                SME R&D Relief       claims  8280
#> 84   2011-12    sme                SME R&D Relief       claims 10030
#> 85   2012-13    sme                SME R&D Relief       claims 13140
#> 86   2013-14    sme                SME R&D Relief       claims 15585
#> 87   2014-15    sme                SME R&D Relief       claims 29775
#> 88   2015-16    sme                SME R&D Relief       claims 37105
#> 89   2016-17    sme                SME R&D Relief       claims 45440
#> 90   2017-18    sme                SME R&D Relief       claims 53910
#> 91   2018-19    sme                SME R&D Relief       claims 65940
#> 92   2019-20    sme                SME R&D Relief       claims 74190
#> 93   2020-21    sme                SME R&D Relief       claims 76135
#> 94   2021-22    sme                SME R&D Relief       claims 71805
#> 95   2022-23    sme                SME R&D Relief       claims 53150
#> 96   2023-24    sme                SME R&D Relief       claims 36885
#> 97   2000-01  total               All R&D schemes amount_gbp_m    70
#> 98   2001-02  total               All R&D schemes amount_gbp_m   170
#> 99   2002-03  total               All R&D schemes amount_gbp_m   410
#> 100  2003-04  total               All R&D schemes amount_gbp_m   540
#> 101  2004-05  total               All R&D schemes amount_gbp_m   590
#> 102  2005-06  total               All R&D schemes amount_gbp_m   640
#> 103  2006-07  total               All R&D schemes amount_gbp_m   690
#> 104  2007-08  total               All R&D schemes amount_gbp_m   810
#> 105  2008-09  total               All R&D schemes amount_gbp_m  1000
#> 106  2009-10  total               All R&D schemes amount_gbp_m  1010
#> 107  2010-11  total               All R&D schemes amount_gbp_m  1110
#> 108  2011-12  total               All R&D schemes amount_gbp_m  1220
#> 109  2012-13  total               All R&D schemes amount_gbp_m  1370
#> 110  2013-14  total               All R&D schemes amount_gbp_m  1640
#> 111  2014-15  total               All R&D schemes amount_gbp_m  3025
#> 112  2015-16  total               All R&D schemes amount_gbp_m  3975
#> 113  2016-17  total               All R&D schemes amount_gbp_m  4490
#> 114  2017-18  total               All R&D schemes amount_gbp_m  5150
#> 115  2018-19  total               All R&D schemes amount_gbp_m  6310
#> 116  2019-20  total               All R&D schemes amount_gbp_m  6890
#> 117  2020-21  total               All R&D schemes amount_gbp_m  6855
#> 118  2021-22  total               All R&D schemes amount_gbp_m  7600
#> 119  2022-23  total               All R&D schemes amount_gbp_m  7690
#> 120  2023-24  total               All R&D schemes amount_gbp_m  7555
#> 121  2000-01  total               All R&D schemes       claims  1860
#> 122  2001-02  total               All R&D schemes       claims  3410
#> 123  2002-03  total               All R&D schemes       claims  5320
#> 124  2003-04  total               All R&D schemes       claims  6210
#> 125  2004-05  total               All R&D schemes       claims  6620
#> 126  2005-06  total               All R&D schemes       claims  6450
#> 127  2006-07  total               All R&D schemes       claims  6940
#> 128  2007-08  total               All R&D schemes       claims  8020
#> 129  2008-09  total               All R&D schemes       claims  8920
#> 130  2009-10  total               All R&D schemes       claims  9770
#> 131  2010-11  total               All R&D schemes       claims 10750
#> 132  2011-12  total               All R&D schemes       claims 12670
#> 133  2012-13  total               All R&D schemes       claims 16070
#> 134  2013-14  total               All R&D schemes       claims 19335
#> 135  2014-15  total               All R&D schemes       claims 35565
#> 136  2015-16  total               All R&D schemes       claims 43665
#> 137  2016-17  total               All R&D schemes       claims 53015
#> 138  2017-18  total               All R&D schemes       claims 62290
#> 139  2018-19  total               All R&D schemes       claims 74535
#> 140  2019-20  total               All R&D schemes       claims 84005
#> 141  2020-21  total               All R&D schemes       claims 87180
#> 142  2021-22  total               All R&D schemes       claims 83220
#> 143  2022-23  total               All R&D schemes       claims 63780
#> 144  2023-24  total               All R&D schemes       claims 46950
hmrc_rd_credits(scheme = "sme", measure = "claims")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [14ms]
#> 
#> ℹ Using cached file
#> ✔ Using cached file [6ms]
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
#> • `` -> `...8`
#> • `` -> `...9`
#> • `` -> `...10`
#> • `` -> `...11`
#> • `` -> `...12`
#> • `` -> `...13`
#> • `` -> `...14`
#> • `` -> `...15`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> • `` -> `...7`
#> • `` -> `...8`
#> • `` -> `...9`
#> • `` -> `...10`
#> • `` -> `...11`
#> ✔ Parsing data [217ms]
#> 
#> # R&D Tax Credits Statistics
#> # Source: https://www.gov.uk/government/statistics/corporate-tax-research-and-development-tax-credit
#> # Fetched 2026-05-04 19:13:21 UTC | Vintage: latest | Cells: counts/cash | Freq: annual | 24 rows x 5 cols
#> 
#>    tax_year scheme    description measure value
#> 1   2000-01    sme SME R&D Relief  claims  1860
#> 2   2001-02    sme SME R&D Relief  claims  3410
#> 3   2002-03    sme SME R&D Relief  claims  4640
#> 4   2003-04    sme SME R&D Relief  claims  5160
#> 5   2004-05    sme SME R&D Relief  claims  5310
#> 6   2005-06    sme SME R&D Relief  claims  4960
#> 7   2006-07    sme SME R&D Relief  claims  5270
#> 8   2007-08    sme SME R&D Relief  claims  5990
#> 9   2008-09    sme SME R&D Relief  claims  6670
#> 10  2009-10    sme SME R&D Relief  claims  7470
#> 11  2010-11    sme SME R&D Relief  claims  8280
#> 12  2011-12    sme SME R&D Relief  claims 10030
#> 13  2012-13    sme SME R&D Relief  claims 13140
#> 14  2013-14    sme SME R&D Relief  claims 15585
#> 15  2014-15    sme SME R&D Relief  claims 29775
#> 16  2015-16    sme SME R&D Relief  claims 37105
#> 17  2016-17    sme SME R&D Relief  claims 45440
#> 18  2017-18    sme SME R&D Relief  claims 53910
#> 19  2018-19    sme SME R&D Relief  claims 65940
#> 20  2019-20    sme SME R&D Relief  claims 74190
#> 21  2020-21    sme SME R&D Relief  claims 76135
#> 22  2021-22    sme SME R&D Relief  claims 71805
#> 23  2022-23    sme SME R&D Relief  claims 53150
#> 24  2023-24    sme SME R&D Relief  claims 36885
options(op)
# }
```
