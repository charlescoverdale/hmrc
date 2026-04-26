# Download HMRC hydrocarbon oil (fuel duty) receipts

Downloads and tidies the HMRC Hydrocarbon Oils Bulletin, which reports
monthly fuel duty receipts. Data runs from January 1990 to the most
recent published month, updated twice per year (January and July).

## Usage

``` r
hmrc_fuel_duties(fuel = NULL, start = NULL, end = NULL, cache = TRUE)
```

## Source

<https://www.gov.uk/government/statistics/hydrocarbon-oils-bulletin>

## Arguments

- fuel:

  Character vector or `NULL` (default = all). Valid values: `"total"`,
  `"petrol"`, `"diesel"`, `"other"`.

- start:

  Character `"YYYY-MM"` or a `Date` object.

- end:

  Character `"YYYY-MM"` or a `Date` object.

- cache:

  Logical. Use cached file if available (default `TRUE`).

## Value

An `hmrc_tbl` with columns `date`, `fuel`, `description`,
`receipts_gbp_m`.

## See also

Other data fetchers:
[`hmrc_capital_gains()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_capital_gains.md),
[`hmrc_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_corporation_tax.md),
[`hmrc_creative_industries()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_creative_industries.md),
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
hmrc_fuel_duties(fuel = "total", start = "2010-01")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [324ms]
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
#> • `` -> `...9`
#> • `` -> `...10`
#> • `` -> `...11`
#> • `` -> `...12`
#> • `` -> `...13`
#> • `` -> `...14`
#> • `` -> `...15`
#> • `` -> `...16`
#> • `` -> `...17`
#> ✔ Parsing data [219ms]
#> 
#> # Hydrocarbon Oils Bulletin (fuel duties)
#> # Source: https://www.gov.uk/government/statistics/hydrocarbon-oils-bulletin
#> # Fetched 2026-04-26 13:11:25 UTC | Vintage: latest | Cells: cash | Freq: monthly | 192 rows x 4 cols
#> 
#>           date  fuel         description receipts_gbp_m
#> 1   2010-01-01 total Total oils receipts      1949.0318
#> 2   2010-02-01 total Total oils receipts      2192.7088
#> 3   2010-03-01 total Total oils receipts      2107.0001
#> 4   2010-04-01 total Total oils receipts      2378.3996
#> 5   2010-05-01 total Total oils receipts      2232.9472
#> 6   2010-06-01 total Total oils receipts      2245.1941
#> 7   2010-07-01 total Total oils receipts      2303.8052
#> 8   2010-08-01 total Total oils receipts      2306.1166
#> 9   2010-09-01 total Total oils receipts      2306.9254
#> 10  2010-10-01 total Total oils receipts      2366.8954
#> 11  2010-11-01 total Total oils receipts      2380.7363
#> 12  2010-12-01 total Total oils receipts      2242.6272
#> 13  2011-01-01 total Total oils receipts      2141.3682
#> 14  2011-02-01 total Total oils receipts      2203.0390
#> 15  2011-03-01 total Total oils receipts      2147.5912
#> 16  2011-04-01 total Total oils receipts      2383.9077
#> 17  2011-05-01 total Total oils receipts      2157.0857
#> 18  2011-06-01 total Total oils receipts      2269.1861
#> 19  2011-07-01 total Total oils receipts      2254.3207
#> 20  2011-08-01 total Total oils receipts      2187.1925
#> 21  2011-09-01 total Total oils receipts      2311.3130
#> 22  2011-10-01 total Total oils receipts      2305.4303
#> 23  2011-11-01 total Total oils receipts      2302.3969
#> 24  2011-12-01 total Total oils receipts      2261.8461
#> 25  2012-01-01 total Total oils receipts      2100.1585
#> 26  2012-02-01 total Total oils receipts      2197.4132
#> 27  2012-03-01 total Total oils receipts      2069.6236
#> 28  2012-04-01 total Total oils receipts      2386.2346
#> 29  2012-05-01 total Total oils receipts      2119.0890
#> 30  2012-06-01 total Total oils receipts      2247.1891
#> 31  2012-07-01 total Total oils receipts      2211.7302
#> 32  2012-08-01 total Total oils receipts      2236.8101
#> 33  2012-09-01 total Total oils receipts      2260.1993
#> 34  2012-10-01 total Total oils receipts      2220.1954
#> 35  2012-11-01 total Total oils receipts      2323.5296
#> 36  2012-12-01 total Total oils receipts      2331.1959
#> 37  2013-01-01 total Total oils receipts      2007.7961
#> 38  2013-02-01 total Total oils receipts      2154.6225
#> 39  2013-03-01 total Total oils receipts      2072.0582
#> 40  2013-04-01 total Total oils receipts      2257.5967
#> 41  2013-05-01 total Total oils receipts      2267.3374
#> 42  2013-06-01 total Total oils receipts      2319.0386
#> 43  2013-07-01 total Total oils receipts      2187.3468
#> 44  2013-08-01 total Total oils receipts      2316.6669
#> 45  2013-09-01 total Total oils receipts      2259.6359
#> 46  2013-10-01 total Total oils receipts      2225.8472
#> 47  2013-11-01 total Total oils receipts      2347.1913
#> 48  2013-12-01 total Total oils receipts      2282.4210
#> 49  2014-01-01 total Total oils receipts      2069.8938
#> 50  2014-02-01 total Total oils receipts      2214.5855
#> 51  2014-03-01 total Total oils receipts      2133.7265
#> 52  2014-04-01 total Total oils receipts      2302.9299
#> 53  2014-05-01 total Total oils receipts      2230.7581
#> 54  2014-06-01 total Total oils receipts      2316.8520
#> 55  2014-07-01 total Total oils receipts      2245.2313
#> 56  2014-08-01 total Total oils receipts      2374.9083
#> 57  2014-09-01 total Total oils receipts      2238.1944
#> 58  2014-10-01 total Total oils receipts      2271.1196
#> 59  2014-11-01 total Total oils receipts      2374.4507
#> 60  2014-12-01 total Total oils receipts      2322.4158
#> 61  2015-01-01 total Total oils receipts      2063.5402
#> 62  2015-02-01 total Total oils receipts      2296.5396
#> 63  2015-03-01 total Total oils receipts      2119.2616
#> 64  2015-04-01 total Total oils receipts      2299.8996
#> 65  2015-05-01 total Total oils receipts      2301.3288
#> 66  2015-06-01 total Total oils receipts      2340.5795
#> 67  2015-07-01 total Total oils receipts      2322.1223
#> 68  2015-08-01 total Total oils receipts      2360.3435
#> 69  2015-09-01 total Total oils receipts      2278.0060
#> 70  2015-10-01 total Total oils receipts      2324.0472
#> 71  2015-11-01 total Total oils receipts      2382.8991
#> 72  2015-12-01 total Total oils receipts      2326.9360
#> 73  2016-01-01 total Total oils receipts      2140.4057
#> 74  2016-02-01 total Total oils receipts      2279.3849
#> 75  2016-03-01 total Total oils receipts      2266.6282
#> 76  2016-04-01 total Total oils receipts      2365.7842
#> 77  2016-05-01 total Total oils receipts      2314.0616
#> 78  2016-06-01 total Total oils receipts      2424.5311
#> 79  2016-07-01 total Total oils receipts      2338.7619
#> 80  2016-08-01 total Total oils receipts      2353.5833
#> 81  2016-09-01 total Total oils receipts      2349.6756
#> 82  2016-10-01 total Total oils receipts      2360.6346
#> 83  2016-11-01 total Total oils receipts      2397.7514
#> 84  2016-12-01 total Total oils receipts      2395.7508
#> 85  2017-01-01 total Total oils receipts      2050.1969
#> 86  2017-02-01 total Total oils receipts      2426.3528
#> 87  2017-03-01 total Total oils receipts      2158.4576
#> 88  2017-04-01 total Total oils receipts      2450.7219
#> 89  2017-05-01 total Total oils receipts      2279.4547
#> 90  2017-06-01 total Total oils receipts      2390.6660
#> 91  2017-07-01 total Total oils receipts      2353.2778
#> 92  2017-08-01 total Total oils receipts      2358.2854
#> 93  2017-09-01 total Total oils receipts      2348.7363
#> 94  2017-10-01 total Total oils receipts      2311.3725
#> 95  2017-11-01 total Total oils receipts      2439.5467
#> 96  2017-12-01 total Total oils receipts      2406.5803
#> 97  2018-01-01 total Total oils receipts      2125.9328
#> 98  2018-02-01 total Total oils receipts      2359.6383
#> 99  2018-03-01 total Total oils receipts      2052.7200
#> 100 2018-04-01 total Total oils receipts      2414.7181
#> 101 2018-05-01 total Total oils receipts      2301.5663
#> 102 2018-06-01 total Total oils receipts      2458.9393
#> 103 2018-07-01 total Total oils receipts      2338.3228
#> 104 2018-08-01 total Total oils receipts      2364.1394
#> 105 2018-09-01 total Total oils receipts      2401.7323
#> 106 2018-10-01 total Total oils receipts      2229.0982
#> 107 2018-11-01 total Total oils receipts      2518.0977
#> 108 2018-12-01 total Total oils receipts      2364.0371
#> 109 2019-01-01 total Total oils receipts      2229.9826
#> 110 2019-02-01 total Total oils receipts      2241.2551
#> 111 2019-03-01 total Total oils receipts      2141.7613
#> 112 2019-04-01 total Total oils receipts      2380.3527
#> 113 2019-05-01 total Total oils receipts      2276.9906
#> 114 2019-06-01 total Total oils receipts      2393.0578
#> 115 2019-07-01 total Total oils receipts      2278.8466
#> 116 2019-08-01 total Total oils receipts      2394.1339
#> 117 2019-09-01 total Total oils receipts      2355.7347
#> 118 2019-10-01 total Total oils receipts      2308.1328
#> 119 2019-11-01 total Total oils receipts      2362.3910
#> 120 2019-12-01 total Total oils receipts      2433.4750
#> 121 2020-01-01 total Total oils receipts      2133.1062
#> 122 2020-02-01 total Total oils receipts      2302.1470
#> 123 2020-03-01 total Total oils receipts      1954.5466
#> 124 2020-04-01 total Total oils receipts      1373.0199
#> 125 2020-05-01 total Total oils receipts       990.2173
#> 126 2020-06-01 total Total oils receipts      1618.5982
#> 127 2020-07-01 total Total oils receipts      1839.6849
#> 128 2020-08-01 total Total oils receipts      2124.6592
#> 129 2020-09-01 total Total oils receipts      2123.0717
#> 130 2020-10-01 total Total oils receipts      2161.6180
#> 131 2020-11-01 total Total oils receipts      2110.7302
#> 132 2020-12-01 total Total oils receipts      1914.2576
#> 133 2021-01-01 total Total oils receipts      1694.0021
#> 134 2021-02-01 total Total oils receipts      1580.5224
#> 135 2021-03-01 total Total oils receipts      1401.8245
#> 136 2021-04-01 total Total oils receipts      2011.0142
#> 137 2021-05-01 total Total oils receipts      2310.2163
#> 138 2021-06-01 total Total oils receipts      2249.8588
#> 139 2021-07-01 total Total oils receipts      2266.3163
#> 140 2021-08-01 total Total oils receipts      2285.2151
#> 141 2021-09-01 total Total oils receipts      2249.7358
#> 142 2021-10-01 total Total oils receipts      2266.2945
#> 143 2021-11-01 total Total oils receipts      2230.2494
#> 144 2021-12-01 total Total oils receipts      2282.7500
#> 145 2022-01-01 total Total oils receipts      1838.5661
#> 146 2022-02-01 total Total oils receipts      2038.6416
#> 147 2022-03-01 total Total oils receipts      1913.8915
#> 148 2022-04-01 total Total oils receipts      2095.0621
#> 149 2022-05-01 total Total oils receipts      2277.2287
#> 150 2022-06-01 total Total oils receipts      2169.3240
#> 151 2022-07-01 total Total oils receipts      2062.8541
#> 152 2022-08-01 total Total oils receipts      2126.9383
#> 153 2022-09-01 total Total oils receipts      2010.6633
#> 154 2022-10-01 total Total oils receipts      2130.3221
#> 155 2022-11-01 total Total oils receipts      2117.3241
#> 156 2022-12-01 total Total oils receipts      2067.8813
#> 157 2023-01-01 total Total oils receipts      1964.4677
#> 158 2023-02-01 total Total oils receipts      2176.1714
#> 159 2023-03-01 total Total oils receipts      1901.2880
#> 160 2023-04-01 total Total oils receipts      2078.0054
#> 161 2023-05-01 total Total oils receipts      2050.2528
#> 162 2023-06-01 total Total oils receipts      2127.9254
#> 163 2023-07-01 total Total oils receipts      1674.1160
#> 164 2023-08-01 total Total oils receipts      2545.5867
#> 165 2023-09-01 total Total oils receipts      1954.3961
#> 166 2023-10-01 total Total oils receipts      2113.7268
#> 167 2023-11-01 total Total oils receipts      2225.8932
#> 168 2023-12-01 total Total oils receipts      2093.6272
#> 169 2024-01-01 total Total oils receipts      1834.2760
#> 170 2024-02-01 total Total oils receipts      2107.2286
#> 171 2024-03-01 total Total oils receipts      2022.6339
#> 172 2024-04-01 total Total oils receipts      1903.1664
#> 173 2024-05-01 total Total oils receipts      2044.1541
#> 174 2024-06-01 total Total oils receipts      2066.8901
#> 175 2024-07-01 total Total oils receipts      2116.4169
#> 176 2024-08-01 total Total oils receipts      2054.4287
#> 177 2024-09-01 total Total oils receipts      2059.0598
#> 178 2024-10-01 total Total oils receipts      1983.3727
#> 179 2024-11-01 total Total oils receipts      2253.0232
#> 180 2024-12-01 total Total oils receipts      1904.0139
#> 181 2025-01-01 total Total oils receipts      1779.9008
#> 182 2025-02-01 total Total oils receipts      2154.9072
#> 183 2025-03-01 total Total oils receipts      2041.0681
#> 184 2025-04-01 total Total oils receipts      2006.2986
#> 185 2025-05-01 total Total oils receipts      2095.4296
#> 186 2025-06-01 total Total oils receipts      1901.6869
#> 187 2025-07-01 total Total oils receipts      2028.9216
#> 188 2025-08-01 total Total oils receipts      2005.2785
#> 189 2025-09-01 total Total oils receipts      2180.1952
#> 190 2025-10-01 total Total oils receipts      1991.7973
#> 191 2025-11-01 total Total oils receipts      2228.1181
#> 192 2025-12-01 total Total oils receipts      2072.1497
hmrc_fuel_duties()
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [25ms]
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
#> • `` -> `...16`
#> • `` -> `...17`
#> ✔ Parsing data [176ms]
#> 
#> # Hydrocarbon Oils Bulletin (fuel duties)
#> # Source: https://www.gov.uk/government/statistics/hydrocarbon-oils-bulletin
#> # Fetched 2026-04-26 13:11:25 UTC | Vintage: latest | Cells: cash | Freq: monthly | 1,728 rows x 4 cols
#> 
#>            date   fuel         description receipts_gbp_m
#> 1    1990-01-01 diesel       Diesel duties     318.094000
#> 2    1990-02-01 diesel       Diesel duties     360.440000
#> 3    1990-03-01 diesel       Diesel duties     357.932048
#> 4    1990-04-01 diesel       Diesel duties     427.196000
#> 5    1990-05-01 diesel       Diesel duties     397.710000
#> 6    1990-06-01 diesel       Diesel duties     422.672000
#> 7    1990-07-01 diesel       Diesel duties     408.200000
#> 8    1990-08-01 diesel       Diesel duties     411.282000
#> 9    1990-09-01 diesel       Diesel duties     425.556000
#> 10   1990-10-01 diesel       Diesel duties     398.468000
#> 11   1990-11-01 diesel       Diesel duties     421.256000
#> 12   1990-12-01 diesel       Diesel duties     431.536000
#> 13   1991-01-01 diesel       Diesel duties     346.958000
#> 14   1991-02-01 diesel       Diesel duties     424.388000
#> 15   1991-03-01 diesel       Diesel duties     382.692160
#> 16   1991-04-01 diesel       Diesel duties     458.218000
#> 17   1991-05-01 diesel       Diesel duties     459.176000
#> 18   1991-06-01 diesel       Diesel duties     476.588000
#> 19   1991-07-01 diesel       Diesel duties     448.740000
#> 20   1991-08-01 diesel       Diesel duties     443.508000
#> 21   1991-09-01 diesel       Diesel duties     460.020000
#> 22   1991-10-01 diesel       Diesel duties     478.174000
#> 23   1991-11-01 diesel       Diesel duties     531.088000
#> 24   1991-12-01 diesel       Diesel duties     487.151242
#> 25   1992-01-01 diesel       Diesel duties     404.040792
#> 26   1992-02-01 diesel       Diesel duties     484.320404
#> 27   1992-03-01 diesel       Diesel duties     447.446442
#> 28   1992-04-01 diesel       Diesel duties     526.722283
#> 29   1992-05-01 diesel       Diesel duties     459.174017
#> 30   1992-06-01 diesel       Diesel duties     509.765065
#> 31   1992-07-01 diesel       Diesel duties     485.422173
#> 32   1992-08-01 diesel       Diesel duties     504.613940
#> 33   1992-09-01 diesel       Diesel duties     459.043315
#> 34   1992-10-01 diesel       Diesel duties     527.820953
#> 35   1992-11-01 diesel       Diesel duties     572.720009
#> 36   1992-12-01 diesel       Diesel duties     513.791261
#> 37   1993-01-01 diesel       Diesel duties     483.594350
#> 38   1993-02-01 diesel       Diesel duties     490.740845
#> 39   1993-03-01 diesel       Diesel duties     527.492115
#> 40   1993-04-01 diesel       Diesel duties     611.470691
#> 41   1993-05-01 diesel       Diesel duties     541.796759
#> 42   1993-06-01 diesel       Diesel duties     542.673175
#> 43   1993-07-01 diesel       Diesel duties     605.925352
#> 44   1993-08-01 diesel       Diesel duties     604.317150
#> 45   1993-09-01 diesel       Diesel duties     563.279541
#> 46   1993-10-01 diesel       Diesel duties     627.013433
#> 47   1993-11-01 diesel       Diesel duties     677.174486
#> 48   1993-12-01 diesel       Diesel duties     692.024373
#> 49   1994-01-01 diesel       Diesel duties     598.216753
#> 50   1994-02-01 diesel       Diesel duties     619.918426
#> 51   1994-03-01 diesel       Diesel duties     633.223415
#> 52   1994-04-01 diesel       Diesel duties     714.611068
#> 53   1994-05-01 diesel       Diesel duties     696.176236
#> 54   1994-06-01 diesel       Diesel duties     698.775144
#> 55   1994-07-01 diesel       Diesel duties     718.922857
#> 56   1994-08-01 diesel       Diesel duties     689.065472
#> 57   1994-09-01 diesel       Diesel duties     689.824344
#> 58   1994-10-01 diesel       Diesel duties     767.648782
#> 59   1994-11-01 diesel       Diesel duties     863.073763
#> 60   1994-12-01 diesel       Diesel duties     825.081867
#> 61   1995-01-01 diesel       Diesel duties     703.001376
#> 62   1995-02-01 diesel       Diesel duties     751.571248
#> 63   1995-03-01 diesel       Diesel duties     778.260925
#> 64   1995-04-01 diesel       Diesel duties     920.496402
#> 65   1995-05-01 diesel       Diesel duties     746.771390
#> 66   1995-06-01 diesel       Diesel duties     879.760226
#> 67   1995-07-01 diesel       Diesel duties     860.380742
#> 68   1995-08-01 diesel       Diesel duties     833.790901
#> 69   1995-09-01 diesel       Diesel duties     858.587658
#> 70   1995-10-01 diesel       Diesel duties     884.909382
#> 71   1995-11-01 diesel       Diesel duties    1015.090430
#> 72   1995-12-01 diesel       Diesel duties    1022.200092
#> 73   1996-01-01 diesel       Diesel duties     695.586608
#> 74   1996-02-01 diesel       Diesel duties     952.939558
#> 75   1996-03-01 diesel       Diesel duties     906.478866
#> 76   1996-04-01 diesel       Diesel duties     945.429584
#> 77   1996-05-01 diesel       Diesel duties     957.776188
#> 78   1996-06-01 diesel       Diesel duties    1061.653850
#> 79   1996-07-01 diesel       Diesel duties     933.187050
#> 80   1996-08-01 diesel       Diesel duties    1006.316826
#> 81   1996-09-01 diesel       Diesel duties     959.871692
#> 82   1996-10-01 diesel       Diesel duties    1008.425198
#> 83   1996-11-01 diesel       Diesel duties    1179.211598
#> 84   1996-12-01 diesel       Diesel duties    1169.446412
#> 85   1997-01-01 diesel       Diesel duties     835.682010
#> 86   1997-02-01 diesel       Diesel duties     983.097464
#> 87   1997-03-01 diesel       Diesel duties    1072.128854
#> 88   1997-04-01 diesel       Diesel duties    1054.861898
#> 89   1997-05-01 diesel       Diesel duties    1082.695326
#> 90   1997-06-01 diesel       Diesel duties    1192.766673
#> 91   1997-07-01 diesel       Diesel duties    1253.616380
#> 92   1997-08-01 diesel       Diesel duties    1033.900309
#> 93   1997-09-01 diesel       Diesel duties    1094.886582
#> 94   1997-10-01 diesel       Diesel duties    1212.153788
#> 95   1997-11-01 diesel       Diesel duties    1335.163906
#> 96   1997-12-01 diesel       Diesel duties    1197.385464
#> 97   1998-01-01 diesel       Diesel duties    1080.602369
#> 98   1998-02-01 diesel       Diesel duties    1246.054739
#> 99   1998-03-01 diesel       Diesel duties    1418.888803
#> 100  1998-04-01 diesel       Diesel duties    1264.243615
#> 101  1998-05-01 diesel       Diesel duties    1177.477102
#> 102  1998-06-01 diesel       Diesel duties    1311.240006
#> 103  1998-07-01 diesel       Diesel duties    1329.515026
#> 104  1998-08-01 diesel       Diesel duties    1379.887889
#> 105  1998-09-01 diesel       Diesel duties    1295.326988
#> 106  1998-10-01 diesel       Diesel duties    1393.113615
#> 107  1998-11-01 diesel       Diesel duties    1477.926358
#> 108  1998-12-01 diesel       Diesel duties    1413.302512
#> 109  1999-01-01 diesel       Diesel duties    1239.373437
#> 110  1999-02-01 diesel       Diesel duties    1388.764939
#> 111  1999-03-01 diesel       Diesel duties    1724.277483
#> 112  1999-04-01 diesel       Diesel duties    1361.525284
#> 113  1999-05-01 diesel       Diesel duties    1287.842758
#> 114  1999-06-01 diesel       Diesel duties    1347.674112
#> 115  1999-07-01 diesel       Diesel duties    1430.362208
#> 116  1999-08-01 diesel       Diesel duties    1403.936976
#> 117  1999-09-01 diesel       Diesel duties    1374.716972
#> 118  1999-10-01 diesel       Diesel duties    1450.640828
#> 119  1999-11-01 diesel       Diesel duties    1615.094501
#> 120  1999-12-01 diesel       Diesel duties    1600.371143
#> 121  2000-01-01 diesel       Diesel duties    1279.244180
#> 122  2000-02-01 diesel       Diesel duties    1554.289049
#> 123  2000-03-01 diesel       Diesel duties    1572.875973
#> 124  2000-04-01 diesel       Diesel duties    1671.899693
#> 125  2000-05-01 diesel       Diesel duties    1306.746556
#> 126  2000-06-01 diesel       Diesel duties    1541.372889
#> 127  2000-07-01 diesel       Diesel duties    1449.436409
#> 128  2000-08-01 diesel       Diesel duties    1548.491479
#> 129  2000-09-01 diesel       Diesel duties    1436.370352
#> 130  2000-10-01 diesel       Diesel duties    1538.584511
#> 131  2000-11-01 diesel       Diesel duties    1756.132799
#> 132  2000-12-01 diesel       Diesel duties    1530.949380
#> 133  2001-01-01 diesel       Diesel duties    1299.466987
#> 134  2001-02-01 diesel       Diesel duties    1539.331041
#> 135  2001-03-01 diesel       Diesel duties    1392.398867
#> 136  2001-04-01 diesel       Diesel duties    1505.168749
#> 137  2001-05-01 diesel       Diesel duties    1353.064557
#> 138  2001-06-01 diesel       Diesel duties    1520.722433
#> 139  2001-07-01 diesel       Diesel duties    1447.009269
#> 140  2001-08-01 diesel       Diesel duties    1466.944662
#> 141  2001-09-01 diesel       Diesel duties    1573.984205
#> 142  2001-10-01 diesel       Diesel duties    1410.557254
#> 143  2001-11-01 diesel       Diesel duties    1522.619261
#> 144  2001-12-01 diesel       Diesel duties    1596.803531
#> 145  2002-01-01 diesel       Diesel duties    1239.388388
#> 146  2002-02-01 diesel       Diesel duties    1484.674651
#> 147  2002-03-01 diesel       Diesel duties    1400.010984
#> 148  2002-04-01 diesel       Diesel duties    1558.760997
#> 149  2002-05-01 diesel       Diesel duties    1498.041935
#> 150  2002-06-01 diesel       Diesel duties    1541.931833
#> 151  2002-07-01 diesel       Diesel duties    1512.539467
#> 152  2002-08-01 diesel       Diesel duties    1627.831171
#> 153  2002-09-01 diesel       Diesel duties    1475.014725
#> 154  2002-10-01 diesel       Diesel duties    1590.268325
#> 155  2002-11-01 diesel       Diesel duties    1643.051017
#> 156  2002-12-01 diesel       Diesel duties    1540.573976
#> 157  2003-01-01 diesel       Diesel duties    1332.841760
#> 158  2003-02-01 diesel       Diesel duties    1607.434401
#> 159  2003-03-01 diesel       Diesel duties    1495.237077
#> 160  2003-04-01 diesel       Diesel duties    1692.671886
#> 161  2003-05-01 diesel       Diesel duties    1494.734765
#> 162  2003-06-01 diesel       Diesel duties    1601.177673
#> 163  2003-07-01 diesel       Diesel duties    1604.743656
#> 164  2003-08-01 diesel       Diesel duties    1617.395252
#> 165  2003-09-01 diesel       Diesel duties    1625.943992
#> 166  2003-10-01 diesel       Diesel duties    1756.152308
#> 167  2003-11-01 diesel       Diesel duties    1703.679345
#> 168  2003-12-01 diesel       Diesel duties    1735.430414
#> 169  2004-01-01 diesel       Diesel duties    1486.188904
#> 170  2004-02-01 diesel       Diesel duties    1703.358813
#> 171  2004-03-01 diesel       Diesel duties    1674.962840
#> 172  2004-04-01 diesel       Diesel duties    1794.220780
#> 173  2004-05-01 diesel       Diesel duties    1693.648779
#> 174  2004-06-01 diesel       Diesel duties    1775.814576
#> 175  2004-07-01 diesel       Diesel duties    1621.639257
#> 176  2004-08-01 diesel       Diesel duties    1798.636472
#> 177  2004-09-01 diesel       Diesel duties    1777.301444
#> 178  2004-10-01 diesel       Diesel duties    1795.166239
#> 179  2004-11-01 diesel       Diesel duties    1840.165021
#> 180  2004-12-01 diesel       Diesel duties    1933.768475
#> 181  2005-01-01 diesel       Diesel duties    1603.815772
#> 182  2005-02-01 diesel       Diesel duties    1852.167360
#> 183  2005-03-01 diesel       Diesel duties    1610.093334
#> 184  2005-04-01 diesel       Diesel duties    1929.509697
#> 185  2005-05-01 diesel       Diesel duties    1748.357511
#> 186  2005-06-01 diesel       Diesel duties    1830.132815
#> 187  2005-07-01 diesel       Diesel duties    1881.177599
#> 188  2005-08-01 diesel       Diesel duties    1817.574723
#> 189  2005-09-01 diesel       Diesel duties    1896.347283
#> 190  2005-10-01 diesel       Diesel duties    1828.905144
#> 191  2005-11-01 diesel       Diesel duties    1897.509092
#> 192  2005-12-01 diesel       Diesel duties    1981.371133
#> 193  2006-01-01 diesel       Diesel duties    1680.478788
#> 194  2006-02-01 diesel       Diesel duties    1880.426020
#> 195  2006-03-01 diesel       Diesel duties    1752.310666
#> 196  2006-04-01 diesel       Diesel duties    1991.370878
#> 197  2006-05-01 diesel       Diesel duties    1810.238923
#> 198  2006-06-01 diesel       Diesel duties    1935.540380
#> 199  2006-07-01 diesel       Diesel duties    1896.551574
#> 200  2006-08-01 diesel       Diesel duties    1935.945532
#> 201  2006-09-01 diesel       Diesel duties    1909.595035
#> 202  2006-10-01 diesel       Diesel duties    1926.050769
#> 203  2006-11-01 diesel       Diesel duties    2038.946149
#> 204  2006-12-01 diesel       Diesel duties    2069.408142
#> 205  2007-01-01 diesel       Diesel duties    1782.340464
#> 206  2007-02-01 diesel       Diesel duties    2022.340057
#> 207  2007-03-01 diesel       Diesel duties    1880.990958
#> 208  2007-04-01 diesel       Diesel duties    2095.872815
#> 209  2007-05-01 diesel       Diesel duties    2036.385143
#> 210  2007-06-01 diesel       Diesel duties    2069.294461
#> 211  2007-07-01 diesel       Diesel duties    2033.002008
#> 212  2007-08-01 diesel       Diesel duties    2063.705082
#> 213  2007-09-01 diesel       Diesel duties    2093.126668
#> 214  2007-10-01 diesel       Diesel duties    2225.244999
#> 215  2007-11-01 diesel       Diesel duties    2193.008139
#> 216  2007-12-01 diesel       Diesel duties    2233.739815
#> 217  2008-01-01 diesel       Diesel duties    1886.333330
#> 218  2008-02-01 diesel       Diesel duties    2203.952909
#> 219  2008-03-01 diesel       Diesel duties    2167.286077
#> 220  2008-04-01 diesel       Diesel duties    2175.127765
#> 221  2008-05-01 diesel       Diesel duties    2162.017918
#> 222  2008-06-01 diesel       Diesel duties    2205.366056
#> 223  2008-07-01 diesel       Diesel duties    2109.682994
#> 224  2008-08-01 diesel       Diesel duties    2080.145708
#> 225  2008-09-01 diesel       Diesel duties    2037.375314
#> 226  2008-10-01 diesel       Diesel duties    2140.438885
#> 227  2008-11-01 diesel       Diesel duties    2217.669852
#> 228  2008-12-01 diesel       Diesel duties    2166.552131
#> 229  2009-01-01 diesel       Diesel duties    1926.864215
#> 230  2009-02-01 diesel       Diesel duties    2162.209062
#> 231  2009-03-01 diesel       Diesel duties    1994.496666
#> 232  2009-04-01 diesel       Diesel duties    2352.552373
#> 233  2009-05-01 diesel       Diesel duties    2087.887825
#> 234  2009-06-01 diesel       Diesel duties    2245.034098
#> 235  2009-07-01 diesel       Diesel duties    2231.795987
#> 236  2009-08-01 diesel       Diesel duties    2343.046731
#> 237  2009-09-01 diesel       Diesel duties    2394.040671
#> 238  2009-10-01 diesel       Diesel duties    2249.517661
#> 239  2009-11-01 diesel       Diesel duties    2389.515891
#> 240  2009-12-01 diesel       Diesel duties    2420.387510
#> 241  2010-01-01 diesel       Diesel duties    2030.632070
#> 242  2010-02-01 diesel       Diesel duties    2367.595746
#> 243  2010-03-01 diesel       Diesel duties    2295.073514
#> 244  2010-04-01 diesel       Diesel duties    2562.308392
#> 245  2010-05-01 diesel       Diesel duties    2326.504992
#> 246  2010-06-01 diesel       Diesel duties    2424.764626
#> 247  2010-07-01 diesel       Diesel duties    2502.523325
#> 248  2010-08-01 diesel       Diesel duties    2512.146357
#> 249  2010-09-01 diesel       Diesel duties    2509.138019
#> 250  2010-10-01 diesel       Diesel duties    2585.012464
#> 251  2010-11-01 diesel       Diesel duties    2602.909347
#> 252  2010-12-01 diesel       Diesel duties    2478.365000
#> 253  2011-01-01 diesel       Diesel duties    2276.746764
#> 254  2011-02-01 diesel       Diesel duties    2494.466649
#> 255  2011-03-01 diesel       Diesel duties    2377.113418
#> 256  2011-04-01 diesel       Diesel duties    2623.895989
#> 257  2011-05-01 diesel       Diesel duties    2327.369424
#> 258  2011-06-01 diesel       Diesel duties    2525.254759
#> 259  2011-07-01 diesel       Diesel duties    2537.763651
#> 260  2011-08-01 diesel       Diesel duties    2444.207477
#> 261  2011-09-01 diesel       Diesel duties    2558.007586
#> 262  2011-10-01 diesel       Diesel duties    2568.304402
#> 263  2011-11-01 diesel       Diesel duties    2595.424967
#> 264  2011-12-01 diesel       Diesel duties    2560.558106
#> 265  2012-01-01 diesel       Diesel duties    2311.294178
#> 266  2012-02-01 diesel       Diesel duties    2471.256656
#> 267  2012-03-01 diesel       Diesel duties    2364.894660
#> 268  2012-04-01 diesel       Diesel duties    2699.492779
#> 269  2012-05-01 diesel       Diesel duties    2356.202515
#> 270  2012-06-01 diesel       Diesel duties    2559.411880
#> 271  2012-07-01 diesel       Diesel duties    2539.309211
#> 272  2012-08-01 diesel       Diesel duties    2549.715440
#> 273  2012-09-01 diesel       Diesel duties    2574.003447
#> 274  2012-10-01 diesel       Diesel duties    2547.682626
#> 275  2012-11-01 diesel       Diesel duties    2704.190476
#> 276  2012-12-01 diesel       Diesel duties    2745.654672
#> 277  2013-01-01 diesel       Diesel duties    2229.104651
#> 278  2013-02-01 diesel       Diesel duties    2544.189816
#> 279  2013-03-01 diesel       Diesel duties    2444.244427
#> 280  2013-04-01 diesel       Diesel duties    2655.512204
#> 281  2013-05-01 diesel       Diesel duties    2617.399070
#> 282  2013-06-01 diesel       Diesel duties    2701.363977
#> 283  2013-07-01 diesel       Diesel duties    2564.936426
#> 284  2013-08-01 diesel       Diesel duties    2689.330741
#> 285  2013-09-01 diesel       Diesel duties    2645.342180
#> 286  2013-10-01 diesel       Diesel duties    2607.100372
#> 287  2013-11-01 diesel       Diesel duties    2824.679461
#> 288  2013-12-01 diesel       Diesel duties    2734.252625
#> 289  2014-01-01 diesel       Diesel duties    2337.076488
#> 290  2014-02-01 diesel       Diesel duties    2682.693436
#> 291  2014-03-01 diesel       Diesel duties    2584.472184
#> 292  2014-04-01 diesel       Diesel duties    2756.166849
#> 293  2014-05-01 diesel       Diesel duties    2623.977299
#> 294  2014-06-01 diesel       Diesel duties    2757.605765
#> 295  2014-07-01 diesel       Diesel duties    2704.518748
#> 296  2014-08-01 diesel       Diesel duties    2816.529425
#> 297  2014-09-01 diesel       Diesel duties    2672.731214
#> 298  2014-10-01 diesel       Diesel duties    2731.800340
#> 299  2014-11-01 diesel       Diesel duties    2898.579571
#> 300  2014-12-01 diesel       Diesel duties    2868.586280
#> 301  2015-01-01 diesel       Diesel duties    2430.125685
#> 302  2015-02-01 diesel       Diesel duties    2802.677750
#> 303  2015-03-01 diesel       Diesel duties    2618.857984
#> 304  2015-04-01 diesel       Diesel duties    2802.759756
#> 305  2015-05-01 diesel       Diesel duties    2773.570217
#> 306  2015-06-01 diesel       Diesel duties    2890.369235
#> 307  2015-07-01 diesel       Diesel duties    2819.847477
#> 308  2015-08-01 diesel       Diesel duties    2896.024494
#> 309  2015-09-01 diesel       Diesel duties    2751.401206
#> 310  2015-10-01 diesel       Diesel duties    2832.831817
#> 311  2015-11-01 diesel       Diesel duties    2983.479175
#> 312  2015-12-01 diesel       Diesel duties    2874.647531
#> 313  2016-01-01 diesel       Diesel duties    2607.412286
#> 314  2016-02-01 diesel       Diesel duties    2872.731111
#> 315  2016-03-01 diesel       Diesel duties    2825.901151
#> 316  2016-04-01 diesel       Diesel duties    2966.648995
#> 317  2016-05-01 diesel       Diesel duties    2824.372039
#> 318  2016-06-01 diesel       Diesel duties    2995.919198
#> 319  2016-07-01 diesel       Diesel duties    2926.184876
#> 320  2016-08-01 diesel       Diesel duties    2937.869648
#> 321  2016-09-01 diesel       Diesel duties    2888.064528
#> 322  2016-10-01 diesel       Diesel duties    2962.881228
#> 323  2016-11-01 diesel       Diesel duties    3042.105126
#> 324  2016-12-01 diesel       Diesel duties    3036.405379
#> 325  2017-01-01 diesel       Diesel duties    2463.348726
#> 326  2017-02-01 diesel       Diesel duties    3116.066351
#> 327  2017-03-01 diesel       Diesel duties    2736.150556
#> 328  2017-04-01 diesel       Diesel duties    3106.197221
#> 329  2017-05-01 diesel       Diesel duties    2807.184331
#> 330  2017-06-01 diesel       Diesel duties    3010.540634
#> 331  2017-07-01 diesel       Diesel duties    2977.412296
#> 332  2017-08-01 diesel       Diesel duties    2927.749345
#> 333  2017-09-01 diesel       Diesel duties    2960.234748
#> 334  2017-10-01 diesel       Diesel duties    2929.544271
#> 335  2017-11-01 diesel       Diesel duties    3092.561536
#> 336  2017-12-01 diesel       Diesel duties    3117.940548
#> 337  2018-01-01 diesel       Diesel duties    2642.723828
#> 338  2018-02-01 diesel       Diesel duties    3048.360543
#> 339  2018-03-01 diesel       Diesel duties    2625.754729
#> 340  2018-04-01 diesel       Diesel duties    3100.730800
#> 341  2018-05-01 diesel       Diesel duties    2870.166511
#> 342  2018-06-01 diesel       Diesel duties    3059.250376
#> 343  2018-07-01 diesel       Diesel duties    2984.476014
#> 344  2018-08-01 diesel       Diesel duties    2985.033417
#> 345  2018-09-01 diesel       Diesel duties    3022.403850
#> 346  2018-10-01 diesel       Diesel duties    2826.703778
#> 347  2018-11-01 diesel       Diesel duties    3178.042671
#> 348  2018-12-01 diesel       Diesel duties    3017.506917
#> 349  2019-01-01 diesel       Diesel duties    2764.438192
#> 350  2019-02-01 diesel       Diesel duties    2814.951270
#> 351  2019-03-01 diesel       Diesel duties    2684.691497
#> 352  2019-04-01 diesel       Diesel duties    3056.726650
#> 353  2019-05-01 diesel       Diesel duties    2822.123358
#> 354  2019-06-01 diesel       Diesel duties    2972.572455
#> 355  2019-07-01 diesel       Diesel duties    2859.749491
#> 356  2019-08-01 diesel       Diesel duties    2996.329485
#> 357  2019-09-01 diesel       Diesel duties    2931.717976
#> 358  2019-10-01 diesel       Diesel duties    2891.976113
#> 359  2019-11-01 diesel       Diesel duties    2983.387386
#> 360  2019-12-01 diesel       Diesel duties    3032.095761
#> 361  2020-01-01 diesel       Diesel duties    2647.932796
#> 362  2020-02-01 diesel       Diesel duties    2929.577530
#> 363  2020-03-01 diesel       Diesel duties    2436.171821
#> 364  2020-04-01 diesel       Diesel duties    1798.043515
#> 365  2020-05-01 diesel       Diesel duties    1390.878747
#> 366  2020-06-01 diesel       Diesel duties    2058.861682
#> 367  2020-07-01 diesel       Diesel duties    2371.498998
#> 368  2020-08-01 diesel       Diesel duties    2671.831006
#> 369  2020-09-01 diesel       Diesel duties    2671.965734
#> 370  2020-10-01 diesel       Diesel duties    2704.029513
#> 371  2020-11-01 diesel       Diesel duties    2747.336687
#> 372  2020-12-01 diesel       Diesel duties    2563.594179
#> 373  2021-01-01 diesel       Diesel duties    2122.692847
#> 374  2021-02-01 diesel       Diesel duties    2233.901106
#> 375  2021-03-01 diesel       Diesel duties    1929.674551
#> 376  2021-04-01 diesel       Diesel duties    2601.742617
#> 377  2021-05-01 diesel       Diesel duties    2884.630014
#> 378  2021-06-01 diesel       Diesel duties    2782.934031
#> 379  2021-07-01 diesel       Diesel duties    2807.251743
#> 380  2021-08-01 diesel       Diesel duties    2845.913969
#> 381  2021-09-01 diesel       Diesel duties    2745.097294
#> 382  2021-10-01 diesel       Diesel duties    2812.134934
#> 383  2021-11-01 diesel       Diesel duties    2782.156397
#> 384  2021-12-01 diesel       Diesel duties    2852.398802
#> 385  2022-01-01 diesel       Diesel duties    2227.991424
#> 386  2022-02-01 diesel       Diesel duties    2554.225785
#> 387  2022-03-01 diesel       Diesel duties    2401.620026
#> 388  2022-04-01 diesel       Diesel duties    2749.525597
#> 389  2022-05-01 diesel       Diesel duties    2863.224062
#> 390  2022-06-01 diesel       Diesel duties    2708.812376
#> 391  2022-07-01 diesel       Diesel duties    2665.906401
#> 392  2022-08-01 diesel       Diesel duties    2738.835433
#> 393  2022-09-01 diesel       Diesel duties    2542.240805
#> 394  2022-10-01 diesel       Diesel duties    2774.260808
#> 395  2022-11-01 diesel       Diesel duties    2703.391723
#> 396  2022-12-01 diesel       Diesel duties    2644.092914
#> 397  2023-01-01 diesel       Diesel duties    2430.379622
#> 398  2023-02-01 diesel       Diesel duties    2744.445427
#> 399  2023-03-01 diesel       Diesel duties    2439.557879
#> 400  2023-04-01 diesel       Diesel duties    2656.547326
#> 401  2023-05-01 diesel       Diesel duties    2533.749002
#> 402  2023-06-01 diesel       Diesel duties    2657.738167
#> 403  2023-07-01 diesel       Diesel duties    2082.002442
#> 404  2023-08-01 diesel       Diesel duties    3164.215296
#> 405  2023-09-01 diesel       Diesel duties    2395.963062
#> 406  2023-10-01 diesel       Diesel duties    2606.378422
#> 407  2023-11-01 diesel       Diesel duties    2784.527798
#> 408  2023-12-01 diesel       Diesel duties    2623.563333
#> 409  2024-01-01 diesel       Diesel duties    2177.656324
#> 410  2024-02-01 diesel       Diesel duties    2633.697769
#> 411  2024-03-01 diesel       Diesel duties    2517.199660
#> 412  2024-04-01 diesel       Diesel duties    2336.820029
#> 413  2024-05-01 diesel       Diesel duties    2508.779691
#> 414  2024-06-01 diesel       Diesel duties    2498.917784
#> 415  2024-07-01 diesel       Diesel duties    2538.612703
#> 416  2024-08-01 diesel       Diesel duties    2495.377762
#> 417  2024-09-01 diesel       Diesel duties    2450.595105
#> 418  2024-10-01 diesel       Diesel duties    2409.101805
#> 419  2024-11-01 diesel       Diesel duties    2705.141535
#> 420  2024-12-01 diesel       Diesel duties    2265.923119
#> 421  2025-01-01 diesel       Diesel duties    2054.107645
#> 422  2025-02-01 diesel       Diesel duties    2691.809623
#> 423  2025-03-01 diesel       Diesel duties    2469.691673
#> 424  2025-04-01 diesel       Diesel duties    2415.720578
#> 425  2025-05-01 diesel       Diesel duties    2454.817131
#> 426  2025-06-01 diesel       Diesel duties    2264.762589
#> 427  2025-07-01 diesel       Diesel duties    2453.814430
#> 428  2025-08-01 diesel       Diesel duties    2397.524928
#> 429  2025-09-01 diesel       Diesel duties    2511.400086
#> 430  2025-10-01 diesel       Diesel duties    2375.198103
#> 431  2025-11-01 diesel       Diesel duties    2686.845936
#> 432  2025-12-01 diesel       Diesel duties    2461.567046
#> 433  1990-01-01  other   Other fuel duties      18.579000
#> 434  1990-02-01  other   Other fuel duties      16.325000
#> 435  1990-03-01  other   Other fuel duties      15.997916
#> 436  1990-04-01  other   Other fuel duties      18.753000
#> 437  1990-05-01  other   Other fuel duties      16.831000
#> 438  1990-06-01  other   Other fuel duties      16.842000
#> 439  1990-07-01  other   Other fuel duties      15.740000
#> 440  1990-08-01  other   Other fuel duties      14.781000
#> 441  1990-09-01  other   Other fuel duties      12.493000
#> 442  1990-10-01  other   Other fuel duties      11.874000
#> 443  1990-11-01  other   Other fuel duties      13.419000
#> 444  1990-12-01  other   Other fuel duties      14.020000
#> 445  1991-01-01  other   Other fuel duties      13.676000
#> 446  1991-02-01  other   Other fuel duties      21.184000
#> 447  1991-03-01  other   Other fuel duties      17.703970
#> 448  1991-04-01  other   Other fuel duties      14.793300
#> 449  1991-05-01  other   Other fuel duties      15.827000
#> 450  1991-06-01  other   Other fuel duties      15.855000
#> 451  1991-07-01  other   Other fuel duties      15.301000
#> 452  1991-08-01  other   Other fuel duties      13.597000
#> 453  1991-09-01  other   Other fuel duties      16.016000
#> 454  1991-10-01  other   Other fuel duties      15.800000
#> 455  1991-11-01  other   Other fuel duties      18.831000
#> 456  1991-12-01  other   Other fuel duties      18.056515
#> 457  1992-01-01  other   Other fuel duties      16.346660
#> 458  1992-02-01  other   Other fuel duties      18.355186
#> 459  1992-03-01  other   Other fuel duties      12.858017
#> 460  1992-04-01  other   Other fuel duties      18.082091
#> 461  1992-05-01  other   Other fuel duties      16.169640
#> 462  1992-06-01  other   Other fuel duties      10.920915
#> 463  1992-07-01  other   Other fuel duties      11.979264
#> 464  1992-08-01  other   Other fuel duties      13.075427
#> 465  1992-09-01  other   Other fuel duties      12.639302
#> 466  1992-10-01  other   Other fuel duties      15.143812
#> 467  1992-11-01  other   Other fuel duties      17.987821
#> 468  1992-12-01  other   Other fuel duties      18.474388
#> 469  1993-01-01  other   Other fuel duties      16.517034
#> 470  1993-02-01  other   Other fuel duties      15.590235
#> 471  1993-03-01  other   Other fuel duties      14.691163
#> 472  1993-04-01  other   Other fuel duties      17.353410
#> 473  1993-05-01  other   Other fuel duties      13.540671
#> 474  1993-06-01  other   Other fuel duties      13.989742
#> 475  1993-07-01  other   Other fuel duties      13.157881
#> 476  1993-08-01  other   Other fuel duties      15.190658
#> 477  1993-09-01  other   Other fuel duties      15.678716
#> 478  1993-10-01  other   Other fuel duties      16.163955
#> 479  1993-11-01  other   Other fuel duties      18.545767
#> 480  1993-12-01  other   Other fuel duties      20.588025
#> 481  1994-01-01  other   Other fuel duties      19.681758
#> 482  1994-02-01  other   Other fuel duties      20.192019
#> 483  1994-03-01  other   Other fuel duties      11.233079
#> 484  1994-04-01  other   Other fuel duties      18.504505
#> 485  1994-05-01  other   Other fuel duties      17.353982
#> 486  1994-06-01  other   Other fuel duties      14.137717
#> 487  1994-07-01  other   Other fuel duties      13.454345
#> 488  1994-08-01  other   Other fuel duties      12.364648
#> 489  1994-09-01  other   Other fuel duties      13.412747
#> 490  1994-10-01  other   Other fuel duties      18.140127
#> 491  1994-11-01  other   Other fuel duties      16.042338
#> 492  1994-12-01  other   Other fuel duties      18.856382
#> 493  1995-01-01  other   Other fuel duties      20.860503
#> 494  1995-02-01  other   Other fuel duties      23.885097
#> 495  1995-03-01  other   Other fuel duties      23.529316
#> 496  1995-04-01  other   Other fuel duties      26.718604
#> 497  1995-05-01  other   Other fuel duties      17.534344
#> 498  1995-06-01  other   Other fuel duties      17.012115
#> 499  1995-07-01  other   Other fuel duties      15.342059
#> 500  1995-08-01  other   Other fuel duties      16.818194
#> 501  1995-09-01  other   Other fuel duties      19.517414
#> 502  1995-10-01  other   Other fuel duties      17.330748
#> 503  1995-11-01  other   Other fuel duties      18.613281
#> 504  1995-12-01  other   Other fuel duties      25.113746
#> 505  1996-01-01  other   Other fuel duties      20.754334
#> 506  1996-02-01  other   Other fuel duties      28.184583
#> 507  1996-03-01  other   Other fuel duties      25.643173
#> 508  1996-04-01  other   Other fuel duties      23.864089
#> 509  1996-05-01  other   Other fuel duties      19.861296
#> 510  1996-06-01  other   Other fuel duties      18.694410
#> 511  1996-07-01  other   Other fuel duties      16.482744
#> 512  1996-08-01  other   Other fuel duties      17.884050
#> 513  1996-09-01  other   Other fuel duties      19.752568
#> 514  1996-10-01  other   Other fuel duties      21.689077
#> 515  1996-11-01  other   Other fuel duties      22.536695
#> 516  1996-12-01  other   Other fuel duties      26.291526
#> 517  1997-01-01  other   Other fuel duties      26.086895
#> 518  1997-02-01  other   Other fuel duties      25.448091
#> 519  1997-03-01  other   Other fuel duties      22.346648
#> 520  1997-04-01  other   Other fuel duties      20.026472
#> 521  1997-05-01  other   Other fuel duties      17.528108
#> 522  1997-06-01  other   Other fuel duties      17.360096
#> 523  1997-07-01  other   Other fuel duties      14.957717
#> 524  1997-08-01  other   Other fuel duties      17.424774
#> 525  1997-09-01  other   Other fuel duties      19.062605
#> 526  1997-10-01  other   Other fuel duties      18.506230
#> 527  1997-11-01  other   Other fuel duties      17.935823
#> 528  1997-12-01  other   Other fuel duties      20.220250
#> 529  1998-01-01  other   Other fuel duties      19.797978
#> 530  1998-02-01  other   Other fuel duties      25.824565
#> 531  1998-03-01  other   Other fuel duties      18.703391
#> 532  1998-04-01  other   Other fuel duties      22.518457
#> 533  1998-05-01  other   Other fuel duties      19.256947
#> 534  1998-06-01  other   Other fuel duties      13.582433
#> 535  1998-07-01  other   Other fuel duties      18.200625
#> 536  1998-08-01  other   Other fuel duties      20.319664
#> 537  1998-09-01  other   Other fuel duties      18.888935
#> 538  1998-10-01  other   Other fuel duties      22.285212
#> 539  1998-11-01  other   Other fuel duties      21.761644
#> 540  1998-12-01  other   Other fuel duties      27.970433
#> 541  1999-01-01  other   Other fuel duties      24.101601
#> 542  1999-02-01  other   Other fuel duties      23.804787
#> 543  1999-03-01  other   Other fuel duties      22.178858
#> 544  1999-04-01  other   Other fuel duties      27.768263
#> 545  1999-05-01  other   Other fuel duties      22.151988
#> 546  1999-06-01  other   Other fuel duties      19.207822
#> 547  1999-07-01  other   Other fuel duties      18.461199
#> 548  1999-08-01  other   Other fuel duties      -9.219611
#> 549  1999-09-01  other   Other fuel duties      19.324430
#> 550  1999-10-01  other   Other fuel duties      24.744932
#> 551  1999-11-01  other   Other fuel duties      21.450589
#> 552  1999-12-01  other   Other fuel duties      24.732509
#> 553  2000-01-01  other   Other fuel duties      26.756680
#> 554  2000-02-01  other   Other fuel duties      24.718360
#> 555  2000-03-01  other   Other fuel duties      24.188718
#> 556  2000-04-01  other   Other fuel duties      24.435414
#> 557  2000-05-01  other   Other fuel duties      20.334912
#> 558  2000-06-01  other   Other fuel duties      18.676713
#> 559  2000-07-01  other   Other fuel duties      16.903959
#> 560  2000-08-01  other   Other fuel duties      21.798763
#> 561  2000-09-01  other   Other fuel duties      21.304422
#> 562  2000-10-01  other   Other fuel duties      26.527844
#> 563  2000-11-01  other   Other fuel duties      21.359280
#> 564  2000-12-01  other   Other fuel duties      22.020755
#> 565  2001-01-01  other   Other fuel duties      17.582467
#> 566  2001-02-01  other   Other fuel duties      30.768187
#> 567  2001-03-01  other   Other fuel duties      24.222171
#> 568  2001-04-01  other   Other fuel duties      28.467275
#> 569  2001-05-01  other   Other fuel duties      17.375874
#> 570  2001-06-01  other   Other fuel duties      22.326701
#> 571  2001-07-01  other   Other fuel duties      19.988344
#> 572  2001-08-01  other   Other fuel duties      18.490896
#> 573  2001-09-01  other   Other fuel duties      23.136385
#> 574  2001-10-01  other   Other fuel duties      23.725963
#> 575  2001-11-01  other   Other fuel duties      19.247885
#> 576  2001-12-01  other   Other fuel duties      20.839814
#> 577  2002-01-01  other   Other fuel duties      22.970107
#> 578  2002-02-01  other   Other fuel duties      27.674687
#> 579  2002-03-01  other   Other fuel duties      19.732430
#> 580  2002-04-01  other   Other fuel duties      22.145787
#> 581  2002-05-01  other   Other fuel duties      20.498806
#> 582  2002-06-01  other   Other fuel duties      15.079931
#> 583  2002-07-01  other   Other fuel duties      17.400971
#> 584  2002-08-01  other   Other fuel duties      18.327111
#> 585  2002-09-01  other   Other fuel duties      18.025757
#> 586  2002-10-01  other   Other fuel duties      22.570753
#> 587  2002-11-01  other   Other fuel duties      22.619649
#> 588  2002-12-01  other   Other fuel duties      22.575600
#> 589  2003-01-01  other   Other fuel duties      21.214534
#> 590  2003-02-01  other   Other fuel duties      25.143460
#> 591  2003-03-01  other   Other fuel duties      19.940092
#> 592  2003-04-01  other   Other fuel duties      25.331750
#> 593  2003-05-01  other   Other fuel duties      24.231186
#> 594  2003-06-01  other   Other fuel duties      22.537269
#> 595  2003-07-01  other   Other fuel duties      24.828699
#> 596  2003-08-01  other   Other fuel duties      25.677149
#> 597  2003-09-01  other   Other fuel duties      23.080736
#> 598  2003-10-01  other   Other fuel duties      26.600683
#> 599  2003-11-01  other   Other fuel duties      29.034250
#> 600  2003-12-01  other   Other fuel duties      23.940703
#> 601  2004-01-01  other   Other fuel duties      27.050358
#> 602  2004-02-01  other   Other fuel duties      26.824220
#> 603  2004-03-01  other   Other fuel duties      28.392365
#> 604  2004-04-01  other   Other fuel duties      29.636407
#> 605  2004-05-01  other   Other fuel duties      23.768732
#> 606  2004-06-01  other   Other fuel duties      23.685145
#> 607  2004-07-01  other   Other fuel duties      23.691326
#> 608  2004-08-01  other   Other fuel duties      21.964717
#> 609  2004-09-01  other   Other fuel duties      25.040419
#> 610  2004-10-01  other   Other fuel duties      28.139798
#> 611  2004-11-01  other   Other fuel duties      24.355112
#> 612  2004-12-01  other   Other fuel duties      30.398145
#> 613  2005-01-01  other   Other fuel duties      30.538565
#> 614  2005-02-01  other   Other fuel duties      37.305235
#> 615  2005-03-01  other   Other fuel duties      32.819437
#> 616  2005-04-01  other   Other fuel duties      34.492577
#> 617  2005-05-01  other   Other fuel duties      31.798590
#> 618  2005-06-01  other   Other fuel duties      24.937652
#> 619  2005-07-01  other   Other fuel duties      31.494803
#> 620  2005-08-01  other   Other fuel duties      31.957182
#> 621  2005-09-01  other   Other fuel duties      32.814361
#> 622  2005-10-01  other   Other fuel duties      30.929610
#> 623  2005-11-01  other   Other fuel duties      28.694029
#> 624  2005-12-01  other   Other fuel duties      43.754214
#> 625  2006-01-01  other   Other fuel duties      55.708790
#> 626  2006-02-01  other   Other fuel duties      52.207042
#> 627  2006-03-01  other   Other fuel duties      36.317258
#> 628  2006-04-01  other   Other fuel duties      56.839474
#> 629  2006-05-01  other   Other fuel duties      36.371221
#> 630  2006-06-01  other   Other fuel duties      36.768225
#> 631  2006-07-01  other   Other fuel duties      23.386714
#> 632  2006-08-01  other   Other fuel duties      35.223723
#> 633  2006-09-01  other   Other fuel duties      41.481736
#> 634  2006-10-01  other   Other fuel duties      41.166313
#> 635  2006-11-01  other   Other fuel duties      37.122745
#> 636  2006-12-01  other   Other fuel duties      38.956279
#> 637  2007-01-01  other   Other fuel duties      32.790170
#> 638  2007-02-01  other   Other fuel duties      55.598129
#> 639  2007-03-01  other   Other fuel duties      39.452269
#> 640  2007-04-01  other   Other fuel duties      45.337817
#> 641  2007-05-01  other   Other fuel duties      34.618026
#> 642  2007-06-01  other   Other fuel duties      42.526249
#> 643  2007-07-01  other   Other fuel duties      32.933413
#> 644  2007-08-01  other   Other fuel duties      30.416704
#> 645  2007-09-01  other   Other fuel duties      49.519935
#> 646  2007-10-01  other   Other fuel duties      56.740140
#> 647  2007-11-01  other   Other fuel duties      56.436317
#> 648  2007-12-01  other   Other fuel duties      60.799432
#> 649  2008-01-01  other   Other fuel duties      52.360280
#> 650  2008-02-01  other   Other fuel duties      61.658069
#> 651  2008-03-01  other   Other fuel duties      55.444626
#> 652  2008-04-01  other   Other fuel duties      61.159593
#> 653  2008-05-01  other   Other fuel duties      53.718589
#> 654  2008-06-01  other   Other fuel duties      55.241686
#> 655  2008-07-01  other   Other fuel duties      55.066799
#> 656  2008-08-01  other   Other fuel duties      52.690247
#> 657  2008-09-01  other   Other fuel duties      50.330101
#> 658  2008-10-01  other   Other fuel duties      62.380934
#> 659  2008-11-01  other   Other fuel duties      59.122802
#> 660  2008-12-01  other   Other fuel duties      41.468251
#> 661  2009-01-01  other   Other fuel duties      57.090033
#> 662  2009-02-01  other   Other fuel duties      65.886151
#> 663  2009-03-01  other   Other fuel duties      42.557402
#> 664  2009-04-01  other   Other fuel duties      48.477840
#> 665  2009-05-01  other   Other fuel duties      52.005711
#> 666  2009-06-01  other   Other fuel duties      50.044936
#> 667  2009-07-01  other   Other fuel duties      31.516945
#> 668  2009-08-01  other   Other fuel duties      46.630537
#> 669  2009-09-01  other   Other fuel duties      56.217170
#> 670  2009-10-01  other   Other fuel duties      61.525315
#> 671  2009-11-01  other   Other fuel duties      57.447030
#> 672  2009-12-01  other   Other fuel duties      50.651548
#> 673  2010-01-01  other   Other fuel duties      58.772864
#> 674  2010-02-01  other   Other fuel duties      66.771382
#> 675  2010-03-01  other   Other fuel duties      56.701096
#> 676  2010-04-01  other   Other fuel duties      63.513232
#> 677  2010-05-01  other   Other fuel duties      55.517079
#> 678  2010-06-01  other   Other fuel duties      26.247599
#> 679  2010-07-01  other   Other fuel duties      59.607421
#> 680  2010-08-01  other   Other fuel duties      45.560826
#> 681  2010-09-01  other   Other fuel duties      48.312371
#> 682  2010-10-01  other   Other fuel duties      62.222539
#> 683  2010-11-01  other   Other fuel duties      49.785296
#> 684  2010-12-01  other   Other fuel duties      55.642546
#> 685  2011-01-01  other   Other fuel duties      70.621250
#> 686  2011-02-01  other   Other fuel duties      18.186259
#> 687  2011-03-01  other   Other fuel duties      52.493188
#> 688  2011-04-01  other   Other fuel duties      65.240082
#> 689  2011-05-01  other   Other fuel duties      43.496227
#> 690  2011-06-01  other   Other fuel duties      50.710958
#> 691  2011-07-01  other   Other fuel duties      39.511453
#> 692  2011-08-01  other   Other fuel duties      31.234527
#> 693  2011-09-01  other   Other fuel duties      55.771194
#> 694  2011-10-01  other   Other fuel duties      65.246441
#> 695  2011-11-01  other   Other fuel duties      53.245880
#> 696  2011-12-01  other   Other fuel duties      53.044308
#> 697  2012-01-01  other   Other fuel duties      46.742199
#> 698  2012-02-01  other   Other fuel duties      52.022490
#> 699  2012-03-01  other   Other fuel duties      29.671954
#> 700  2012-04-01  other   Other fuel duties      61.345326
#> 701  2012-05-01  other   Other fuel duties      37.101191
#> 702  2012-06-01  other   Other fuel duties      48.892742
#> 703  2012-07-01  other   Other fuel duties      38.862327
#> 704  2012-08-01  other   Other fuel duties      54.217587
#> 705  2012-09-01  other   Other fuel duties      60.776076
#> 706  2012-10-01  other   Other fuel duties      55.650922
#> 707  2012-11-01  other   Other fuel duties      54.109205
#> 708  2012-12-01  other   Other fuel duties      51.429762
#> 709  2013-01-01  other   Other fuel duties      44.723898
#> 710  2013-02-01  other   Other fuel duties      52.935925
#> 711  2013-03-01  other   Other fuel duties      51.855028
#> 712  2013-04-01  other   Other fuel duties      55.041195
#> 713  2013-05-01  other   Other fuel duties      53.819905
#> 714  2013-06-01  other   Other fuel duties      37.670588
#> 715  2013-07-01  other   Other fuel duties      48.972847
#> 716  2013-08-01  other   Other fuel duties      52.961921
#> 717  2013-09-01  other   Other fuel duties      60.121158
#> 718  2013-10-01  other   Other fuel duties      60.949928
#> 719  2013-11-01  other   Other fuel duties      50.815410
#> 720  2013-12-01  other   Other fuel duties      47.861731
#> 721  2014-01-01  other   Other fuel duties      46.797512
#> 722  2014-02-01  other   Other fuel duties      51.052570
#> 723  2014-03-01  other   Other fuel duties      48.066369
#> 724  2014-04-01  other   Other fuel duties      57.908445
#> 725  2014-05-01  other   Other fuel duties      47.275736
#> 726  2014-06-01  other   Other fuel duties      47.169945
#> 727  2014-07-01  other   Other fuel duties      59.885938
#> 728  2014-08-01  other   Other fuel duties      60.140111
#> 729  2014-09-01  other   Other fuel duties      58.663107
#> 730  2014-10-01  other   Other fuel duties      47.407157
#> 731  2014-11-01  other   Other fuel duties      57.644593
#> 732  2014-12-01  other   Other fuel duties      49.378197
#> 733  2015-01-01  other   Other fuel duties      45.576571
#> 734  2015-02-01  other   Other fuel duties      55.964828
#> 735  2015-03-01  other   Other fuel duties      49.722276
#> 736  2015-04-01  other   Other fuel duties      54.081103
#> 737  2015-05-01  other   Other fuel duties      56.857040
#> 738  2015-06-01  other   Other fuel duties      39.534204
#> 739  2015-07-01  other   Other fuel duties      57.791034
#> 740  2015-08-01  other   Other fuel duties      57.420713
#> 741  2015-09-01  other   Other fuel duties      55.964832
#> 742  2015-10-01  other   Other fuel duties      59.243161
#> 743  2015-11-01  other   Other fuel duties      57.355160
#> 744  2015-12-01  other   Other fuel duties      45.625582
#> 745  2016-01-01  other   Other fuel duties      45.184290
#> 746  2016-02-01  other   Other fuel duties      45.206852
#> 747  2016-03-01  other   Other fuel duties      51.285657
#> 748  2016-04-01  other   Other fuel duties      59.395469
#> 749  2016-05-01  other   Other fuel duties      49.395866
#> 750  2016-06-01  other   Other fuel duties      50.325524
#> 751  2016-07-01  other   Other fuel duties      53.564777
#> 752  2016-08-01  other   Other fuel duties      54.957971
#> 753  2016-09-01  other   Other fuel duties      58.595191
#> 754  2016-10-01  other   Other fuel duties      54.936485
#> 755  2016-11-01  other   Other fuel duties      48.945509
#> 756  2016-12-01  other   Other fuel duties      48.629697
#> 757  2017-01-01  other   Other fuel duties      36.561814
#> 758  2017-02-01  other   Other fuel duties      55.800536
#> 759  2017-03-01  other   Other fuel duties      46.712421
#> 760  2017-04-01  other   Other fuel duties      60.126312
#> 761  2017-05-01  other   Other fuel duties      47.433407
#> 762  2017-06-01  other   Other fuel duties      50.964802
#> 763  2017-07-01  other   Other fuel duties      52.378463
#> 764  2017-08-01  other   Other fuel duties      57.009830
#> 765  2017-09-01  other   Other fuel duties      57.058052
#> 766  2017-10-01  other   Other fuel duties      53.360705
#> 767  2017-11-01  other   Other fuel duties      53.855812
#> 768  2017-12-01  other   Other fuel duties      52.532180
#> 769  2018-01-01  other   Other fuel duties      35.576517
#> 770  2018-02-01  other   Other fuel duties      48.876665
#> 771  2018-03-01  other   Other fuel duties      51.182842
#> 772  2018-04-01  other   Other fuel duties      54.258895
#> 773  2018-05-01  other   Other fuel duties      50.699027
#> 774  2018-06-01  other   Other fuel duties      57.716626
#> 775  2018-07-01  other   Other fuel duties      39.616716
#> 776  2018-08-01  other   Other fuel duties      61.689615
#> 777  2018-09-01  other   Other fuel duties      62.202200
#> 778  2018-10-01  other   Other fuel duties      53.307960
#> 779  2018-11-01  other   Other fuel duties      51.444898
#> 780  2018-12-01  other   Other fuel duties      52.394983
#> 781  2019-01-01  other   Other fuel duties      37.299706
#> 782  2019-02-01  other   Other fuel duties      49.121220
#> 783  2019-03-01  other   Other fuel duties      52.509236
#> 784  2019-04-01  other   Other fuel duties      52.168433
#> 785  2019-05-01  other   Other fuel duties      42.064963
#> 786  2019-06-01  other   Other fuel duties      54.490157
#> 787  2019-07-01  other   Other fuel duties      48.904363
#> 788  2019-08-01  other   Other fuel duties      58.063764
#> 789  2019-09-01  other   Other fuel duties      59.302912
#> 790  2019-10-01  other   Other fuel duties      46.043854
#> 791  2019-11-01  other   Other fuel duties      47.331363
#> 792  2019-12-01  other   Other fuel duties      54.939631
#> 793  2020-01-01  other   Other fuel duties      27.910205
#> 794  2020-02-01  other   Other fuel duties      49.003635
#> 795  2020-03-01  other   Other fuel duties      42.162347
#> 796  2020-04-01  other   Other fuel duties      50.077077
#> 797  2020-05-01  other   Other fuel duties      43.140878
#> 798  2020-06-01  other   Other fuel duties      37.484963
#> 799  2020-07-01  other   Other fuel duties      41.694272
#> 800  2020-08-01  other   Other fuel duties      52.344430
#> 801  2020-09-01  other   Other fuel duties      50.707918
#> 802  2020-10-01  other   Other fuel duties      51.718582
#> 803  2020-11-01  other   Other fuel duties      47.338758
#> 804  2020-12-01  other   Other fuel duties      49.253438
#> 805  2021-01-01  other   Other fuel duties      39.691410
#> 806  2021-02-01  other   Other fuel duties      43.390518
#> 807  2021-03-01  other   Other fuel duties      37.152252
#> 808  2021-04-01  other   Other fuel duties      53.753532
#> 809  2021-05-01  other   Other fuel duties      54.118497
#> 810  2021-06-01  other   Other fuel duties      51.002777
#> 811  2021-07-01  other   Other fuel duties      50.528861
#> 812  2021-08-01  other   Other fuel duties      56.964956
#> 813  2021-09-01  other   Other fuel duties      60.998361
#> 814  2021-10-01  other   Other fuel duties      53.217606
#> 815  2021-11-01  other   Other fuel duties      48.380598
#> 816  2021-12-01  other   Other fuel duties      50.464827
#> 817  2022-01-01  other   Other fuel duties      35.707153
#> 818  2022-02-01  other   Other fuel duties      45.179535
#> 819  2022-03-01  other   Other fuel duties      42.430249
#> 820  2022-04-01  other   Other fuel duties      35.747074
#> 821  2022-05-01  other   Other fuel duties      20.857248
#> 822  2022-06-01  other   Other fuel duties      26.116368
#> 823  2022-07-01  other   Other fuel duties      21.361373
#> 824  2022-08-01  other   Other fuel duties      11.507563
#> 825  2022-09-01  other   Other fuel duties      28.047709
#> 826  2022-10-01  other   Other fuel duties      22.343763
#> 827  2022-11-01  other   Other fuel duties      15.126328
#> 828  2022-12-01  other   Other fuel duties      19.527920
#> 829  2023-01-01  other   Other fuel duties      16.872168
#> 830  2023-02-01  other   Other fuel duties      18.596373
#> 831  2023-03-01  other   Other fuel duties      18.465334
#> 832  2023-04-01  other   Other fuel duties      28.969567
#> 833  2023-05-01  other   Other fuel duties      19.502077
#> 834  2023-06-01  other   Other fuel duties      23.206693
#> 835  2023-07-01  other   Other fuel duties      14.597138
#> 836  2023-08-01  other   Other fuel duties      22.639097
#> 837  2023-09-01  other   Other fuel duties      31.244410
#> 838  2023-10-01  other   Other fuel duties      21.621928
#> 839  2023-11-01  other   Other fuel duties      15.456117
#> 840  2023-12-01  other   Other fuel duties      18.920409
#> 841  2024-01-01  other   Other fuel duties      11.187316
#> 842  2024-02-01  other   Other fuel duties      16.080220
#> 843  2024-03-01  other   Other fuel duties      20.302261
#> 844  2024-04-01  other   Other fuel duties      15.079995
#> 845  2024-05-01  other   Other fuel duties      20.409922
#> 846  2024-06-01  other   Other fuel duties      27.479422
#> 847  2024-07-01  other   Other fuel duties      18.484233
#> 848  2024-08-01  other   Other fuel duties      27.491056
#> 849  2024-09-01  other   Other fuel duties      30.765466
#> 850  2024-10-01  other   Other fuel duties      22.473296
#> 851  2024-11-01  other   Other fuel duties      23.844200
#> 852  2024-12-01  other   Other fuel duties      17.443905
#> 853  2025-01-01  other   Other fuel duties      11.376566
#> 854  2025-02-01  other   Other fuel duties      16.689300
#> 855  2025-03-01  other   Other fuel duties      24.553417
#> 856  2025-04-01  other   Other fuel duties      22.513993
#> 857  2025-05-01  other   Other fuel duties      21.777872
#> 858  2025-06-01  other   Other fuel duties      23.479686
#> 859  2025-07-01  other   Other fuel duties      19.663104
#> 860  2025-08-01  other   Other fuel duties      27.323602
#> 861  2025-09-01  other   Other fuel duties      26.860515
#> 862  2025-10-01  other   Other fuel duties      20.383170
#> 863  2025-11-01  other   Other fuel duties      17.949758
#> 864  2025-12-01  other   Other fuel duties      17.893409
#> 865  1990-01-01 petrol       Petrol duties    1039.130000
#> 866  1990-02-01 petrol       Petrol duties    1032.850000
#> 867  1990-03-01 petrol       Petrol duties    1026.468174
#> 868  1990-04-01 petrol       Petrol duties    1234.968000
#> 869  1990-05-01 petrol       Petrol duties    1158.696000
#> 870  1990-06-01 petrol       Petrol duties    1236.112000
#> 871  1990-07-01 petrol       Petrol duties    1177.030000
#> 872  1990-08-01 petrol       Petrol duties    1244.622000
#> 873  1990-09-01 petrol       Petrol duties    1173.282000
#> 874  1990-10-01 petrol       Petrol duties    1122.866000
#> 875  1990-11-01 petrol       Petrol duties    1133.054000
#> 876  1990-12-01 petrol       Petrol duties    1139.232000
#> 877  1991-01-01 petrol       Petrol duties    1092.644000
#> 878  1991-02-01 petrol       Petrol duties    1123.200000
#> 879  1991-03-01 petrol       Petrol duties    1133.037360
#> 880  1991-04-01 petrol       Petrol duties    1267.434000
#> 881  1991-05-01 petrol       Petrol duties    1343.224000
#> 882  1991-06-01 petrol       Petrol duties    1343.648000
#> 883  1991-07-01 petrol       Petrol duties    1300.872000
#> 884  1991-08-01 petrol       Petrol duties    1444.124000
#> 885  1991-09-01 petrol       Petrol duties    1353.228000
#> 886  1991-10-01 petrol       Petrol duties    1279.384000
#> 887  1991-11-01 petrol       Petrol duties    1352.928000
#> 888  1991-12-01 petrol       Petrol duties    1315.908888
#> 889  1992-01-01 petrol       Petrol duties    1245.605582
#> 890  1992-02-01 petrol       Petrol duties    1237.032222
#> 891  1992-03-01 petrol       Petrol duties    1493.044716
#> 892  1992-04-01 petrol       Petrol duties    1236.802729
#> 893  1992-05-01 petrol       Petrol duties    1321.649248
#> 894  1992-06-01 petrol       Petrol duties    1388.644992
#> 895  1992-07-01 petrol       Petrol duties    1412.379968
#> 896  1992-08-01 petrol       Petrol duties    1379.181498
#> 897  1992-09-01 petrol       Petrol duties    1417.492608
#> 898  1992-10-01 petrol       Petrol duties    1392.268272
#> 899  1992-11-01 petrol       Petrol duties    1355.956972
#> 900  1992-12-01 petrol       Petrol duties    1392.519276
#> 901  1993-01-01 petrol       Petrol duties    1289.405799
#> 902  1993-02-01 petrol       Petrol duties    1347.435581
#> 903  1993-03-01 petrol       Petrol duties    1459.208850
#> 904  1993-04-01 petrol       Petrol duties    1349.121116
#> 905  1993-05-01 petrol       Petrol duties    1357.592215
#> 906  1993-06-01 petrol       Petrol duties    1497.179083
#> 907  1993-07-01 petrol       Petrol duties    1444.394247
#> 908  1993-08-01 petrol       Petrol duties    1548.749022
#> 909  1993-09-01 petrol       Petrol duties    1493.990773
#> 910  1993-10-01 petrol       Petrol duties    1497.862905
#> 911  1993-11-01 petrol       Petrol duties    1620.790579
#> 912  1993-12-01 petrol       Petrol duties    1582.525150
#> 913  1994-01-01 petrol       Petrol duties    1374.606586
#> 914  1994-02-01 petrol       Petrol duties    1458.561114
#> 915  1994-03-01 petrol       Petrol duties    1441.479244
#> 916  1994-04-01 petrol       Petrol duties    1636.982099
#> 917  1994-05-01 petrol       Petrol duties    1575.332710
#> 918  1994-06-01 petrol       Petrol duties    1610.144155
#> 919  1994-07-01 petrol       Petrol duties    1600.459148
#> 920  1994-08-01 petrol       Petrol duties    1557.361269
#> 921  1994-09-01 petrol       Petrol duties    1543.922203
#> 922  1994-10-01 petrol       Petrol duties    1576.121686
#> 923  1994-11-01 petrol       Petrol duties    1721.360084
#> 924  1994-12-01 petrol       Petrol duties    1804.844034
#> 925  1995-01-01 petrol       Petrol duties    1518.049117
#> 926  1995-02-01 petrol       Petrol duties    1376.385839
#> 927  1995-03-01 petrol       Petrol duties    1499.489046
#> 928  1995-04-01 petrol       Petrol duties    1736.172784
#> 929  1995-05-01 petrol       Petrol duties    1663.705637
#> 930  1995-06-01 petrol       Petrol duties    1707.762435
#> 931  1995-07-01 petrol       Petrol duties    1420.742336
#> 932  1995-08-01 petrol       Petrol duties    1717.109810
#> 933  1995-09-01 petrol       Petrol duties    1919.603758
#> 934  1995-10-01 petrol       Petrol duties    1629.385956
#> 935  1995-11-01 petrol       Petrol duties    1900.066802
#> 936  1995-12-01 petrol       Petrol duties    1888.173798
#> 937  1996-01-01 petrol       Petrol duties    1442.728766
#> 938  1996-02-01 petrol       Petrol duties    1644.215426
#> 939  1996-03-01 petrol       Petrol duties    1624.422587
#> 940  1996-04-01 petrol       Petrol duties    1802.002892
#> 941  1996-05-01 petrol       Petrol duties    1853.856627
#> 942  1996-06-01 petrol       Petrol duties    1795.540064
#> 943  1996-07-01 petrol       Petrol duties    1765.594217
#> 944  1996-08-01 petrol       Petrol duties    1852.192622
#> 945  1996-09-01 petrol       Petrol duties    1849.021750
#> 946  1996-10-01 petrol       Petrol duties    1800.985724
#> 947  1996-11-01 petrol       Petrol duties    2089.836882
#> 948  1996-12-01 petrol       Petrol duties    1997.984544
#> 949  1997-01-01 petrol       Petrol duties    1535.582378
#> 950  1997-02-01 petrol       Petrol duties    1728.960616
#> 951  1997-03-01 petrol       Petrol duties    1672.920025
#> 952  1997-04-01 petrol       Petrol duties    1869.613754
#> 953  1997-05-01 petrol       Petrol duties    1975.116474
#> 954  1997-06-01 petrol       Petrol duties    2114.658917
#> 955  1997-07-01 petrol       Petrol duties    2050.448634
#> 956  1997-08-01 petrol       Petrol duties    1844.340216
#> 957  1997-09-01 petrol       Petrol duties    1990.311214
#> 958  1997-10-01 petrol       Petrol duties    1956.020786
#> 959  1997-11-01 petrol       Petrol duties    2178.946151
#> 960  1997-12-01 petrol       Petrol duties    2016.013266
#> 961  1998-01-01 petrol       Petrol duties    1936.832737
#> 962  1998-02-01 petrol       Petrol duties    2074.006752
#> 963  1998-03-01 petrol       Petrol duties    2281.148965
#> 964  1998-04-01 petrol       Petrol duties    1947.850691
#> 965  1998-05-01 petrol       Petrol duties    2032.334411
#> 966  1998-06-01 petrol       Petrol duties    2199.257345
#> 967  1998-07-01 petrol       Petrol duties    2173.467312
#> 968  1998-08-01 petrol       Petrol duties    2269.811074
#> 969  1998-09-01 petrol       Petrol duties    2173.585327
#> 970  1998-10-01 petrol       Petrol duties    2171.792105
#> 971  1998-11-01 petrol       Petrol duties    2223.374086
#> 972  1998-12-01 petrol       Petrol duties    2277.664022
#> 973  1999-01-01 petrol       Petrol duties    2112.174970
#> 974  1999-02-01 petrol       Petrol duties    2159.119799
#> 975  1999-03-01 petrol       Petrol duties    2521.999449
#> 976  1999-04-01 petrol       Petrol duties    2061.994578
#> 977  1999-05-01 petrol       Petrol duties    2165.847678
#> 978  1999-06-01 petrol       Petrol duties    2257.663965
#> 979  1999-07-01 petrol       Petrol duties    2283.849840
#> 980  1999-08-01 petrol       Petrol duties    2337.649721
#> 981  1999-09-01 petrol       Petrol duties    2296.243352
#> 982  1999-10-01 petrol       Petrol duties    2288.705895
#> 983  1999-11-01 petrol       Petrol duties    2352.726954
#> 984  1999-12-01 petrol       Petrol duties    2324.363058
#> 985  2000-01-01 petrol       Petrol duties    2193.075453
#> 986  2000-02-01 petrol       Petrol duties    2295.169782
#> 987  2000-03-01 petrol       Petrol duties    2476.371976
#> 988  2000-04-01 petrol       Petrol duties    2262.873093
#> 989  2000-05-01 petrol       Petrol duties    2094.504756
#> 990  2000-06-01 petrol       Petrol duties    2321.092734
#> 991  2000-07-01 petrol       Petrol duties    2297.557409
#> 992  2000-08-01 petrol       Petrol duties    2331.331067
#> 993  2000-09-01 petrol       Petrol duties    2179.100231
#> 994  2000-10-01 petrol       Petrol duties    2390.427406
#> 995  2000-11-01 petrol       Petrol duties    2396.149279
#> 996  2000-12-01 petrol       Petrol duties    2196.339964
#> 997  2001-01-01 petrol       Petrol duties    2165.035015
#> 998  2001-02-01 petrol       Petrol duties    2202.169216
#> 999  2001-03-01 petrol       Petrol duties    1958.038306
#> 1000 2001-04-01 petrol       Petrol duties    2294.057357
#> 1001 2001-05-01 petrol       Petrol duties    2070.880425
#> 1002 2001-06-01 petrol       Petrol duties    2260.272271
#> 1003 2001-07-01 petrol       Petrol duties    2111.289330
#> 1004 2001-08-01 petrol       Petrol duties    2173.264455
#> 1005 2001-09-01 petrol       Petrol duties    2237.056587
#> 1006 2001-10-01 petrol       Petrol duties    2162.228698
#> 1007 2001-11-01 petrol       Petrol duties    2247.547380
#> 1008 2001-12-01 petrol       Petrol duties    2167.767247
#> 1009 2002-01-01 petrol       Petrol duties    2050.904171
#> 1010 2002-02-01 petrol       Petrol duties    2155.031438
#> 1011 2002-03-01 petrol       Petrol duties    1989.258978
#> 1012 2002-04-01 petrol       Petrol duties    2206.862244
#> 1013 2002-05-01 petrol       Petrol duties    2135.391638
#> 1014 2002-06-01 petrol       Petrol duties    2179.238337
#> 1015 2002-07-01 petrol       Petrol duties    2078.888457
#> 1016 2002-08-01 petrol       Petrol duties    2157.944170
#> 1017 2002-09-01 petrol       Petrol duties    2175.776521
#> 1018 2002-10-01 petrol       Petrol duties    2080.930834
#> 1019 2002-11-01 petrol       Petrol duties    2246.511059
#> 1020 2002-12-01 petrol       Petrol duties    2214.197488
#> 1021 2003-01-01 petrol       Petrol duties    2043.998163
#> 1022 2003-02-01 petrol       Petrol duties    2108.229338
#> 1023 2003-03-01 petrol       Petrol duties    1884.574068
#> 1024 2003-04-01 petrol       Petrol duties    2203.777607
#> 1025 2003-05-01 petrol       Petrol duties    2065.270787
#> 1026 2003-06-01 petrol       Petrol duties    2189.585531
#> 1027 2003-07-01 petrol       Petrol duties    2047.068034
#> 1028 2003-08-01 petrol       Petrol duties    2152.321220
#> 1029 2003-09-01 petrol       Petrol duties    2076.536266
#> 1030 2003-10-01 petrol       Petrol duties    2244.340113
#> 1031 2003-11-01 petrol       Petrol duties    2129.221396
#> 1032 2003-12-01 petrol       Petrol duties    2099.230779
#> 1033 2004-01-01 petrol       Petrol duties    2097.174477
#> 1034 2004-02-01 petrol       Petrol duties    2086.656435
#> 1035 2004-03-01 petrol       Petrol duties    2035.264169
#> 1036 2004-04-01 petrol       Petrol duties    2143.414319
#> 1037 2004-05-01 petrol       Petrol duties    2135.875314
#> 1038 2004-06-01 petrol       Petrol duties    2188.303020
#> 1039 2004-07-01 petrol       Petrol duties    2195.363335
#> 1040 2004-08-01 petrol       Petrol duties    2181.142508
#> 1041 2004-09-01 petrol       Petrol duties    2030.942174
#> 1042 2004-10-01 petrol       Petrol duties    2141.848984
#> 1043 2004-11-01 petrol       Petrol duties    2100.727705
#> 1044 2004-12-01 petrol       Petrol duties    2120.521030
#> 1045 2005-01-01 petrol       Petrol duties    1928.815623
#> 1046 2005-02-01 petrol       Petrol duties    2052.208026
#> 1047 2005-03-01 petrol       Petrol duties    1788.389668
#> 1048 2005-04-01 petrol       Petrol duties    2101.377938
#> 1049 2005-05-01 petrol       Petrol duties    2066.165871
#> 1050 2005-06-01 petrol       Petrol duties    2090.862516
#> 1051 2005-07-01 petrol       Petrol duties    2038.636568
#> 1052 2005-08-01 petrol       Petrol duties    2016.808107
#> 1053 2005-09-01 petrol       Petrol duties    2127.296079
#> 1054 2005-10-01 petrol       Petrol duties    1976.836129
#> 1055 2005-11-01 petrol       Petrol duties    1964.859296
#> 1056 2005-12-01 petrol       Petrol duties    2016.556652
#> 1057 2006-01-01 petrol       Petrol duties    1958.054275
#> 1058 2006-02-01 petrol       Petrol duties    1946.328913
#> 1059 2006-03-01 petrol       Petrol duties    1719.877509
#> 1060 2006-04-01 petrol       Petrol duties    2041.621307
#> 1061 2006-05-01 petrol       Petrol duties    1913.942921
#> 1062 2006-06-01 petrol       Petrol duties    2013.914047
#> 1063 2006-07-01 petrol       Petrol duties    1892.654768
#> 1064 2006-08-01 petrol       Petrol duties    2002.667706
#> 1065 2006-09-01 petrol       Petrol duties    2009.039664
#> 1066 2006-10-01 petrol       Petrol duties    1882.736343
#> 1067 2006-11-01 petrol       Petrol duties    1962.787453
#> 1068 2006-12-01 petrol       Petrol duties    1919.940197
#> 1069 2007-01-01 petrol       Petrol duties    1919.698777
#> 1070 2007-02-01 petrol       Petrol duties    1902.191360
#> 1071 2007-03-01 petrol       Petrol duties    1759.139210
#> 1072 2007-04-01 petrol       Petrol duties    2038.849215
#> 1073 2007-05-01 petrol       Petrol duties    1964.364735
#> 1074 2007-06-01 petrol       Petrol duties    1975.654191
#> 1075 2007-07-01 petrol       Petrol duties    1912.042091
#> 1076 2007-08-01 petrol       Petrol duties    1983.528340
#> 1077 2007-09-01 petrol       Petrol duties    1965.931561
#> 1078 2007-10-01 petrol       Petrol duties    1959.968035
#> 1079 2007-11-01 petrol       Petrol duties    1998.243769
#> 1080 2007-12-01 petrol       Petrol duties    1992.229554
#> 1081 2008-01-01 petrol       Petrol duties    1925.751718
#> 1082 2008-02-01 petrol       Petrol duties    1925.977568
#> 1083 2008-03-01 petrol       Petrol duties    1830.359990
#> 1084 2008-04-01 petrol       Petrol duties    1981.013645
#> 1085 2008-05-01 petrol       Petrol duties    1896.090957
#> 1086 2008-06-01 petrol       Petrol duties    1955.197702
#> 1087 2008-07-01 petrol       Petrol duties    1867.573306
#> 1088 2008-08-01 petrol       Petrol duties    1880.581866
#> 1089 2008-09-01 petrol       Petrol duties    1866.657718
#> 1090 2008-10-01 petrol       Petrol duties    1850.223287
#> 1091 2008-11-01 petrol       Petrol duties    1951.147410
#> 1092 2008-12-01 petrol       Petrol duties    1889.039374
#> 1093 2009-01-01 petrol       Petrol duties    1921.527982
#> 1094 2009-02-01 petrol       Petrol duties    1879.046114
#> 1095 2009-03-01 petrol       Petrol duties    1691.669627
#> 1096 2009-04-01 petrol       Petrol duties    2029.049056
#> 1097 2009-05-01 petrol       Petrol duties    2031.272452
#> 1098 2009-06-01 petrol       Petrol duties    2044.438676
#> 1099 2009-07-01 petrol       Petrol duties    1999.431247
#> 1100 2009-08-01 petrol       Petrol duties    2052.679075
#> 1101 2009-09-01 petrol       Petrol duties    2026.645080
#> 1102 2009-10-01 petrol       Petrol duties    2020.147541
#> 1103 2009-11-01 petrol       Petrol duties    2016.978616
#> 1104 2009-12-01 petrol       Petrol duties    2046.530988
#> 1105 2010-01-01 petrol       Petrol duties    1749.370592
#> 1106 2010-02-01 petrol       Petrol duties    1880.244776
#> 1107 2010-03-01 petrol       Petrol duties    1801.605751
#> 1108 2010-04-01 petrol       Petrol duties    2063.246470
#> 1109 2010-05-01 petrol       Petrol duties    2025.790480
#> 1110 2010-06-01 petrol       Petrol duties    2009.487290
#> 1111 2010-07-01 petrol       Petrol duties    1984.604930
#> 1112 2010-08-01 petrol       Petrol duties    2007.543557
#> 1113 2010-09-01 petrol       Petrol duties    2005.466102
#> 1114 2010-10-01 petrol       Petrol duties    2020.939604
#> 1115 2010-11-01 petrol       Petrol duties    2059.396953
#> 1116 2010-12-01 petrol       Petrol duties    1895.060614
#> 1117 2011-01-01 petrol       Petrol duties    1866.183837
#> 1118 2011-02-01 petrol       Petrol duties    1874.419495
#> 1119 2011-03-01 petrol       Petrol duties    1812.880063
#> 1120 2011-04-01 petrol       Petrol duties    2010.535164
#> 1121 2011-05-01 petrol       Petrol duties    1898.954764
#> 1122 2011-06-01 petrol       Petrol duties    1908.232038
#> 1123 2011-07-01 petrol       Petrol duties    1890.027309
#> 1124 2011-08-01 petrol       Petrol duties    1866.303131
#> 1125 2011-09-01 petrol       Petrol duties    1951.231585
#> 1126 2011-10-01 petrol       Petrol duties    1909.918537
#> 1127 2011-11-01 petrol       Petrol duties    1902.345465
#> 1128 2011-12-01 petrol       Petrol duties    1855.606319
#> 1129 2012-01-01 petrol       Petrol duties    1793.889165
#> 1130 2012-02-01 petrol       Petrol duties    1815.100520
#> 1131 2012-03-01 petrol       Petrol duties    1713.927096
#> 1132 2012-04-01 petrol       Petrol duties    1946.903258
#> 1133 2012-05-01 petrol       Petrol duties    1807.441821
#> 1134 2012-06-01 petrol       Petrol duties    1834.274643
#> 1135 2012-07-01 petrol       Petrol duties    1805.057512
#> 1136 2012-08-01 petrol       Petrol duties    1816.008802
#> 1137 2012-09-01 petrol       Petrol duties    1822.598292
#> 1138 2012-10-01 petrol       Petrol duties    1780.246861
#> 1139 2012-11-01 petrol       Petrol duties    1832.473841
#> 1140 2012-12-01 petrol       Petrol duties    1812.151614
#> 1141 2013-01-01 petrol       Petrol duties    1697.495090
#> 1142 2013-02-01 petrol       Petrol duties    1658.256566
#> 1143 2013-03-01 petrol       Petrol duties    1593.949083
#> 1144 2013-04-01 petrol       Petrol duties    1751.124692
#> 1145 2013-05-01 petrol       Petrol duties    1808.115225
#> 1146 2013-06-01 petrol       Petrol duties    1858.387002
#> 1147 2013-07-01 petrol       Petrol duties    1711.013547
#> 1148 2013-08-01 petrol       Petrol duties    1834.529558
#> 1149 2013-09-01 petrol       Petrol duties    1752.136332
#> 1150 2013-10-01 petrol       Petrol duties    1722.308959
#> 1151 2013-11-01 petrol       Petrol duties    1765.452950
#> 1152 2013-12-01 petrol       Petrol duties    1732.507508
#> 1153 2014-01-01 petrol       Petrol duties    1708.965150
#> 1154 2014-02-01 petrol       Petrol duties    1642.930645
#> 1155 2014-03-01 petrol       Petrol duties    1583.855384
#> 1156 2014-04-01 petrol       Petrol duties    1732.294577
#> 1157 2014-05-01 petrol       Petrol duties    1740.922004
#> 1158 2014-06-01 petrol       Petrol duties    1779.919141
#> 1159 2014-07-01 petrol       Petrol duties    1667.284399
#> 1160 2014-08-01 petrol       Petrol duties    1811.488317
#> 1161 2014-09-01 petrol       Petrol duties    1686.548697
#> 1162 2014-10-01 petrol       Petrol duties    1714.582675
#> 1163 2014-11-01 petrol       Petrol duties    1735.675221
#> 1164 2014-12-01 petrol       Petrol duties    1677.527174
#> 1165 2015-01-01 petrol       Petrol duties    1608.227804
#> 1166 2015-02-01 petrol       Petrol duties    1678.611552
#> 1167 2015-03-01 petrol       Petrol duties    1518.676609
#> 1168 2015-04-01 petrol       Petrol duties    1687.108265
#> 1169 2015-05-01 petrol       Petrol duties    1712.993364
#> 1170 2015-06-01 petrol       Petrol duties    1709.567958
#> 1171 2015-07-01 petrol       Petrol duties    1706.266487
#> 1172 2015-08-01 petrol       Petrol duties    1710.441989
#> 1173 2015-09-01 petrol       Petrol duties    1691.686833
#> 1174 2015-10-01 petrol       Petrol duties    1693.775072
#> 1175 2015-11-01 petrol       Petrol duties    1665.387596
#> 1176 2015-12-01 petrol       Petrol duties    1689.475927
#> 1177 2016-01-01 petrol       Petrol duties    1581.802147
#> 1178 2016-02-01 petrol       Petrol duties    1588.856442
#> 1179 2016-03-01 petrol       Petrol duties    1602.805604
#> 1180 2016-04-01 petrol       Petrol duties    1642.791787
#> 1181 2016-05-01 petrol       Petrol duties    1701.446847
#> 1182 2016-06-01 petrol       Petrol duties    1749.659384
#> 1183 2016-07-01 petrol       Petrol duties    1641.921098
#> 1184 2016-08-01 petrol       Petrol duties    1659.748725
#> 1185 2016-09-01 petrol       Petrol duties    1692.814810
#> 1186 2016-10-01 petrol       Petrol duties    1646.453519
#> 1187 2016-11-01 petrol       Petrol duties    1654.301476
#> 1188 2016-12-01 petrol       Petrol duties    1656.069056
#> 1189 2017-01-01 petrol       Petrol duties    1561.978068
#> 1190 2017-02-01 petrol       Petrol duties    1624.427498
#> 1191 2017-03-01 petrol       Petrol duties    1487.703277
#> 1192 2017-04-01 petrol       Petrol duties    1674.059733
#> 1193 2017-05-01 petrol       Petrol duties    1656.652700
#> 1194 2017-06-01 petrol       Petrol duties    1667.312725
#> 1195 2017-07-01 petrol       Petrol duties    1621.725161
#> 1196 2017-08-01 petrol       Petrol duties    1673.426270
#> 1197 2017-09-01 petrol       Petrol duties    1620.808711
#> 1198 2017-10-01 petrol       Petrol duties    1580.876610
#> 1199 2017-11-01 petrol       Petrol duties    1680.595535
#> 1200 2017-12-01 petrol       Petrol duties    1589.321633
#> 1201 2018-01-01 petrol       Petrol duties    1535.080143
#> 1202 2018-02-01 petrol       Petrol duties    1572.810746
#> 1203 2018-03-01 petrol       Petrol duties    1375.662757
#> 1204 2018-04-01 petrol       Petrol duties    1620.318110
#> 1205 2018-05-01 petrol       Petrol duties    1630.085677
#> 1206 2018-06-01 petrol       Petrol duties    1740.774644
#> 1207 2018-07-01 petrol       Petrol duties    1610.436129
#> 1208 2018-08-01 petrol       Petrol duties    1617.984140
#> 1209 2018-09-01 petrol       Petrol duties    1655.776629
#> 1210 2018-10-01 petrol       Petrol duties    1522.848435
#> 1211 2018-11-01 petrol       Petrol duties    1753.326218
#> 1212 2018-12-01 petrol       Petrol duties    1604.330414
#> 1213 2019-01-01 petrol       Petrol duties    1619.939812
#> 1214 2019-02-01 petrol       Petrol duties    1568.198818
#> 1215 2019-03-01 petrol       Petrol duties    1491.235550
#> 1216 2019-04-01 petrol       Petrol duties    1597.205560
#> 1217 2019-05-01 petrol       Petrol duties    1643.446937
#> 1218 2019-06-01 petrol       Petrol duties    1700.010000
#> 1219 2019-07-01 petrol       Petrol duties    1588.410031
#> 1220 2019-08-01 petrol       Petrol duties    1670.911951
#> 1221 2019-09-01 petrol       Petrol duties    1649.028196
#> 1222 2019-10-01 petrol       Petrol duties    1628.698303
#> 1223 2019-11-01 petrol       Petrol duties    1651.078450
#> 1224 2019-12-01 petrol       Petrol duties    1722.336351
#> 1225 2020-01-01 petrol       Petrol duties    1552.280564
#> 1226 2020-02-01 petrol       Petrol duties    1573.550217
#> 1227 2020-03-01 petrol       Petrol duties    1385.740984
#> 1228 2020-04-01 petrol       Petrol duties     845.037116
#> 1229 2020-05-01 petrol       Petrol duties     501.702821
#> 1230 2020-06-01 petrol       Petrol duties    1100.237309
#> 1231 2020-07-01 petrol       Petrol duties    1220.667938
#> 1232 2020-08-01 petrol       Petrol duties    1468.005685
#> 1233 2020-09-01 petrol       Petrol duties    1468.584274
#> 1234 2020-10-01 petrol       Petrol duties    1510.617088
#> 1235 2020-11-01 petrol       Petrol duties    1375.317224
#> 1236 2020-12-01 petrol       Petrol duties    1162.442196
#> 1237 2021-01-01 petrol       Petrol duties    1188.701253
#> 1238 2021-02-01 petrol       Petrol duties     866.642072
#> 1239 2021-03-01 petrol       Petrol duties     809.323223
#> 1240 2021-04-01 petrol       Petrol duties    1305.323663
#> 1241 2021-05-01 petrol       Petrol duties    1616.132231
#> 1242 2021-06-01 petrol       Petrol duties    1600.950316
#> 1243 2021-07-01 petrol       Petrol duties    1618.735840
#> 1244 2021-08-01 petrol       Petrol duties    1608.189632
#> 1245 2021-09-01 petrol       Petrol duties    1626.367788
#> 1246 2021-10-01 petrol       Petrol duties    1610.048892
#> 1247 2021-11-01 petrol       Petrol duties    1577.236847
#> 1248 2021-12-01 petrol       Petrol duties    1608.271448
#> 1249 2022-01-01 petrol       Petrol duties    1374.484237
#> 1250 2022-02-01 petrol       Petrol duties    1429.334802
#> 1251 2022-03-01 petrol       Petrol duties    1337.059489
#> 1252 2022-04-01 petrol       Petrol duties    1363.420287
#> 1253 2022-05-01 petrol       Petrol duties    1644.102401
#> 1254 2022-06-01 petrol       Petrol duties    1575.581837
#> 1255 2022-07-01 petrol       Petrol duties    1413.224225
#> 1256 2022-08-01 petrol       Petrol duties    1489.130005
#> 1257 2022-09-01 petrol       Petrol duties    1418.390165
#> 1258 2022-10-01 petrol       Petrol duties    1439.624620
#> 1259 2022-11-01 petrol       Petrol duties    1498.550629
#> 1260 2022-12-01 petrol       Petrol duties    1451.000877
#> 1261 2023-01-01 petrol       Petrol duties    1467.742737
#> 1262 2023-02-01 petrol       Petrol duties    1568.482310
#> 1263 2023-03-01 petrol       Petrol duties    1326.128284
#> 1264 2023-04-01 petrol       Petrol duties    1438.567558
#> 1265 2023-05-01 petrol       Petrol duties    1524.986375
#> 1266 2023-06-01 petrol       Petrol duties    1548.727757
#> 1267 2023-07-01 petrol       Petrol duties    1234.857235
#> 1268 2023-08-01 petrol       Petrol duties    1879.016142
#> 1269 2023-09-01 petrol       Petrol duties    1448.950494
#> 1270 2023-10-01 petrol       Petrol duties    1575.527937
#> 1271 2023-11-01 petrol       Petrol duties    1635.925423
#> 1272 2023-12-01 petrol       Petrol duties    1525.046476
#> 1273 2024-01-01 petrol       Petrol duties    1467.490254
#> 1274 2024-02-01 petrol       Petrol duties    1546.696842
#> 1275 2024-03-01 petrol       Petrol duties    1478.943273
#> 1276 2024-04-01 petrol       Petrol duties    1437.686323
#> 1277 2024-05-01 petrol       Petrol duties    1536.710192
#> 1278 2024-06-01 petrol       Petrol duties    1577.380990
#> 1279 2024-07-01 petrol       Petrol duties    1654.467369
#> 1280 2024-08-01 petrol       Petrol duties    1555.696590
#> 1281 2024-09-01 petrol       Petrol duties    1602.818865
#> 1282 2024-10-01 petrol       Petrol duties    1515.311030
#> 1283 2024-11-01 petrol       Petrol duties    1751.535649
#> 1284 2024-12-01 petrol       Petrol duties    1509.995473
#> 1285 2025-01-01 petrol       Petrol duties    1482.018208
#> 1286 2025-02-01 petrol       Petrol duties    1583.012331
#> 1287 2025-03-01 petrol       Petrol duties    1560.810275
#> 1288 2025-04-01 petrol       Petrol duties    1547.842708
#> 1289 2025-05-01 petrol       Petrol duties    1691.982109
#> 1290 2025-06-01 petrol       Petrol duties    1493.524323
#> 1291 2025-07-01 petrol       Petrol duties    1567.411514
#> 1292 2025-08-01 petrol       Petrol duties    1556.092484
#> 1293 2025-09-01 petrol       Petrol duties    1798.076889
#> 1294 2025-10-01 petrol       Petrol duties    1570.754199
#> 1295 2025-11-01 petrol       Petrol duties    1732.362245
#> 1296 2025-12-01 petrol       Petrol duties    1645.164591
#> 1297 1990-01-01  total Total oils receipts     696.568000
#> 1298 1990-02-01  total Total oils receipts     713.208000
#> 1299 1990-03-01  total Total oils receipts     708.000000
#> 1300 1990-04-01  total Total oils receipts     851.078000
#> 1301 1990-05-01  total Total oils receipts     795.073000
#> 1302 1990-06-01  total Total oils receipts     847.840000
#> 1303 1990-07-01  total Total oils receipts     808.913000
#> 1304 1990-08-01  total Total oils receipts     843.658000
#> 1305 1990-09-01  total Total oils receipts     812.499000
#> 1306 1990-10-01  total Total oils receipts     773.261000
#> 1307 1990-11-01  total Total oils receipts     790.787000
#> 1308 1990-12-01  total Total oils receipts     800.872000
#> 1309 1991-01-01  total Total oils receipts     732.682000
#> 1310 1991-02-01  total Total oils receipts     795.369000
#> 1311 1991-03-01  total Total oils receipts     775.972000
#> 1312 1991-04-01  total Total oils receipts     879.466300
#> 1313 1991-05-01  total Total oils receipts     919.218400
#> 1314 1991-06-01  total Total oils receipts     927.705000
#> 1315 1991-07-01  total Total oils receipts     891.703000
#> 1316 1991-08-01  total Total oils receipts     959.848000
#> 1317 1991-09-01  total Total oils receipts     924.665000
#> 1318 1991-10-01  total Total oils receipts     896.250200
#> 1319 1991-11-01  total Total oils receipts     962.822700
#> 1320 1991-12-01  total Total oils receipts     921.611527
#> 1321 1992-01-01  total Total oils receipts     844.372732
#> 1322 1992-02-01  total Total oils receipts     880.980336
#> 1323 1992-03-01  total Total oils receipts     984.921051
#> 1324 1992-04-01  total Total oils receipts     901.760357
#> 1325 1992-05-01  total Total oils receipts     908.823105
#> 1326 1992-06-01  total Total oils receipts     962.377788
#> 1327 1992-07-01  total Total oils receipts     963.516277
#> 1328 1992-08-01  total Total oils receipts     957.006894
#> 1329 1992-09-01  total Total oils receipts     952.960846
#> 1330 1992-10-01  total Total oils receipts     977.377172
#> 1331 1992-11-01  total Total oils receipts     984.278855
#> 1332 1992-12-01  total Total oils receipts     973.489683
#> 1333 1993-01-01  total Total oils receipts     907.038792
#> 1334 1993-02-01  total Total oils receipts     939.678223
#> 1335 1993-03-01  total Total oils receipts    1014.379793
#> 1336 1993-04-01  total Total oils receipts    1021.842888
#> 1337 1993-05-01  total Total oils receipts     965.551029
#> 1338 1993-06-01  total Total oils receipts    1037.174566
#> 1339 1993-07-01  total Total oils receipts    1041.470119
#> 1340 1993-08-01  total Total oils receipts    1097.591497
#> 1341 1993-09-01  total Total oils receipts    1049.629130
#> 1342 1993-10-01  total Total oils receipts    1084.339945
#> 1343 1993-11-01  total Total oils receipts    1174.103234
#> 1344 1993-12-01  total Total oils receipts    1162.721087
#> 1345 1994-01-01  total Total oils receipts    1007.469101
#> 1346 1994-02-01  total Total oils receipts    1062.312377
#> 1347 1994-03-01  total Total oils receipts    1041.348190
#> 1348 1994-04-01  total Total oils receipts    1199.137601
#> 1349 1994-05-01  total Total oils receipts    1160.577779
#> 1350 1994-06-01  total Total oils receipts    1178.207423
#> 1351 1994-07-01  total Total oils receipts    1181.841780
#> 1352 1994-08-01  total Total oils receipts    1144.405282
#> 1353 1994-09-01  total Total oils receipts    1140.597083
#> 1354 1994-10-01  total Total oils receipts    1200.727440
#> 1355 1994-11-01  total Total oils receipts    1321.134005
#> 1356 1994-12-01  total Total oils receipts    1341.136065
#> 1357 1995-01-01  total Total oils receipts    1134.456541
#> 1358 1995-02-01  total Total oils receipts    1089.117324
#> 1359 1995-03-01  total Total oils receipts    1163.257949
#> 1360 1995-04-01  total Total oils receipts    1356.470406
#> 1361 1995-05-01  total Total oils receipts    1223.072968
#> 1362 1995-06-01  total Total oils receipts    1309.920875
#> 1363 1995-07-01  total Total oils receipts    1156.357424
#> 1364 1995-08-01  total Total oils receipts    1291.623002
#> 1365 1995-09-01  total Total oils receipts    1409.460245
#> 1366 1995-10-01  total Total oils receipts    1274.066831
#> 1367 1995-11-01  total Total oils receipts    1475.962960
#> 1368 1995-12-01  total Total oils receipts    1477.392128
#> 1369 1996-01-01  total Total oils receipts    1088.406394
#> 1370 1996-02-01  total Total oils receipts    1326.056303
#> 1371 1996-03-01  total Total oils receipts    1291.119480
#> 1372 1996-04-01  total Total oils receipts    1397.197737
#> 1373 1996-05-01  total Total oils receipts    1425.190630
#> 1374 1996-06-01  total Total oils receipts    1447.577539
#> 1375 1996-07-01  total Total oils receipts    1364.213829
#> 1376 1996-08-01  total Total oils receipts    1445.810167
#> 1377 1996-09-01  total Total oils receipts    1419.105533
#> 1378 1996-10-01  total Total oils receipts    1425.412938
#> 1379 1996-11-01  total Total oils receipts    1656.817048
#> 1380 1996-12-01  total Total oils receipts    1609.525741
#> 1381 1997-01-01  total Total oils receipts    1211.197533
#> 1382 1997-02-01  total Total oils receipts    1380.539359
#> 1383 1997-03-01  total Total oils receipts    1393.824643
#> 1384 1997-04-01  total Total oils receipts    1480.430356
#> 1385 1997-05-01  total Total oils receipts    1545.807543
#> 1386 1997-06-01  total Total oils receipts    1670.868252
#> 1387 1997-07-01  total Total oils receipts    1666.072133
#> 1388 1997-08-01  total Total oils receipts    1457.197592
#> 1389 1997-09-01  total Total oils receipts    1560.179224
#> 1390 1997-10-01  total Total oils receipts    1601.320992
#> 1391 1997-11-01  total Total oils receipts    1773.924571
#> 1392 1997-12-01  total Total oils receipts    1626.144786
#> 1393 1998-01-01  total Total oils receipts    1526.362461
#> 1394 1998-02-01  total Total oils receipts    1683.160479
#> 1395 1998-03-01  total Total oils receipts    1866.127698
#> 1396 1998-04-01  total Total oils receipts    1627.969338
#> 1397 1998-05-01  total Total oils receipts    1619.853188
#> 1398 1998-06-01  total Total oils receipts    1767.461610
#> 1399 1998-07-01  total Total oils receipts    1769.068717
#> 1400 1998-08-01  total Total oils receipts    1842.755417
#> 1401 1998-09-01  total Total oils receipts    1752.885091
#> 1402 1998-10-01  total Total oils receipts    1801.533225
#> 1403 1998-11-01  total Total oils receipts    1869.728933
#> 1404 1998-12-01  total Total oils receipts    1869.078788
#> 1405 1999-01-01  total Total oils receipts    1697.215555
#> 1406 1999-02-01  total Total oils receipts    1793.641519
#> 1407 1999-03-01  total Total oils receipts    2141.498389
#> 1408 1999-04-01  total Total oils receipts    1736.854556
#> 1409 1999-05-01  total Total oils receipts    1748.810022
#> 1410 1999-06-01  total Total oils receipts    1817.611658
#> 1411 1999-07-01  total Total oils receipts    1869.389130
#> 1412 1999-08-01  total Total oils receipts    1858.817089
#> 1413 1999-09-01  total Total oils receipts    1852.473581
#> 1414 1999-10-01  total Total oils receipts    1891.743319
#> 1415 1999-11-01  total Total oils receipts    2000.465088
#> 1416 1999-12-01  total Total oils receipts    1984.361961
#> 1417 2000-01-01  total Total oils receipts    1761.889992
#> 1418 2000-02-01  total Total oils receipts    1945.998603
#> 1419 2000-03-01  total Total oils receipts    2046.351125
#> 1420 2000-04-01  total Total oils receipts    1989.470363
#> 1421 2000-05-01  total Total oils receipts    1721.785706
#> 1422 2000-06-01  total Total oils receipts    1941.736462
#> 1423 2000-07-01  total Total oils receipts    1892.314776
#> 1424 2000-08-01  total Total oils receipts    1957.076574
#> 1425 2000-09-01  total Total oils receipts    1823.879003
#> 1426 2000-10-01  total Total oils receipts    1988.010528
#> 1427 2000-11-01  total Total oils receipts    2092.267244
#> 1428 2000-12-01  total Total oils receipts    1882.882263
#> 1429 2001-01-01  total Total oils receipts    1750.364536
#> 1430 2001-02-01  total Total oils receipts    1894.299061
#> 1431 2001-03-01  total Total oils receipts    1688.267302
#> 1432 2001-04-01  total Total oils receipts    1925.415743
#> 1433 2001-05-01  total Total oils receipts    1724.583971
#> 1434 2001-06-01  total Total oils receipts    1906.697351
#> 1435 2001-07-01  total Total oils receipts    1793.546974
#> 1436 2001-08-01  total Total oils receipts    1827.334987
#> 1437 2001-09-01  total Total oils receipts    1926.016642
#> 1438 2001-10-01  total Total oils receipts    1788.418486
#> 1439 2001-11-01  total Total oils receipts    1896.181109
#> 1440 2001-12-01  total Total oils receipts    1917.474992
#> 1441 2002-01-01  total Total oils receipts    1662.974045
#> 1442 2002-02-01  total Total oils receipts    1839.550161
#> 1443 2002-03-01  total Total oils receipts    1708.256149
#> 1444 2002-04-01  total Total oils receipts    1899.230759
#> 1445 2002-05-01  total Total oils receipts    1832.831546
#> 1446 2002-06-01  total Total oils receipts    1868.920810
#> 1447 2002-07-01  total Total oils receipts    1807.765581
#> 1448 2002-08-01  total Total oils receipts    1911.322677
#> 1449 2002-09-01  total Total oils receipts    1832.124314
#> 1450 2002-10-01  total Total oils receipts    1850.822599
#> 1451 2002-11-01  total Total oils receipts    1961.545757
#> 1452 2002-12-01  total Total oils receipts    1894.829512
#> 1453 2003-01-01  total Total oils receipts    1701.599439
#> 1454 2003-02-01  total Total oils receipts    1878.131209
#> 1455 2003-03-01  total Total oils receipts    1707.409385
#> 1456 2003-04-01  total Total oils receipts    1968.000701
#> 1457 2003-05-01  total Total oils receipts    1796.348547
#> 1458 2003-06-01  total Total oils receipts    1912.005645
#> 1459 2003-07-01  total Total oils receipts    1845.489681
#> 1460 2003-08-01  total Total oils receipts    1908.231330
#> 1461 2003-09-01  total Total oils receipts    1865.608277
#> 1462 2003-10-01  total Total oils receipts    2018.156817
#> 1463 2003-11-01  total Total oils receipts    1940.079917
#> 1464 2003-12-01  total Total oils receipts    1934.481974
#> 1465 2004-01-01  total Total oils receipts    1807.998718
#> 1466 2004-02-01  total Total oils receipts    1914.580711
#> 1467 2004-03-01  total Total oils receipts    1874.896022
#> 1468 2004-04-01  total Total oils receipts    1994.726062
#> 1469 2004-05-01  total Total oils receipts    1933.984958
#> 1470 2004-06-01  total Total oils receipts    2003.859321
#> 1471 2004-07-01  total Total oils receipts    1927.232549
#> 1472 2004-08-01  total Total oils receipts    2002.638057
#> 1473 2004-09-01  total Total oils receipts    1922.238089
#> 1474 2004-10-01  total Total oils receipts    1990.700887
#> 1475 2004-11-01  total Total oils receipts    1990.587329
#> 1476 2004-12-01  total Total oils receipts    2048.434586
#> 1477 2005-01-01  total Total oils receipts    1788.886419
#> 1478 2005-02-01  total Total oils receipts    1984.321668
#> 1479 2005-03-01  total Total oils receipts    1726.207484
#> 1480 2005-04-01  total Total oils receipts    2046.672984
#> 1481 2005-05-01  total Total oils receipts    1936.164018
#> 1482 2005-06-01  total Total oils receipts    1974.858546
#> 1483 2005-07-01  total Total oils receipts    1987.204632
#> 1484 2005-08-01  total Total oils receipts    1945.045908
#> 1485 2005-09-01  total Total oils receipts    2039.069414
#> 1486 2005-10-01  total Total oils receipts    1929.916852
#> 1487 2005-11-01  total Total oils receipts    1953.503010
#> 1488 2005-12-01  total Total oils receipts    2034.655060
#> 1489 2006-01-01  total Total oils receipts    1867.325588
#> 1490 2006-02-01  total Total oils receipts    1959.652902
#> 1491 2006-03-01  total Total oils receipts    1763.858405
#> 1492 2006-04-01  total Total oils receipts    2071.002436
#> 1493 2006-05-01  total Total oils receipts    1891.336985
#> 1494 2006-06-01  total Total oils receipts    2002.254253
#> 1495 2006-07-01  total Total oils receipts    1912.174965
#> 1496 2006-08-01  total Total oils receipts    2002.913611
#> 1497 2006-09-01  total Total oils receipts    1990.552835
#> 1498 2006-10-01  total Total oils receipts    1936.245000
#> 1499 2006-11-01  total Total oils receipts    2031.682829
#> 1500 2006-12-01  total Total oils receipts    2018.457598
#> 1501 2007-01-01  total Total oils receipts    1877.551985
#> 1502 2007-02-01  total Total oils receipts    2011.031328
#> 1503 2007-03-01  total Total oils receipts    1840.278356
#> 1504 2007-04-01  total Total oils receipts    2100.821840
#> 1505 2007-05-01  total Total oils receipts    2030.625914
#> 1506 2007-06-01  total Total oils receipts    2061.254040
#> 1507 2007-07-01  total Total oils receipts    1997.599960
#> 1508 2007-08-01  total Total oils receipts    2048.799122
#> 1509 2007-09-01  total Total oils receipts    2075.126274
#> 1510 2007-10-01  total Total oils receipts    2153.615599
#> 1511 2007-11-01  total Total oils receipts    2146.004600
#> 1512 2007-12-01  total Total oils receipts    2169.979423
#> 1513 2008-01-01  total Total oils receipts    1953.938709
#> 1514 2008-02-01  total Total oils receipts    2119.688621
#> 1515 2008-03-01  total Total oils receipts    2047.515783
#> 1516 2008-04-01  total Total oils receipts    2130.519947
#> 1517 2008-05-01  total Total oils receipts    2080.866192
#> 1518 2008-06-01  total Total oils receipts    2132.213675
#> 1519 2008-07-01  total Total oils receipts    2040.949265
#> 1520 2008-08-01  total Total oils receipts    2030.181994
#> 1521 2008-09-01  total Total oils receipts    1999.632873
#> 1522 2008-10-01  total Total oils receipts    2052.907212
#> 1523 2008-11-01  total Total oils receipts    2140.213389
#> 1524 2008-12-01  total Total oils receipts    2062.445239
#> 1525 2009-01-01  total Total oils receipts    1977.682057
#> 1526 2009-02-01  total Total oils receipts    2083.565372
#> 1527 2009-03-01  total Total oils receipts    1883.775572
#> 1528 2009-04-01  total Total oils receipts    2235.412041
#> 1529 2009-05-01  total Total oils receipts    2111.899093
#> 1530 2009-06-01  total Total oils receipts    2194.927860
#> 1531 2009-07-01  total Total oils receipts    2146.131271
#> 1532 2009-08-01  total Total oils receipts    2247.009184
#> 1533 2009-09-01  total Total oils receipts    2268.422521
#> 1534 2009-10-01  total Total oils receipts    2198.091204
#> 1535 2009-11-01  total Total oils receipts    2261.580072
#> 1536 2009-12-01  total Total oils receipts    2285.142023
#> 1537 2010-01-01  total Total oils receipts    1949.031835
#> 1538 2010-02-01  total Total oils receipts    2192.708765
#> 1539 2010-03-01  total Total oils receipts    2107.000074
#> 1540 2010-04-01  total Total oils receipts    2378.399647
#> 1541 2010-05-01  total Total oils receipts    2232.947232
#> 1542 2010-06-01  total Total oils receipts    2245.194145
#> 1543 2010-07-01  total Total oils receipts    2303.805237
#> 1544 2010-08-01  total Total oils receipts    2306.116621
#> 1545 2010-09-01  total Total oils receipts    2306.925424
#> 1546 2010-10-01  total Total oils receipts    2366.895442
#> 1547 2010-11-01  total Total oils receipts    2380.736313
#> 1548 2010-12-01  total Total oils receipts    2242.627225
#> 1549 2011-01-01  total Total oils receipts    2141.368232
#> 1550 2011-02-01  total Total oils receipts    2203.039039
#> 1551 2011-03-01  total Total oils receipts    2147.591241
#> 1552 2011-04-01  total Total oils receipts    2383.907732
#> 1553 2011-05-01  total Total oils receipts    2157.085726
#> 1554 2011-06-01  total Total oils receipts    2269.186071
#> 1555 2011-07-01  total Total oils receipts    2254.320693
#> 1556 2011-08-01  total Total oils receipts    2187.192543
#> 1557 2011-09-01  total Total oils receipts    2311.312975
#> 1558 2011-10-01  total Total oils receipts    2305.430282
#> 1559 2011-11-01  total Total oils receipts    2302.396853
#> 1560 2011-12-01  total Total oils receipts    2261.846051
#> 1561 2012-01-01  total Total oils receipts    2100.158463
#> 1562 2012-02-01  total Total oils receipts    2197.413167
#> 1563 2012-03-01  total Total oils receipts    2069.623607
#> 1564 2012-04-01  total Total oils receipts    2386.234600
#> 1565 2012-05-01  total Total oils receipts    2119.088968
#> 1566 2012-06-01  total Total oils receipts    2247.189060
#> 1567 2012-07-01  total Total oils receipts    2211.730171
#> 1568 2012-08-01  total Total oils receipts    2236.810110
#> 1569 2012-09-01  total Total oils receipts    2260.199324
#> 1570 2012-10-01  total Total oils receipts    2220.195419
#> 1571 2012-11-01  total Total oils receipts    2323.529586
#> 1572 2012-12-01  total Total oils receipts    2331.195920
#> 1573 2013-01-01  total Total oils receipts    2007.796096
#> 1574 2013-02-01  total Total oils receipts    2154.622474
#> 1575 2013-03-01  total Total oils receipts    2072.058192
#> 1576 2013-04-01  total Total oils receipts    2257.596702
#> 1577 2013-05-01  total Total oils receipts    2267.337436
#> 1578 2013-06-01  total Total oils receipts    2319.038585
#> 1579 2013-07-01  total Total oils receipts    2187.346755
#> 1580 2013-08-01  total Total oils receipts    2316.666915
#> 1581 2013-09-01  total Total oils receipts    2259.635923
#> 1582 2013-10-01  total Total oils receipts    2225.847177
#> 1583 2013-11-01  total Total oils receipts    2347.191272
#> 1584 2013-12-01  total Total oils receipts    2282.420969
#> 1585 2014-01-01  total Total oils receipts    2069.893829
#> 1586 2014-02-01  total Total oils receipts    2214.585479
#> 1587 2014-03-01  total Total oils receipts    2133.726459
#> 1588 2014-04-01  total Total oils receipts    2302.929920
#> 1589 2014-05-01  total Total oils receipts    2230.758131
#> 1590 2014-06-01  total Total oils receipts    2316.852007
#> 1591 2014-07-01  total Total oils receipts    2245.231300
#> 1592 2014-08-01  total Total oils receipts    2374.908289
#> 1593 2014-09-01  total Total oils receipts    2238.194398
#> 1594 2014-10-01  total Total oils receipts    2271.119627
#> 1595 2014-11-01  total Total oils receipts    2374.450699
#> 1596 2014-12-01  total Total oils receipts    2322.415841
#> 1597 2015-01-01  total Total oils receipts    2063.540162
#> 1598 2015-02-01  total Total oils receipts    2296.539634
#> 1599 2015-03-01  total Total oils receipts    2119.261569
#> 1600 2015-04-01  total Total oils receipts    2299.899572
#> 1601 2015-05-01  total Total oils receipts    2301.328803
#> 1602 2015-06-01  total Total oils receipts    2340.579461
#> 1603 2015-07-01  total Total oils receipts    2322.122289
#> 1604 2015-08-01  total Total oils receipts    2360.343455
#> 1605 2015-09-01  total Total oils receipts    2278.006022
#> 1606 2015-10-01  total Total oils receipts    2324.047249
#> 1607 2015-11-01  total Total oils receipts    2382.899101
#> 1608 2015-12-01  total Total oils receipts    2326.936038
#> 1609 2016-01-01  total Total oils receipts    2140.405660
#> 1610 2016-02-01  total Total oils receipts    2279.384920
#> 1611 2016-03-01  total Total oils receipts    2266.628208
#> 1612 2016-04-01  total Total oils receipts    2365.784218
#> 1613 2016-05-01  total Total oils receipts    2314.061578
#> 1614 2016-06-01  total Total oils receipts    2424.531114
#> 1615 2016-07-01  total Total oils receipts    2338.761926
#> 1616 2016-08-01  total Total oils receipts    2353.583333
#> 1617 2016-09-01  total Total oils receipts    2349.675576
#> 1618 2016-10-01  total Total oils receipts    2360.634600
#> 1619 2016-11-01  total Total oils receipts    2397.751356
#> 1620 2016-12-01  total Total oils receipts    2395.750810
#> 1621 2017-01-01  total Total oils receipts    2050.196946
#> 1622 2017-02-01  total Total oils receipts    2426.352825
#> 1623 2017-03-01  total Total oils receipts    2158.457645
#> 1624 2017-04-01  total Total oils receipts    2450.721867
#> 1625 2017-05-01  total Total oils receipts    2279.454660
#> 1626 2017-06-01  total Total oils receipts    2390.666006
#> 1627 2017-07-01  total Total oils receipts    2353.277782
#> 1628 2017-08-01  total Total oils receipts    2358.285373
#> 1629 2017-09-01  total Total oils receipts    2348.736329
#> 1630 2017-10-01  total Total oils receipts    2311.372497
#> 1631 2017-11-01  total Total oils receipts    2439.546708
#> 1632 2017-12-01  total Total oils receipts    2406.580303
#> 1633 2018-01-01  total Total oils receipts    2125.932753
#> 1634 2018-02-01  total Total oils receipts    2359.638253
#> 1635 2018-03-01  total Total oils receipts    2052.720046
#> 1636 2018-04-01  total Total oils receipts    2414.718097
#> 1637 2018-05-01  total Total oils receipts    2301.566277
#> 1638 2018-06-01  total Total oils receipts    2458.939307
#> 1639 2018-07-01  total Total oils receipts    2338.322797
#> 1640 2018-08-01  total Total oils receipts    2364.139371
#> 1641 2018-09-01  total Total oils receipts    2401.732336
#> 1642 2018-10-01  total Total oils receipts    2229.098210
#> 1643 2018-11-01  total Total oils receipts    2518.097694
#> 1644 2018-12-01  total Total oils receipts    2364.037124
#> 1645 2019-01-01  total Total oils receipts    2229.982646
#> 1646 2019-02-01  total Total oils receipts    2241.255108
#> 1647 2019-03-01  total Total oils receipts    2141.761331
#> 1648 2019-04-01  total Total oils receipts    2380.352706
#> 1649 2019-05-01  total Total oils receipts    2276.990620
#> 1650 2019-06-01  total Total oils receipts    2393.057762
#> 1651 2019-07-01  total Total oils receipts    2278.846586
#> 1652 2019-08-01  total Total oils receipts    2394.133896
#> 1653 2019-09-01  total Total oils receipts    2355.734708
#> 1654 2019-10-01  total Total oils receipts    2308.132848
#> 1655 2019-11-01  total Total oils receipts    2362.391004
#> 1656 2019-12-01  total Total oils receipts    2433.474992
#> 1657 2020-01-01  total Total oils receipts    2133.106192
#> 1658 2020-02-01  total Total oils receipts    2302.147029
#> 1659 2020-03-01  total Total oils receipts    1954.546582
#> 1660 2020-04-01  total Total oils receipts    1373.019886
#> 1661 2020-05-01  total Total oils receipts     990.217263
#> 1662 2020-06-01  total Total oils receipts    1618.598173
#> 1663 2020-07-01  total Total oils receipts    1839.684935
#> 1664 2020-08-01  total Total oils receipts    2124.659159
#> 1665 2020-09-01  total Total oils receipts    2123.071662
#> 1666 2020-10-01  total Total oils receipts    2161.617958
#> 1667 2020-11-01  total Total oils receipts    2110.730218
#> 1668 2020-12-01  total Total oils receipts    1914.257595
#> 1669 2021-01-01  total Total oils receipts    1694.002074
#> 1670 2021-02-01  total Total oils receipts    1580.522438
#> 1671 2021-03-01  total Total oils receipts    1401.824460
#> 1672 2021-04-01  total Total oils receipts    2011.014180
#> 1673 2021-05-01  total Total oils receipts    2310.216340
#> 1674 2021-06-01  total Total oils receipts    2249.858797
#> 1675 2021-07-01  total Total oils receipts    2266.316265
#> 1676 2021-08-01  total Total oils receipts    2285.215090
#> 1677 2021-09-01  total Total oils receipts    2249.735839
#> 1678 2021-10-01  total Total oils receipts    2266.294503
#> 1679 2021-11-01  total Total oils receipts    2230.249416
#> 1680 2021-12-01  total Total oils receipts    2282.749966
#> 1681 2022-01-01  total Total oils receipts    1838.566124
#> 1682 2022-02-01  total Total oils receipts    2038.641608
#> 1683 2022-03-01  total Total oils receipts    1913.891497
#> 1684 2022-04-01  total Total oils receipts    2095.062075
#> 1685 2022-05-01  total Total oils receipts    2277.228688
#> 1686 2022-06-01  total Total oils receipts    2169.324024
#> 1687 2022-07-01  total Total oils receipts    2062.854116
#> 1688 2022-08-01  total Total oils receipts    2126.938256
#> 1689 2022-09-01  total Total oils receipts    2010.663327
#> 1690 2022-10-01  total Total oils receipts    2130.322082
#> 1691 2022-11-01  total Total oils receipts    2117.324077
#> 1692 2022-12-01  total Total oils receipts    2067.881256
#> 1693 2023-01-01  total Total oils receipts    1964.467685
#> 1694 2023-02-01  total Total oils receipts    2176.171394
#> 1695 2023-03-01  total Total oils receipts    1901.287961
#> 1696 2023-04-01  total Total oils receipts    2078.005427
#> 1697 2023-05-01  total Total oils receipts    2050.252838
#> 1698 2023-06-01  total Total oils receipts    2127.925399
#> 1699 2023-07-01  total Total oils receipts    1674.115966
#> 1700 2023-08-01  total Total oils receipts    2545.586699
#> 1701 2023-09-01  total Total oils receipts    1954.396114
#> 1702 2023-10-01  total Total oils receipts    2113.726813
#> 1703 2023-11-01  total Total oils receipts    2225.893188
#> 1704 2023-12-01  total Total oils receipts    2093.627193
#> 1705 2024-01-01  total Total oils receipts    1834.276047
#> 1706 2024-02-01  total Total oils receipts    2107.228643
#> 1707 2024-03-01  total Total oils receipts    2022.633932
#> 1708 2024-04-01  total Total oils receipts    1903.166422
#> 1709 2024-05-01  total Total oils receipts    2044.154114
#> 1710 2024-06-01  total Total oils receipts    2066.890075
#> 1711 2024-07-01  total Total oils receipts    2116.416923
#> 1712 2024-08-01  total Total oils receipts    2054.428691
#> 1713 2024-09-01  total Total oils receipts    2059.059780
#> 1714 2024-10-01  total Total oils receipts    1983.372683
#> 1715 2024-11-01  total Total oils receipts    2253.023205
#> 1716 2024-12-01  total Total oils receipts    1904.013944
#> 1717 2025-01-01  total Total oils receipts    1779.900785
#> 1718 2025-02-01  total Total oils receipts    2154.907190
#> 1719 2025-03-01  total Total oils receipts    2041.068148
#> 1720 2025-04-01  total Total oils receipts    2006.298646
#> 1721 2025-05-01  total Total oils receipts    2095.429592
#> 1722 2025-06-01  total Total oils receipts    1901.686898
#> 1723 2025-07-01  total Total oils receipts    2028.921593
#> 1724 2025-08-01  total Total oils receipts    2005.278485
#> 1725 2025-09-01  total Total oils receipts    2180.195164
#> 1726 2025-10-01  total Total oils receipts    1991.797329
#> 1727 2025-11-01  total Total oils receipts    2228.118101
#> 1728 2025-12-01  total Total oils receipts    2072.149731
options(op)
# }
```
