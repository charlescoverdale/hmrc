# Download HMRC Capital Gains Tax statistics

Downloads and tidies HMRC Table 1 of the Capital Gains Tax statistics
bulletin: estimated number of CGT taxpayers, amounts of gains, and tax
liabilities by year of disposal. Data runs from 1987-88 onwards and is
published annually each summer.

## Usage

``` r
hmrc_capital_gains(tax_year = NULL, measure = NULL, cache = TRUE)
```

## Source

<https://www.gov.uk/government/organisations/hm-revenue-customs/series/capital-gains-tax-statistics>

## Arguments

- tax_year:

  Character vector or `NULL` (default = all years). Filter to specific
  tax years, e.g. `"2022-23"`.

- measure:

  Character vector or `NULL` (default = all measures). Valid values:
  `"taxpayers_total_thousands"`, `"taxpayers_individuals_thousands"`,
  `"taxpayers_trusts_thousands"`, `"males_pct"`, `"females_pct"`,
  `"gains_individuals_gbp_m"`, `"gains_trusts_gbp_m"`,
  `"gains_total_gbp_m"`, `"tax_individuals_gbp_m"`,
  `"tax_trusts_gbp_m"`, `"tax_total_gbp_m"`.

- cache:

  Logical. Use cached file if available (default `TRUE`).

## Value

An `hmrc_tbl` (long format) with columns `tax_year`, `measure`, `value`.
Numbers of taxpayers are in thousands; amounts in millions of pounds;
percentages in percent. Suppressed cells return `NA`.

## Details

Gains are after the deduction of taper relief and losses plus attributed
gains, but before deduction of the Annual Exempt Amount. Trusts include
personal representatives of the deceased. Statistics for the latest two
tax years are provisional and are revised in subsequent publications as
late returns arrive.

## See also

