# Download HMRC stamp duty receipts

Downloads and tidies the HMRC Annual Stamp Tax Statistics, covering
Stamp Duty Land Tax (SDLT), Stamp Duty Reserve Tax (SDRT) on shares, and
other stamp duties. Annual data from 2003-04 to the most recent
financial year, published each December.

## Usage

``` r
hmrc_stamp_duty(type = NULL, cache = TRUE)
```

## Source

<https://www.gov.uk/government/statistics/uk-stamp-tax-statistics>

## Arguments

- type:

  Character vector or `NULL` (default = all types). Valid values:
  `"sdlt_property"`, `"sdlt_leases"`, `"sdlt_total"`, `"sdrt"`,
  `"stamp_duty"`, `"total"`.

- cache:

  Logical. Use cached file if available (default `TRUE`).

## Value

An `hmrc_tbl` with columns `tax_year`, `type`, `description`,
`receipts_gbp_m` (rounded to nearest GBP 5m by HMRC).

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
[`hmrc_rd_credits()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_rd_credits.md),
[`hmrc_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_gap.md),
[`hmrc_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_receipts.md),
[`hmrc_tobacco_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tobacco_duties.md),
[`hmrc_vat()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_vat.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
hmrc_stamp_duty()
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [611ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [1.3s]
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
#> ✔ Parsing data [181ms]
#> 
#> # UK Stamp Tax statistics
#> # Source: https://www.gov.uk/government/statistics/uk-stamp-tax-statistics
#> # Fetched 2026-04-26 13:11:37 UTC | Vintage: latest | Cells: cash | Freq: annual | 132 rows x 4 cols
#> 
#>     tax_year          type                         description receipts_gbp_m
#> 1    2003-04   sdlt_leases                  SDLT on new leases            405
#> 2    2004-05   sdlt_leases                  SDLT on new leases            945
#> 3    2005-06   sdlt_leases                  SDLT on new leases            810
#> 4    2006-07   sdlt_leases                  SDLT on new leases           1330
#> 5    2007-08   sdlt_leases                  SDLT on new leases            915
#> 6    2008-09   sdlt_leases                  SDLT on new leases            595
#> 7    2009-10   sdlt_leases                  SDLT on new leases            665
#> 8    2010-11   sdlt_leases                  SDLT on new leases            540
#> 9    2011-12   sdlt_leases                  SDLT on new leases            525
#> 10   2012-13   sdlt_leases                  SDLT on new leases            550
#> 11   2013-14   sdlt_leases                  SDLT on new leases            665
#> 12   2014-15   sdlt_leases                  SDLT on new leases            825
#> 13   2015-16   sdlt_leases                  SDLT on new leases           1175
#> 14   2016-17   sdlt_leases                  SDLT on new leases           1335
#> 15   2017-18   sdlt_leases                  SDLT on new leases           1345
#> 16   2018-19   sdlt_leases                  SDLT on new leases           1200
#> 17   2019-20   sdlt_leases                  SDLT on new leases           1070
#> 18   2020-21   sdlt_leases                  SDLT on new leases            610
#> 19   2021-22   sdlt_leases                  SDLT on new leases           1110
#> 20   2022-23   sdlt_leases                  SDLT on new leases           1435
#> 21   2023-24   sdlt_leases                  SDLT on new leases           1305
#> 22   2024-25   sdlt_leases                  SDLT on new leases           1280
#> 23   2003-04 sdlt_property SDLT on property (excl. new leases)           4585
#> 24   2004-05 sdlt_property SDLT on property (excl. new leases)           5310
#> 25   2005-06 sdlt_property SDLT on property (excl. new leases)           6645
#> 26   2006-07 sdlt_property SDLT on property (excl. new leases)           8305
#> 27   2007-08 sdlt_property SDLT on property (excl. new leases)           9040
#> 28   2008-09 sdlt_property SDLT on property (excl. new leases)           4200
#> 29   2009-10 sdlt_property SDLT on property (excl. new leases)           4220
#> 30   2010-11 sdlt_property SDLT on property (excl. new leases)           5420
#> 31   2011-12 sdlt_property SDLT on property (excl. new leases)           5600
#> 32   2012-13 sdlt_property SDLT on property (excl. new leases)           6360
#> 33   2013-14 sdlt_property SDLT on property (excl. new leases)           8610
#> 34   2014-15 sdlt_property SDLT on property (excl. new leases)           9915
#> 35   2015-16 sdlt_property SDLT on property (excl. new leases)           9510
#> 36   2016-17 sdlt_property SDLT on property (excl. new leases)          10430
#> 37   2017-18 sdlt_property SDLT on property (excl. new leases)          11560
#> 38   2018-19 sdlt_property SDLT on property (excl. new leases)          10740
#> 39   2019-20 sdlt_property SDLT on property (excl. new leases)          10530
#> 40   2020-21 sdlt_property SDLT on property (excl. new leases)           8055
#> 41   2021-22 sdlt_property SDLT on property (excl. new leases)          12990
#> 42   2022-23 sdlt_property SDLT on property (excl. new leases)          13925
#> 43   2023-24 sdlt_property SDLT on property (excl. new leases)          10310
#> 44   2024-25 sdlt_property SDLT on property (excl. new leases)          12605
#> 45   2003-04    sdlt_total                          SDLT total           4985
#> 46   2004-05    sdlt_total                          SDLT total           6250
#> 47   2005-06    sdlt_total                          SDLT total           7455
#> 48   2006-07    sdlt_total                          SDLT total           9635
#> 49   2007-08    sdlt_total                          SDLT total           9960
#> 50   2008-09    sdlt_total                          SDLT total           4795
#> 51   2009-10    sdlt_total                          SDLT total           4885
#> 52   2010-11    sdlt_total                          SDLT total           5960
#> 53   2011-12    sdlt_total                          SDLT total           6125
#> 54   2012-13    sdlt_total                          SDLT total           6905
#> 55   2013-14    sdlt_total                          SDLT total           9275
#> 56   2014-15    sdlt_total                          SDLT total          10740
#> 57   2015-16    sdlt_total                          SDLT total          10680
#> 58   2016-17    sdlt_total                          SDLT total          11765
#> 59   2017-18    sdlt_total                          SDLT total          12905
#> 60   2018-19    sdlt_total                          SDLT total          11940
#> 61   2019-20    sdlt_total                          SDLT total          11600
#> 62   2020-21    sdlt_total                          SDLT total           8670
#> 63   2021-22    sdlt_total                          SDLT total          14100
#> 64   2022-23    sdlt_total                          SDLT total          15360
#> 65   2023-24    sdlt_total                          SDLT total          11615
#> 66   2024-25    sdlt_total                          SDLT total          13885
#> 67   2003-04          sdrt     Stamp Duty Reserve Tax (shares)           2270
#> 68   2004-05          sdrt     Stamp Duty Reserve Tax (shares)           2345
#> 69   2005-06          sdrt     Stamp Duty Reserve Tax (shares)           2805
#> 70   2006-07          sdrt     Stamp Duty Reserve Tax (shares)           3250
#> 71   2007-08          sdrt     Stamp Duty Reserve Tax (shares)           3675
#> 72   2008-09          sdrt     Stamp Duty Reserve Tax (shares)           2925
#> 73   2009-10          sdrt     Stamp Duty Reserve Tax (shares)           2775
#> 74   2010-11          sdrt     Stamp Duty Reserve Tax (shares)           2710
#> 75   2011-12          sdrt     Stamp Duty Reserve Tax (shares)           2480
#> 76   2012-13          sdrt     Stamp Duty Reserve Tax (shares)           1935
#> 77   2013-14          sdrt     Stamp Duty Reserve Tax (shares)           2775
#> 78   2014-15          sdrt     Stamp Duty Reserve Tax (shares)           2580
#> 79   2015-16          sdrt     Stamp Duty Reserve Tax (shares)           2605
#> 80   2016-17          sdrt     Stamp Duty Reserve Tax (shares)           2715
#> 81   2017-18          sdrt     Stamp Duty Reserve Tax (shares)           2810
#> 82   2018-19          sdrt     Stamp Duty Reserve Tax (shares)           2865
#> 83   2019-20          sdrt     Stamp Duty Reserve Tax (shares)           2670
#> 84   2020-21          sdrt     Stamp Duty Reserve Tax (shares)           3050
#> 85   2021-22          sdrt     Stamp Duty Reserve Tax (shares)           2915
#> 86   2022-23          sdrt     Stamp Duty Reserve Tax (shares)           2585
#> 87   2023-24          sdrt     Stamp Duty Reserve Tax (shares)           2295
#> 88   2024-25          sdrt     Stamp Duty Reserve Tax (shares)           3050
#> 89   2003-04    stamp_duty             Stamp Duty on documents            290
#> 90   2004-05    stamp_duty             Stamp Duty on documents            370
#> 91   2005-06    stamp_duty             Stamp Duty on documents            655
#> 92   2006-07    stamp_duty             Stamp Duty on documents            510
#> 93   2007-08    stamp_duty             Stamp Duty on documents            490
#> 94   2008-09    stamp_duty             Stamp Duty on documents            280
#> 95   2009-10    stamp_duty             Stamp Duty on documents            240
#> 96   2010-11    stamp_duty             Stamp Duty on documents            260
#> 97   2011-12    stamp_duty             Stamp Duty on documents            310
#> 98   2012-13    stamp_duty             Stamp Duty on documents            300
#> 99   2013-14    stamp_duty             Stamp Duty on documents            335
#> 100  2014-15    stamp_duty             Stamp Duty on documents            345
#> 101  2015-16    stamp_duty             Stamp Duty on documents            715
#> 102  2016-17    stamp_duty             Stamp Duty on documents           1000
#> 103  2017-18    stamp_duty             Stamp Duty on documents            710
#> 104  2018-19    stamp_duty             Stamp Duty on documents            755
#> 105  2019-20    stamp_duty             Stamp Duty on documents            950
#> 106  2020-21    stamp_duty             Stamp Duty on documents            625
#> 107  2021-22    stamp_duty             Stamp Duty on documents           1455
#> 108  2022-23    stamp_duty             Stamp Duty on documents           1185
#> 109  2023-24    stamp_duty             Stamp Duty on documents            905
#> 110  2024-25    stamp_duty             Stamp Duty on documents           1270
#> 111  2003-04         total                   Total stamp taxes           2560
#> 112  2004-05         total                   Total stamp taxes           2715
#> 113  2005-06         total                   Total stamp taxes           3465
#> 114  2006-07         total                   Total stamp taxes           3755
#> 115  2007-08         total                   Total stamp taxes           4165
#> 116  2008-09         total                   Total stamp taxes           3205
#> 117  2009-10         total                   Total stamp taxes           3015
#> 118  2010-11         total                   Total stamp taxes           2970
#> 119  2011-12         total                   Total stamp taxes           2795
#> 120  2012-13         total                   Total stamp taxes           2235
#> 121  2013-14         total                   Total stamp taxes           3110
#> 122  2014-15         total                   Total stamp taxes           2925
#> 123  2015-16         total                   Total stamp taxes           3320
#> 124  2016-17         total                   Total stamp taxes           3715
#> 125  2017-18         total                   Total stamp taxes           3520
#> 126  2018-19         total                   Total stamp taxes           3620
#> 127  2019-20         total                   Total stamp taxes           3620
#> 128  2020-21         total                   Total stamp taxes           3675
#> 129  2021-22         total                   Total stamp taxes           4370
#> 130  2022-23         total                   Total stamp taxes           3775
#> 131  2023-24         total                   Total stamp taxes           3200
#> 132  2024-25         total                   Total stamp taxes           4320
hmrc_stamp_duty(type = "sdlt_total")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [17ms]
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
#> ✔ Parsing data [189ms]
#> 
#> # UK Stamp Tax statistics
#> # Source: https://www.gov.uk/government/statistics/uk-stamp-tax-statistics
#> # Fetched 2026-04-26 13:11:38 UTC | Vintage: latest | Cells: cash | Freq: annual | 22 rows x 4 cols
#> 
#>    tax_year       type description receipts_gbp_m
#> 1   2003-04 sdlt_total  SDLT total           4985
#> 2   2004-05 sdlt_total  SDLT total           6250
#> 3   2005-06 sdlt_total  SDLT total           7455
#> 4   2006-07 sdlt_total  SDLT total           9635
#> 5   2007-08 sdlt_total  SDLT total           9960
#> 6   2008-09 sdlt_total  SDLT total           4795
#> 7   2009-10 sdlt_total  SDLT total           4885
#> 8   2010-11 sdlt_total  SDLT total           5960
#> 9   2011-12 sdlt_total  SDLT total           6125
#> 10  2012-13 sdlt_total  SDLT total           6905
#> 11  2013-14 sdlt_total  SDLT total           9275
#> 12  2014-15 sdlt_total  SDLT total          10740
#> 13  2015-16 sdlt_total  SDLT total          10680
#> 14  2016-17 sdlt_total  SDLT total          11765
#> 15  2017-18 sdlt_total  SDLT total          12905
#> 16  2018-19 sdlt_total  SDLT total          11940
#> 17  2019-20 sdlt_total  SDLT total          11600
#> 18  2020-21 sdlt_total  SDLT total           8670
#> 19  2021-22 sdlt_total  SDLT total          14100
#> 20  2022-23 sdlt_total  SDLT total          15360
#> 21  2023-24 sdlt_total  SDLT total          11615
#> 22  2024-25 sdlt_total  SDLT total          13885
options(op)
# }
```