Other data fetchers:
[`hmrc_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_corporation_tax.md),
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
hmrc_capital_gains()
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [791ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [713ms]
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
#> ✔ Parsing data [157ms]
#> 
#> # Capital Gains Tax statistics (Table 1)
#> # Source: https://www.gov.uk/government/statistics/capital-gains-tax-statistics
#> # Fetched 2026-04-26 13:01:46 UTC | Vintage: latest | Cells: liabilities | Freq: annual | 396 rows x 3 cols
#> 
#>     tax_year                         measure value
#> 1    1987-88                     females_pct    NA
#> 2    1988-89                     females_pct    NA
#> 3    1989-90                     females_pct    NA
#> 4    1990-91                     females_pct    NA
#> 5    1991-92                     females_pct    NA
#> 6    1992-93                     females_pct    NA
#> 7    1993-94                     females_pct    NA
#> 8    1994-95                     females_pct    NA
#> 9    1995-96                     females_pct    NA
#> 10   1996-97                     females_pct    NA
#> 11   1997-98                     females_pct    NA
#> 12   1998-99                     females_pct    NA
#> 13   1999-00                     females_pct    NA
#> 14   2000-01                     females_pct    NA
#> 15   2001-02                     females_pct    NA
#> 16   2002-03                     females_pct    NA
#> 17   2003-04                     females_pct    NA
#> 18   2004-05                     females_pct    42
#> 19   2005-06                     females_pct    42
#> 20   2006-07                     females_pct    42
#> 21   2007-08                     females_pct    41
#> 22   2009-10                     females_pct    40
#> 23   2010-11                     females_pct    41
#> 24   2011-12                     females_pct    41
#> 25   2012-13                     females_pct    42
#> 26   2013-14                     females_pct    43
#> 27   2014-15                     females_pct    43
#> 28   2015-16                     females_pct    43
#> 29   2016-17                     females_pct    44
#> 30   2017-18                     females_pct    44
#> 31   2018-19                     females_pct    43
#> 32   2019-20                     females_pct    43
#> 33   2020-21                     females_pct    42
#> 34   2021-22                     females_pct    43
#> 35   2022-23                     females_pct    44
#> 36   2023-24                     females_pct    43
#> 37   1987-88         gains_individuals_gbp_m  7994
#> 38   1988-89         gains_individuals_gbp_m  5366
#> 39   1989-90         gains_individuals_gbp_m  4832
#> 40   1990-91         gains_individuals_gbp_m  2912
#> 41   1991-92         gains_individuals_gbp_m  2634
#> 42   1992-93         gains_individuals_gbp_m  1885
#> 43   1993-94         gains_individuals_gbp_m  2740
#> 44   1994-95         gains_individuals_gbp_m  2212
#> 45   1995-96         gains_individuals_gbp_m  3131
#> 46   1996-97         gains_individuals_gbp_m  3918
#> 47   1997-98         gains_individuals_gbp_m  5444
#> 48   1998-99         gains_individuals_gbp_m  5958
#> 49   1999-00         gains_individuals_gbp_m  8761
#> 50   2000-01         gains_individuals_gbp_m  7732
#> 51   2001-02         gains_individuals_gbp_m  4556
#> 52   2002-03         gains_individuals_gbp_m  6588
#> 53   2003-04         gains_individuals_gbp_m  6869
#> 54   2004-05         gains_individuals_gbp_m  9170
#> 55   2005-06         gains_individuals_gbp_m 11562
#> 56   2006-07         gains_individuals_gbp_m 15404
#> 57   2007-08         gains_individuals_gbp_m 20874
#> 58   2009-10         gains_individuals_gbp_m 18423
#> 59   2010-11         gains_individuals_gbp_m 23295
#> 60   2011-12         gains_individuals_gbp_m 21695
#> 61   2012-13         gains_individuals_gbp_m 22106
#> 62   2013-14         gains_individuals_gbp_m 30488
#> 63   2014-15         gains_individuals_gbp_m 38096
#> 64   2015-16         gains_individuals_gbp_m 47254
#> 65   2016-17         gains_individuals_gbp_m 48176
#> 66   2017-18         gains_individuals_gbp_m 55588
#> 67   2018-19         gains_individuals_gbp_m 60662
#> 68   2019-20         gains_individuals_gbp_m 63594
#> 69   2020-21         gains_individuals_gbp_m 76801
#> 70   2021-22         gains_individuals_gbp_m 88708
#> 71   2022-23         gains_individuals_gbp_m 77851
#> 72   2023-24         gains_individuals_gbp_m 62921
#> 73   1987-88               gains_total_gbp_m  8712
#> 74   1988-89               gains_total_gbp_m  5992
#> 75   1989-90               gains_total_gbp_m  5486
#> 76   1990-91               gains_total_gbp_m  3332
#> 77   1991-92               gains_total_gbp_m  2999
#> 78   1992-93               gains_total_gbp_m  2160
#> 79   1993-94               gains_total_gbp_m  3185
#> 80   1994-95               gains_total_gbp_m  2579
#> 81   1995-96               gains_total_gbp_m  3940
#> 82   1996-97               gains_total_gbp_m  4971
#> 83   1997-98               gains_total_gbp_m  7019
#> 84   1998-99               gains_total_gbp_m  6956
#> 85   1999-00               gains_total_gbp_m 10254
#> 86   2000-01               gains_total_gbp_m  8987
#> 87   2001-02               gains_total_gbp_m  5372
#> 88   2002-03               gains_total_gbp_m  7362
#> 89   2003-04               gains_total_gbp_m  7855
#> 90   2004-05               gains_total_gbp_m 10247
#> 91   2005-06               gains_total_gbp_m 12777
#> 92   2006-07               gains_total_gbp_m 16864
#> 93   2007-08               gains_total_gbp_m 22784
#> 94   2009-10               gains_total_gbp_m 20666
#> 95   2010-11               gains_total_gbp_m 25625
#> 96   2011-12               gains_total_gbp_m 23294
#> 97   2012-13               gains_total_gbp_m 23479
#> 98   2013-14               gains_total_gbp_m 32625
#> 99   2014-15               gains_total_gbp_m 41230
#> 100  2015-16               gains_total_gbp_m 49779
#> 101  2016-17               gains_total_gbp_m 51531
#> 102  2017-18               gains_total_gbp_m 59067
#> 103  2018-19               gains_total_gbp_m 64312
#> 104  2019-20               gains_total_gbp_m 66758
#> 105  2020-21               gains_total_gbp_m 80971
#> 106  2021-22               gains_total_gbp_m 94057
#> 107  2022-23               gains_total_gbp_m 81821
#> 108  2023-24               gains_total_gbp_m 65937
#> 109  1987-88              gains_trusts_gbp_m   718
#> 110  1988-89              gains_trusts_gbp_m   626
#> 111  1989-90              gains_trusts_gbp_m   654
#> 112  1990-91              gains_trusts_gbp_m   419
#> 113  1991-92              gains_trusts_gbp_m   365
#> 114  1992-93              gains_trusts_gbp_m   275
#> 115  1993-94              gains_trusts_gbp_m   445
#> 116  1994-95              gains_trusts_gbp_m   367
#> 117  1995-96              gains_trusts_gbp_m   809
#> 118  1996-97              gains_trusts_gbp_m  1053
#> 119  1997-98              gains_trusts_gbp_m  1575
#> 120  1998-99              gains_trusts_gbp_m   998
#> 121  1999-00              gains_trusts_gbp_m  1493
#> 122  2000-01              gains_trusts_gbp_m  1256
#> 123  2001-02              gains_trusts_gbp_m   816
#> 124  2002-03              gains_trusts_gbp_m   774
#> 125  2003-04              gains_trusts_gbp_m   986
#> 126  2004-05              gains_trusts_gbp_m  1076
#> 127  2005-06              gains_trusts_gbp_m  1215
#> 128  2006-07              gains_trusts_gbp_m  1460
#> 129  2007-08              gains_trusts_gbp_m  1910
#> 130  2009-10              gains_trusts_gbp_m  2243
#> 131  2010-11              gains_trusts_gbp_m  2331
#> 132  2011-12              gains_trusts_gbp_m  1599
#> 133  2012-13              gains_trusts_gbp_m  1372
#> 134  2013-14              gains_trusts_gbp_m  2137
#> 135  2014-15              gains_trusts_gbp_m  3133
#> 136  2015-16              gains_trusts_gbp_m  2525
#> 137  2016-17              gains_trusts_gbp_m  3355
#> 138  2017-18              gains_trusts_gbp_m  3480
#> 139  2018-19              gains_trusts_gbp_m  3650
#> 140  2019-20              gains_trusts_gbp_m  3164
#> 141  2020-21              gains_trusts_gbp_m  4170
#> 142  2021-22              gains_trusts_gbp_m  5348
#> 143  2022-23              gains_trusts_gbp_m  3969
#> 144  2023-24              gains_trusts_gbp_m  3016
#> 145  1987-88                       males_pct    NA
#> 146  1988-89                       males_pct    NA
#> 147  1989-90                       males_pct    NA
#> 148  1990-91                       males_pct    NA
#> 149  1991-92                       males_pct    NA
#> 150  1992-93                       males_pct    NA
#> 151  1993-94                       males_pct    NA
#> 152  1994-95                       males_pct    NA
#> 153  1995-96                       males_pct    NA
#> 154  1996-97                       males_pct    NA
#> 155  1997-98                       males_pct    NA
#> 156  1998-99                       males_pct    NA
#> 157  1999-00                       males_pct    NA
#> 158  2000-01                       males_pct    NA
#> 159  2001-02                       males_pct    NA
#> 160  2002-03                       males_pct    NA
#> 161  2003-04                       males_pct    NA
#> 162  2004-05                       males_pct    58
#> 163  2005-06                       males_pct    58
#> 164  2006-07                       males_pct    58
#> 165  2007-08                       males_pct    59
#> 166  2009-10                       males_pct    60
#> 167  2010-11                       males_pct    59
#> 168  2011-12                       males_pct    59
#> 169  2012-13                       males_pct    58
#> 170  2013-14                       males_pct    57
#> 171  2014-15                       males_pct    57
#> 172  2015-16                       males_pct    57
#> 173  2016-17                       males_pct    56
#> 174  2017-18                       males_pct    56
#> 175  2018-19                       males_pct    57
#> 176  2019-20                       males_pct    57
#> 177  2020-21                       males_pct    58
#> 178  2021-22                       males_pct    57
#> 179  2022-23                       males_pct    56
#> 180  2023-24                       males_pct    57
#> 181  1987-88           tax_individuals_gbp_m  1993
#> 182  1988-89           tax_individuals_gbp_m  1637
#> 183  1989-90           tax_individuals_gbp_m  1495
#> 184  1990-91           tax_individuals_gbp_m   869
#> 185  1991-92           tax_individuals_gbp_m   804
#> 186  1992-93           tax_individuals_gbp_m   539
#> 187  1993-94           tax_individuals_gbp_m   809
#> 188  1994-95           tax_individuals_gbp_m   651
#> 189  1995-96           tax_individuals_gbp_m   890
#> 190  1996-97           tax_individuals_gbp_m  1203
#> 191  1997-98           tax_individuals_gbp_m  1657
#> 192  1998-99           tax_individuals_gbp_m  1936
#> 193  1999-00           tax_individuals_gbp_m  2821
#> 194  2000-01           tax_individuals_gbp_m  2425
#> 195  2001-02           tax_individuals_gbp_m  1324
#> 196  2002-03           tax_individuals_gbp_m  2052
#> 197  2003-04           tax_individuals_gbp_m  2037
#> 198  2004-05           tax_individuals_gbp_m  2792
#> 199  2005-06           tax_individuals_gbp_m  3599
#> 200  2006-07           tax_individuals_gbp_m  4893
#> 201  2007-08           tax_individuals_gbp_m  6961
#> 202  2009-10           tax_individuals_gbp_m  3012
#> 203  2010-11           tax_individuals_gbp_m  3837
#> 204  2011-12           tax_individuals_gbp_m  3434
#> 205  2012-13           tax_individuals_gbp_m  3495
#> 206  2013-14           tax_individuals_gbp_m  5052
#> 207  2014-15           tax_individuals_gbp_m  6211
#> 208  2015-16           tax_individuals_gbp_m  7882
#> 209  2016-17           tax_individuals_gbp_m  7157
#> 210  2017-18           tax_individuals_gbp_m  8374
#> 211  2018-19           tax_individuals_gbp_m  9015
#> 212  2019-20           tax_individuals_gbp_m  9475
#> 213  2020-21           tax_individuals_gbp_m 13721
#> 214  2021-22           tax_individuals_gbp_m 15918
#> 215  2022-23           tax_individuals_gbp_m 13835
#> 216  2023-24           tax_individuals_gbp_m 11458
#> 217  1987-88                 tax_total_gbp_m  2175
#> 218  1988-89                 tax_total_gbp_m  1792
#> 219  1989-90                 tax_total_gbp_m  1658
#> 220  1990-91                 tax_total_gbp_m   976
#> 221  1991-92                 tax_total_gbp_m   894
#> 222  1992-93                 tax_total_gbp_m   606
#> 223  1993-94                 tax_total_gbp_m   919
#> 224  1994-95                 tax_total_gbp_m   745
#> 225  1995-96                 tax_total_gbp_m  1110
#> 226  1996-97                 tax_total_gbp_m  1458
#> 227  1997-98                 tax_total_gbp_m  2026
#> 228  1998-99                 tax_total_gbp_m  2249
#> 229  1999-00                 tax_total_gbp_m  3296
#> 230  2000-01                 tax_total_gbp_m  2819
#> 231  2001-02                 tax_total_gbp_m  1581
#> 232  2002-03                 tax_total_gbp_m  2301
#> 233  2003-04                 tax_total_gbp_m  2356
#> 234  2004-05                 tax_total_gbp_m  3201
#> 235  2005-06                 tax_total_gbp_m  4052
#> 236  2006-07                 tax_total_gbp_m  5444
#> 237  2007-08                 tax_total_gbp_m  7694
#> 238  2009-10                 tax_total_gbp_m  3402
#> 239  2010-11                 tax_total_gbp_m  4313
#> 240  2011-12                 tax_total_gbp_m  3847
#> 241  2012-13                 tax_total_gbp_m  3836
#> 242  2013-14                 tax_total_gbp_m  5591
#> 243  2014-15                 tax_total_gbp_m  7014
#> 244  2015-16                 tax_total_gbp_m  8513
#> 245  2016-17                 tax_total_gbp_m  7802
#> 246  2017-18                 tax_total_gbp_m  9002
#> 247  2018-19                 tax_total_gbp_m  9743
#> 248  2019-20                 tax_total_gbp_m 10095
#> 249  2020-21                 tax_total_gbp_m 14561
#> 250  2021-22                 tax_total_gbp_m 17011
#> 251  2022-23                 tax_total_gbp_m 14653
#> 252  2023-24                 tax_total_gbp_m 12086
#> 253  1987-88                tax_trusts_gbp_m   182
#> 254  1988-89                tax_trusts_gbp_m   155
#> 255  1989-90                tax_trusts_gbp_m   163
#> 256  1990-91                tax_trusts_gbp_m   107
#> 257  1991-92                tax_trusts_gbp_m    90
#> 258  1992-93                tax_trusts_gbp_m    67
#> 259  1993-94                tax_trusts_gbp_m   110
#> 260  1994-95                tax_trusts_gbp_m    93
#> 261  1995-96                tax_trusts_gbp_m   220
#> 262  1996-97                tax_trusts_gbp_m   255
#> 263  1997-98                tax_trusts_gbp_m   369
#> 264  1998-99                tax_trusts_gbp_m   313
#> 265  1999-00                tax_trusts_gbp_m   475
#> 266  2000-01                tax_trusts_gbp_m   394
#> 267  2001-02                tax_trusts_gbp_m   257
#> 268  2002-03                tax_trusts_gbp_m   249
#> 269  2003-04                tax_trusts_gbp_m   319
#> 270  2004-05                tax_trusts_gbp_m   409
#> 271  2005-06                tax_trusts_gbp_m   452
#> 272  2006-07                tax_trusts_gbp_m   550
#> 273  2007-08                tax_trusts_gbp_m   733
#> 274  2009-10                tax_trusts_gbp_m   390
#> 275  2010-11                tax_trusts_gbp_m   476
#> 276  2011-12                tax_trusts_gbp_m   413
#> 277  2012-13                tax_trusts_gbp_m   341
#> 278  2013-14                tax_trusts_gbp_m   539
#> 279  2014-15                tax_trusts_gbp_m   804
#> 280  2015-16                tax_trusts_gbp_m   631
#> 281  2016-17                tax_trusts_gbp_m   645
#> 282  2017-18                tax_trusts_gbp_m   628
#> 283  2018-19                tax_trusts_gbp_m   728
#> 284  2019-20                tax_trusts_gbp_m   619
#> 285  2020-21                tax_trusts_gbp_m   840
#> 286  2021-22                tax_trusts_gbp_m  1093
#> 287  2022-23                tax_trusts_gbp_m   818
#> 288  2023-24                tax_trusts_gbp_m   627
#> 289  1987-88 taxpayers_individuals_thousands   135
#> 290  1988-89 taxpayers_individuals_thousands   135
#> 291  1989-90 taxpayers_individuals_thousands   127
#> 292  1990-91 taxpayers_individuals_thousands    96
#> 293  1991-92 taxpayers_individuals_thousands    75
#> 294  1992-93 taxpayers_individuals_thousands    60
#> 295  1993-94 taxpayers_individuals_thousands    77
#> 296  1994-95 taxpayers_individuals_thousands    64
#> 297  1995-96 taxpayers_individuals_thousands    86
#> 298  1996-97 taxpayers_individuals_thousands    97
#> 299  1997-98 taxpayers_individuals_thousands   142
#> 300  1998-99 taxpayers_individuals_thousands   135
#> 301  1999-00 taxpayers_individuals_thousands   185
#> 302  2000-01 taxpayers_individuals_thousands   178
#> 303  2001-02 taxpayers_individuals_thousands   122
#> 304  2002-03 taxpayers_individuals_thousands   133
#> 305  2003-04 taxpayers_individuals_thousands   153
#> 306  2004-05 taxpayers_individuals_thousands   181
#> 307  2005-06 taxpayers_individuals_thousands   204
#> 308  2006-07 taxpayers_individuals_thousands   242
#> 309  2007-08 taxpayers_individuals_thousands   250
#> 310  2009-10 taxpayers_individuals_thousands   152
#> 311  2010-11 taxpayers_individuals_thousands   171
#> 312  2011-12 taxpayers_individuals_thousands   148
#> 313  2012-13 taxpayers_individuals_thousands   156
#> 314  2013-14 taxpayers_individuals_thousands   195
#> 315  2014-15 taxpayers_individuals_thousands   226
#> 316  2015-16 taxpayers_individuals_thousands   243
#> 317  2016-17 taxpayers_individuals_thousands   250
#> 318  2017-18 taxpayers_individuals_thousands   266
#> 319  2018-19 taxpayers_individuals_thousands   262
#> 320  2019-20 taxpayers_individuals_thousands   252
#> 321  2020-21 taxpayers_individuals_thousands   306
#> 322  2021-22 taxpayers_individuals_thousands   378
#> 323  2022-23 taxpayers_individuals_thousands   355
#> 324  2023-24 taxpayers_individuals_thousands   359
#> 325  1987-88       taxpayers_total_thousands   152
#> 326  1988-89       taxpayers_total_thousands   151
#> 327  1989-90       taxpayers_total_thousands   144
#> 328  1990-91       taxpayers_total_thousands   108
#> 329  1991-92       taxpayers_total_thousands    85
#> 330  1992-93       taxpayers_total_thousands    70
#> 331  1993-94       taxpayers_total_thousands    90
#> 332  1994-95       taxpayers_total_thousands    73
#> 333  1995-96       taxpayers_total_thousands    98
#> 334  1996-97       taxpayers_total_thousands   117
#> 335  1997-98       taxpayers_total_thousands   170
#> 336  1998-99       taxpayers_total_thousands   160
#> 337  1999-00       taxpayers_total_thousands   212
#> 338  2000-01       taxpayers_total_thousands   203
#> 339  2001-02       taxpayers_total_thousands   139
#> 340  2002-03       taxpayers_total_thousands   144
#> 341  2003-04       taxpayers_total_thousands   166
#> 342  2004-05       taxpayers_total_thousands   196
#> 343  2005-06       taxpayers_total_thousands   225
#> 344  2006-07       taxpayers_total_thousands   264
#> 345  2007-08       taxpayers_total_thousands   272
#> 346  2009-10       taxpayers_total_thousands   168
#> 347  2010-11       taxpayers_total_thousands   188
#> 348  2011-12       taxpayers_total_thousands   163
#> 349  2012-13       taxpayers_total_thousands   171
#> 350  2013-14       taxpayers_total_thousands   215
#> 351  2014-15       taxpayers_total_thousands   246
#> 352  2015-16       taxpayers_total_thousands   263
#> 353  2016-17       taxpayers_total_thousands   274
#> 354  2017-18       taxpayers_total_thousands   288
#> 355  2018-19       taxpayers_total_thousands   282
#> 356  2019-20       taxpayers_total_thousands   272
#> 357  2020-21       taxpayers_total_thousands   329
#> 358  2021-22       taxpayers_total_thousands   404
#> 359  2022-23       taxpayers_total_thousands   376
#> 360  2023-24       taxpayers_total_thousands   378
#> 361  1987-88      taxpayers_trusts_thousands    17
#> 362  1988-89      taxpayers_trusts_thousands    16
#> 363  1989-90      taxpayers_trusts_thousands    17
#> 364  1990-91      taxpayers_trusts_thousands    12
#> 365  1991-92      taxpayers_trusts_thousands    10
#> 366  1992-93      taxpayers_trusts_thousands     9
#> 367  1993-94      taxpayers_trusts_thousands    12
#> 368  1994-95      taxpayers_trusts_thousands    10
#> 369  1995-96      taxpayers_trusts_thousands    13
#> 370  1996-97      taxpayers_trusts_thousands    20
#> 371  1997-98      taxpayers_trusts_thousands    28
#> 372  1998-99      taxpayers_trusts_thousands    25
#> 373  1999-00      taxpayers_trusts_thousands    27
#> 374  2000-01      taxpayers_trusts_thousands    25
#> 375  2001-02      taxpayers_trusts_thousands    16
#> 376  2002-03      taxpayers_trusts_thousands    12
#> 377  2003-04      taxpayers_trusts_thousands    13
#> 378  2004-05      taxpayers_trusts_thousands    15
#> 379  2005-06      taxpayers_trusts_thousands    21
#> 380  2006-07      taxpayers_trusts_thousands    23
#> 381  2007-08      taxpayers_trusts_thousands    21
#> 382  2009-10      taxpayers_trusts_thousands    16
#> 383  2010-11      taxpayers_trusts_thousands    18
#> 384  2011-12      taxpayers_trusts_thousands    14
#> 385  2012-13      taxpayers_trusts_thousands    16
#> 386  2013-14      taxpayers_trusts_thousands    20
#> 387  2014-15      taxpayers_trusts_thousands    20
#> 388  2015-16      taxpayers_trusts_thousands    19
#> 389  2016-17      taxpayers_trusts_thousands    24
#> 390  2017-18      taxpayers_trusts_thousands    22
#> 391  2018-19      taxpayers_trusts_thousands    21
#> 392  2019-20      taxpayers_trusts_thousands    19
#> 393  2020-21      taxpayers_trusts_thousands    23
#> 394  2021-22      taxpayers_trusts_thousands    26
#> 395  2022-23      taxpayers_trusts_thousands    21
#> 396  2023-24      taxpayers_trusts_thousands    19
hmrc_capital_gains(measure = "tax_total_gbp_m")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [20ms]
#> 
#> ℹ Using cached file
#> ✔ Using cached file [10ms]
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
#> ✔ Parsing data [114ms]
#> 
#> # Capital Gains Tax statistics (Table 1)
#> # Source: https://www.gov.uk/government/statistics/capital-gains-tax-statistics
#> # Fetched 2026-04-26 13:01:46 UTC | Vintage: latest | Cells: liabilities | Freq: annual | 36 rows x 3 cols
#> 
#>    tax_year         measure value
#> 1   1987-88 tax_total_gbp_m  2175
#> 2   1988-89 tax_total_gbp_m  1792
#> 3   1989-90 tax_total_gbp_m  1658
#> 4   1990-91 tax_total_gbp_m   976
#> 5   1991-92 tax_total_gbp_m   894
#> 6   1992-93 tax_total_gbp_m   606
#> 7   1993-94 tax_total_gbp_m   919
#> 8   1994-95 tax_total_gbp_m   745
#> 9   1995-96 tax_total_gbp_m  1110
#> 10  1996-97 tax_total_gbp_m  1458
#> 11  1997-98 tax_total_gbp_m  2026
#> 12  1998-99 tax_total_gbp_m  2249
#> 13  1999-00 tax_total_gbp_m  3296
#> 14  2000-01 tax_total_gbp_m  2819
#> 15  2001-02 tax_total_gbp_m  1581
#> 16  2002-03 tax_total_gbp_m  2301
#> 17  2003-04 tax_total_gbp_m  2356
#> 18  2004-05 tax_total_gbp_m  3201
#> 19  2005-06 tax_total_gbp_m  4052
#> 20  2006-07 tax_total_gbp_m  5444
#> 21  2007-08 tax_total_gbp_m  7694
#> 22  2009-10 tax_total_gbp_m  3402
#> 23  2010-11 tax_total_gbp_m  4313
#> 24  2011-12 tax_total_gbp_m  3847
#> 25  2012-13 tax_total_gbp_m  3836
#> 26  2013-14 tax_total_gbp_m  5591
#> 27  2014-15 tax_total_gbp_m  7014
#> 28  2015-16 tax_total_gbp_m  8513
#> 29  2016-17 tax_total_gbp_m  7802
#> 30  2017-18 tax_total_gbp_m  9002
#> 31  2018-19 tax_total_gbp_m  9743
#> 32  2019-20 tax_total_gbp_m 10095
#> 33  2020-21 tax_total_gbp_m 14561
#> 34  2021-22 tax_total_gbp_m 17011
#> 35  2022-23 tax_total_gbp_m 14653
#> 36  2023-24 tax_total_gbp_m 12086
hmrc_capital_gains(tax_year = "2022-23")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [24ms]
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
#> ✔ Parsing data [114ms]
#> 
#> # Capital Gains Tax statistics (Table 1)
#> # Source: https://www.gov.uk/government/statistics/capital-gains-tax-statistics
#> # Fetched 2026-04-26 13:01:46 UTC | Vintage: latest | Cells: liabilities | Freq: annual | 11 rows x 3 cols
#> 
#>    tax_year                         measure value
#> 1   2022-23                     females_pct    44
#> 2   2022-23         gains_individuals_gbp_m 77851
#> 3   2022-23               gains_total_gbp_m 81821
#> 4   2022-23              gains_trusts_gbp_m  3969
#> 5   2022-23                       males_pct    56
#> 6   2022-23           tax_individuals_gbp_m 13835
#> 7   2022-23                 tax_total_gbp_m 14653
#> 8   2022-23                tax_trusts_gbp_m   818
#> 9   2022-23 taxpayers_individuals_thousands   355
#> 10  2022-23       taxpayers_total_thousands   376
#> 11  2022-23      taxpayers_trusts_thousands    21
options(op)
# }
```
