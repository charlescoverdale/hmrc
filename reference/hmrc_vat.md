# Download HMRC VAT receipts

Downloads and tidies the HMRC VAT Annual Statistics bulletin, which
reports monthly VAT receipts broken down into payments, repayments,
import VAT, and home VAT. Monthly data runs from April 1973; the
bulletin is published annually (December).

## Usage

``` r
hmrc_vat(measure = NULL, start = NULL, end = NULL, cache = TRUE)
```

## Source

<https://www.gov.uk/government/statistics/value-added-tax-vat-annual-statistics>

## Arguments

- measure:

  Character vector or `NULL` (default = all measures). Valid values:
  `"total"`, `"payments"`, `"repayments"`, `"import_vat"`, `"home_vat"`.

- start:

  Character `"YYYY-MM"` or a `Date` object.

- end:

  Character `"YYYY-MM"` or a `Date` object.

- cache:

  Logical. Use cached file if available (default `TRUE`).

## Value

An `hmrc_tbl` with columns `date`, `measure`, `description`,
`receipts_gbp_m`. Repayments are negative.

## Details

Note that early years (pre-1985) have suppressed payment and repayment
splits; only the total is available for those periods. From January
2021, import VAT collected via postponed VAT accounting is recorded
within payments and repayments rather than the import VAT column.

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
[`hmrc_stamp_duty()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_stamp_duty.md),
[`hmrc_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_gap.md),
[`hmrc_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_receipts.md),
[`hmrc_tobacco_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tobacco_duties.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
hmrc_vat(measure = "total", start = "2010-01")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [537ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [25ms]
#> 
#> ℹ Parsing data
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> ✔ Parsing data [97ms]
#> 
#> # VAT annual statistics (monthly receipts)
#> # Source: https://www.gov.uk/government/statistics/value-added-tax-vat-annual-statistics
#> # Fetched 2026-04-26 13:02:10 UTC | Vintage: latest | Cells: cash | Freq: monthly | 189 rows x 4 cols
#> 
#>           date measure        description receipts_gbp_m
#> 1   2010-01-01   total Total VAT receipts           8230
#> 2   2010-02-01   total Total VAT receipts           6590
#> 3   2010-03-01   total Total VAT receipts           4280
#> 4   2010-04-01   total Total VAT receipts           9470
#> 5   2010-05-01   total Total VAT receipts           5460
#> 6   2010-06-01   total Total VAT receipts           4960
#> 7   2010-07-01   total Total VAT receipts           8450
#> 8   2010-08-01   total Total VAT receipts           7530
#> 9   2010-09-01   total Total VAT receipts           4590
#> 10  2010-10-01   total Total VAT receipts           8690
#> 11  2010-11-01   total Total VAT receipts           7620
#> 12  2010-12-01   total Total VAT receipts           5000
#> 13  2011-01-01   total Total VAT receipts           8800
#> 14  2011-02-01   total Total VAT receipts           8380
#> 15  2011-03-01   total Total VAT receipts           4550
#> 16  2011-04-01   total Total VAT receipts          10600
#> 17  2011-05-01   total Total VAT receipts           8000
#> 18  2011-06-01   total Total VAT receipts           5470
#> 19  2011-07-01   total Total VAT receipts           9960
#> 20  2011-08-01   total Total VAT receipts           8550
#> 21  2011-09-01   total Total VAT receipts           5470
#> 22  2011-10-01   total Total VAT receipts          10600
#> 23  2011-11-01   total Total VAT receipts           9470
#> 24  2011-12-01   total Total VAT receipts           5380
#> 25  2012-01-01   total Total VAT receipts          10300
#> 26  2012-02-01   total Total VAT receipts           8800
#> 27  2012-03-01   total Total VAT receipts           5680
#> 28  2012-04-01   total Total VAT receipts          10200
#> 29  2012-05-01   total Total VAT receipts           8360
#> 30  2012-06-01   total Total VAT receipts           5870
#> 31  2012-07-01   total Total VAT receipts          10100
#> 32  2012-08-01   total Total VAT receipts           9050
#> 33  2012-09-01   total Total VAT receipts           5420
#> 34  2012-10-01   total Total VAT receipts          10200
#> 35  2012-11-01   total Total VAT receipts           8760
#> 36  2012-12-01   total Total VAT receipts           5800
#> 37  2013-01-01   total Total VAT receipts          11200
#> 38  2013-02-01   total Total VAT receipts           9130
#> 39  2013-03-01   total Total VAT receipts           6430
#> 40  2013-04-01   total Total VAT receipts          10200
#> 41  2013-05-01   total Total VAT receipts           8260
#> 42  2013-06-01   total Total VAT receipts           6510
#> 43  2013-07-01   total Total VAT receipts          10200
#> 44  2013-08-01   total Total VAT receipts           9190
#> 45  2013-09-01   total Total VAT receipts           6260
#> 46  2013-10-01   total Total VAT receipts          11500
#> 47  2013-11-01   total Total VAT receipts           9060
#> 48  2013-12-01   total Total VAT receipts           5760
#> 49  2014-01-01   total Total VAT receipts          11100
#> 50  2014-02-01   total Total VAT receipts          10400
#> 51  2014-03-01   total Total VAT receipts           6160
#> 52  2014-04-01   total Total VAT receipts          11200
#> 53  2014-05-01   total Total VAT receipts           9430
#> 54  2014-06-01   total Total VAT receipts           6350
#> 55  2014-07-01   total Total VAT receipts          11100
#> 56  2014-08-01   total Total VAT receipts           9980
#> 57  2014-09-01   total Total VAT receipts           5830
#> 58  2014-10-01   total Total VAT receipts          11200
#> 59  2014-11-01   total Total VAT receipts           9990
#> 60  2014-12-01   total Total VAT receipts           6600
#> 61  2015-01-01   total Total VAT receipts          12200
#> 62  2015-02-01   total Total VAT receipts          10200
#> 63  2015-03-01   total Total VAT receipts           7290
#> 64  2015-04-01   total Total VAT receipts          10900
#> 65  2015-05-01   total Total VAT receipts           9490
#> 66  2015-06-01   total Total VAT receipts           6460
#> 67  2015-07-01   total Total VAT receipts          11500
#> 68  2015-08-01   total Total VAT receipts          10000
#> 69  2015-09-01   total Total VAT receipts           6920
#> 70  2015-10-01   total Total VAT receipts          11900
#> 71  2015-11-01   total Total VAT receipts          10900
#> 72  2015-12-01   total Total VAT receipts           6390
#> 73  2016-01-01   total Total VAT receipts          12500
#> 74  2016-02-01   total Total VAT receipts          10900
#> 75  2016-03-01   total Total VAT receipts           7010
#> 76  2016-04-01   total Total VAT receipts          11100
#> 77  2016-05-01   total Total VAT receipts          11000
#> 78  2016-06-01   total Total VAT receipts           6060
#> 79  2016-07-01   total Total VAT receipts          12200
#> 80  2016-08-01   total Total VAT receipts          10800
#> 81  2016-09-01   total Total VAT receipts           6490
#> 82  2016-10-01   total Total VAT receipts          12300
#> 83  2016-11-01   total Total VAT receipts          11000
#> 84  2016-12-01   total Total VAT receipts           7190
#> 85  2017-01-01   total Total VAT receipts          13300
#> 86  2017-02-01   total Total VAT receipts          11000
#> 87  2017-03-01   total Total VAT receipts           7360
#> 88  2017-04-01   total Total VAT receipts          13200
#> 89  2017-05-01   total Total VAT receipts          10500
#> 90  2017-06-01   total Total VAT receipts           6490
#> 91  2017-07-01   total Total VAT receipts          12700
#> 92  2017-08-01   total Total VAT receipts          10600
#> 93  2017-09-01   total Total VAT receipts           7810
#> 94  2017-10-01   total Total VAT receipts          13200
#> 95  2017-11-01   total Total VAT receipts          11500
#> 96  2017-12-01   total Total VAT receipts           7100
#> 97  2018-01-01   total Total VAT receipts          13900
#> 98  2018-02-01   total Total VAT receipts          11700
#> 99  2018-03-01   total Total VAT receipts           7600
#> 100 2018-04-01   total Total VAT receipts          12600
#> 101 2018-05-01   total Total VAT receipts          10900
#> 102 2018-06-01   total Total VAT receipts           7310
#> 103 2018-07-01   total Total VAT receipts          13800
#> 104 2018-08-01   total Total VAT receipts          11400
#> 105 2018-09-01   total Total VAT receipts           8270
#> 106 2018-10-01   total Total VAT receipts          13200
#> 107 2018-11-01   total Total VAT receipts          12000
#> 108 2018-12-01   total Total VAT receipts           7670
#> 109 2019-01-01   total Total VAT receipts          13700
#> 110 2019-02-01   total Total VAT receipts          13400
#> 111 2019-03-01   total Total VAT receipts           8300
#> 112 2019-04-01   total Total VAT receipts          13000
#> 113 2019-05-01   total Total VAT receipts          11000
#> 114 2019-06-01   total Total VAT receipts           8120
#> 115 2019-07-01   total Total VAT receipts          13600
#> 116 2019-08-01   total Total VAT receipts          12400
#> 117 2019-09-01   total Total VAT receipts           8250
#> 118 2019-10-01   total Total VAT receipts          13600
#> 119 2019-11-01   total Total VAT receipts          13000
#> 120 2019-12-01   total Total VAT receipts           7620
#> 121 2020-01-01   total Total VAT receipts          14500
#> 122 2020-02-01   total Total VAT receipts          12600
#> 123 2020-03-01   total Total VAT receipts           2110
#> 124 2020-04-01   total Total VAT receipts           -900
#> 125 2020-05-01   total Total VAT receipts           -580
#> 126 2020-06-01   total Total VAT receipts           1080
#> 127 2020-07-01   total Total VAT receipts          10600
#> 128 2020-08-01   total Total VAT receipts          10100
#> 129 2020-09-01   total Total VAT receipts           7800
#> 130 2020-10-01   total Total VAT receipts          13400
#> 131 2020-11-01   total Total VAT receipts          12200
#> 132 2020-12-01   total Total VAT receipts           8540
#> 133 2021-01-01   total Total VAT receipts          15400
#> 134 2021-02-01   total Total VAT receipts          11200
#> 135 2021-03-01   total Total VAT receipts          12900
#> 136 2021-04-01   total Total VAT receipts          14700
#> 137 2021-05-01   total Total VAT receipts          11800
#> 138 2021-06-01   total Total VAT receipts           8660
#> 139 2021-07-01   total Total VAT receipts          17100
#> 140 2021-08-01   total Total VAT receipts          14700
#> 141 2021-09-01   total Total VAT receipts           8330
#> 142 2021-10-01   total Total VAT receipts          17100
#> 143 2021-11-01   total Total VAT receipts          15100
#> 144 2021-12-01   total Total VAT receipts           9160
#> 145 2022-01-01   total Total VAT receipts          18600
#> 146 2022-02-01   total Total VAT receipts          14800
#> 147 2022-03-01   total Total VAT receipts           7510
#> 148 2022-04-01   total Total VAT receipts          17200
#> 149 2022-05-01   total Total VAT receipts          11300
#> 150 2022-06-01   total Total VAT receipts           8590
#> 151 2022-07-01   total Total VAT receipts          17200
#> 152 2022-08-01   total Total VAT receipts          12900
#> 153 2022-09-01   total Total VAT receipts           8630
#> 154 2022-10-01   total Total VAT receipts          16700
#> 155 2022-11-01   total Total VAT receipts          14400
#> 156 2022-12-01   total Total VAT receipts           8990
#> 157 2023-01-01   total Total VAT receipts          19700
#> 158 2023-02-01   total Total VAT receipts          14000
#> 159 2023-03-01   total Total VAT receipts           8460
#> 160 2023-04-01   total Total VAT receipts          17900
#> 161 2023-05-01   total Total VAT receipts          13700
#> 162 2023-06-01   total Total VAT receipts           9320
#> 163 2023-07-01   total Total VAT receipts          18600
#> 164 2023-08-01   total Total VAT receipts          15400
#> 165 2023-09-01   total Total VAT receipts           7510
#> 166 2023-10-01   total Total VAT receipts          18300
#> 167 2023-11-01   total Total VAT receipts          14500
#> 168 2023-12-01   total Total VAT receipts           8990
#> 169 2024-01-01   total Total VAT receipts          19700
#> 170 2024-02-01   total Total VAT receipts          15200
#> 171 2024-03-01   total Total VAT receipts           9170
#> 172 2024-04-01   total Total VAT receipts          17600
#> 173 2024-05-01   total Total VAT receipts          13500
#> 174 2024-06-01   total Total VAT receipts          10400
#> 175 2024-07-01   total Total VAT receipts          18500
#> 176 2024-08-01   total Total VAT receipts          14100
#> 177 2024-09-01   total Total VAT receipts           9150
#> 178 2024-10-01   total Total VAT receipts          18700
#> 179 2024-11-01   total Total VAT receipts          15400
#> 180 2024-12-01   total Total VAT receipts           8610
#> 181 2025-01-01   total Total VAT receipts          19300
#> 182 2025-02-01   total Total VAT receipts          16200
#> 183 2025-03-01   total Total VAT receipts           9590
#> 184 2025-04-01   total Total VAT receipts          19000
#> 185 2025-05-01   total Total VAT receipts          14900
#> 186 2025-06-01   total Total VAT receipts          10000
#> 187 2025-07-01   total Total VAT receipts          20400
#> 188 2025-08-01   total Total VAT receipts          13100
#> 189 2025-09-01   total Total VAT receipts           9920
hmrc_vat(start = "2020-01")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [20ms]
#> 
#> ℹ Using cached file
#> ✔ Using cached file [5ms]
#> 
#> ℹ Parsing data
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> ✔ Parsing data [97ms]
#> 
#> # VAT annual statistics (monthly receipts)
#> # Source: https://www.gov.uk/government/statistics/value-added-tax-vat-annual-statistics
#> # Fetched 2026-04-26 13:02:10 UTC | Vintage: latest | Cells: cash | Freq: monthly | 345 rows x 4 cols
#> 
#>           date    measure        description receipts_gbp_m
#> 1   2020-01-01   home_vat           Home VAT          12000
#> 2   2020-02-01   home_vat           Home VAT           9900
#> 3   2020-03-01   home_vat           Home VAT           -190
#> 4   2020-04-01   home_vat           Home VAT          -2870
#> 5   2020-05-01   home_vat           Home VAT          -2360
#> 6   2020-06-01   home_vat           Home VAT           -770
#> 7   2020-07-01   home_vat           Home VAT           8060
#> 8   2020-08-01   home_vat           Home VAT           7440
#> 9   2020-09-01   home_vat           Home VAT           5250
#> 10  2020-10-01   home_vat           Home VAT          10600
#> 11  2020-11-01   home_vat           Home VAT           9040
#> 12  2020-12-01   home_vat           Home VAT           5560
#> 13  2021-01-01   home_vat           Home VAT          12700
#> 14  2021-02-01   home_vat           Home VAT           9580
#> 15  2021-03-01   home_vat           Home VAT          11100
#> 16  2021-04-01   home_vat           Home VAT          12800
#> 17  2021-05-01   home_vat           Home VAT          10400
#> 18  2021-06-01   home_vat           Home VAT           7260
#> 19  2021-07-01   home_vat           Home VAT          15700
#> 20  2021-08-01   home_vat           Home VAT          13400
#> 21  2021-09-01   home_vat           Home VAT           6950
#> 22  2021-10-01   home_vat           Home VAT          15800
#> 23  2021-11-01   home_vat           Home VAT          13800
#> 24  2021-12-01   home_vat           Home VAT           7840
#> 25  2022-01-01   home_vat           Home VAT          17400
#> 26  2022-02-01   home_vat           Home VAT          13600
#> 27  2022-03-01   home_vat           Home VAT           6450
#> 28  2022-04-01   home_vat           Home VAT          16000
#> 29  2022-05-01   home_vat           Home VAT          10300
#> 30  2022-06-01   home_vat           Home VAT           7450
#> 31  2022-07-01   home_vat           Home VAT          16100
#> 32  2022-08-01   home_vat           Home VAT          11700
#> 33  2022-09-01   home_vat           Home VAT           7500
#> 34  2022-10-01   home_vat           Home VAT          15600
#> 35  2022-11-01   home_vat           Home VAT          13100
#> 36  2022-12-01   home_vat           Home VAT           7910
#> 37  2023-01-01   home_vat           Home VAT          18700
#> 38  2023-02-01   home_vat           Home VAT          13200
#> 39  2023-03-01   home_vat           Home VAT           7450
#> 40  2023-04-01   home_vat           Home VAT          17000
#> 41  2023-05-01   home_vat           Home VAT          12900
#> 42  2023-06-01   home_vat           Home VAT           8470
#> 43  2023-07-01   home_vat           Home VAT          17700
#> 44  2023-08-01   home_vat           Home VAT          14400
#> 45  2023-09-01   home_vat           Home VAT           6720
#> 46  2023-10-01   home_vat           Home VAT          17500
#> 47  2023-11-01   home_vat           Home VAT          13500
#> 48  2023-12-01   home_vat           Home VAT           8200
#> 49  2024-01-01   home_vat           Home VAT          19000
#> 50  2024-02-01   home_vat           Home VAT          14600
#> 51  2024-03-01   home_vat           Home VAT           8500
#> 52  2024-04-01   home_vat           Home VAT          16700
#> 53  2024-05-01   home_vat           Home VAT          12800
#> 54  2024-06-01   home_vat           Home VAT           9380
#> 55  2024-07-01   home_vat           Home VAT          17800
#> 56  2024-08-01   home_vat           Home VAT          13400
#> 57  2024-09-01   home_vat           Home VAT           8440
#> 58  2024-10-01   home_vat           Home VAT          18000
#> 59  2024-11-01   home_vat           Home VAT          14500
#> 60  2024-12-01   home_vat           Home VAT           7910
#> 61  2025-01-01   home_vat           Home VAT          18500
#> 62  2025-02-01   home_vat           Home VAT          15400
#> 63  2025-03-01   home_vat           Home VAT           8950
#> 64  2025-04-01   home_vat           Home VAT          18100
#> 65  2025-05-01   home_vat           Home VAT          14000
#> 66  2025-06-01   home_vat           Home VAT           9200
#> 67  2025-07-01   home_vat           Home VAT          19700
#> 68  2025-08-01   home_vat           Home VAT          12400
#> 69  2025-09-01   home_vat           Home VAT           9200
#> 70  2020-01-01 import_vat         Import VAT           2470
#> 71  2020-02-01 import_vat         Import VAT           2690
#> 72  2020-03-01 import_vat         Import VAT           2290
#> 73  2020-04-01 import_vat         Import VAT           1970
#> 74  2020-05-01 import_vat         Import VAT           1780
#> 75  2020-06-01 import_vat         Import VAT           1850
#> 76  2020-07-01 import_vat         Import VAT           2520
#> 77  2020-08-01 import_vat         Import VAT           2630
#> 78  2020-09-01 import_vat         Import VAT           2550
#> 79  2020-10-01 import_vat         Import VAT           2810
#> 80  2020-11-01 import_vat         Import VAT           3180
#> 81  2020-12-01 import_vat         Import VAT           2980
#> 82  2021-01-01 import_vat         Import VAT           2670
#> 83  2021-02-01 import_vat         Import VAT           1600
#> 84  2021-03-01 import_vat         Import VAT           1710
#> 85  2021-04-01 import_vat         Import VAT           1890
#> 86  2021-05-01 import_vat         Import VAT           1420
#> 87  2021-06-01 import_vat         Import VAT           1390
#> 88  2021-07-01 import_vat         Import VAT           1400
#> 89  2021-08-01 import_vat         Import VAT           1350
#> 90  2021-09-01 import_vat         Import VAT           1370
#> 91  2021-10-01 import_vat         Import VAT           1360
#> 92  2021-11-01 import_vat         Import VAT           1260
#> 93  2021-12-01 import_vat         Import VAT           1320
#> 94  2022-01-01 import_vat         Import VAT           1180
#> 95  2022-02-01 import_vat         Import VAT           1160
#> 96  2022-03-01 import_vat         Import VAT           1060
#> 97  2022-04-01 import_vat         Import VAT           1200
#> 98  2022-05-01 import_vat         Import VAT           1040
#> 99  2022-06-01 import_vat         Import VAT           1130
#> 100 2022-07-01 import_vat         Import VAT           1140
#> 101 2022-08-01 import_vat         Import VAT           1110
#> 102 2022-09-01 import_vat         Import VAT           1130
#> 103 2022-10-01 import_vat         Import VAT           1080
#> 104 2022-11-01 import_vat         Import VAT           1280
#> 105 2022-12-01 import_vat         Import VAT           1080
#> 106 2023-01-01 import_vat         Import VAT            980
#> 107 2023-02-01 import_vat         Import VAT            860
#> 108 2023-03-01 import_vat         Import VAT           1010
#> 109 2023-04-01 import_vat         Import VAT            990
#> 110 2023-05-01 import_vat         Import VAT            810
#> 111 2023-06-01 import_vat         Import VAT            850
#> 112 2023-07-01 import_vat         Import VAT            860
#> 113 2023-08-01 import_vat         Import VAT           1010
#> 114 2023-09-01 import_vat         Import VAT            800
#> 115 2023-10-01 import_vat         Import VAT            810
#> 116 2023-11-01 import_vat         Import VAT            950
#> 117 2023-12-01 import_vat         Import VAT            790
#> 118 2024-01-01 import_vat         Import VAT            700
#> 119 2024-02-01 import_vat         Import VAT            670
#> 120 2024-03-01 import_vat         Import VAT            670
#> 121 2024-04-01 import_vat         Import VAT            870
#> 122 2024-05-01 import_vat         Import VAT            700
#> 123 2024-06-01 import_vat         Import VAT            980
#> 124 2024-07-01 import_vat         Import VAT            730
#> 125 2024-08-01 import_vat         Import VAT            740
#> 126 2024-09-01 import_vat         Import VAT            700
#> 127 2024-10-01 import_vat         Import VAT            690
#> 128 2024-11-01 import_vat         Import VAT            930
#> 129 2024-12-01 import_vat         Import VAT            700
#> 130 2025-01-01 import_vat         Import VAT            830
#> 131 2025-02-01 import_vat         Import VAT            730
#> 132 2025-03-01 import_vat         Import VAT            630
#> 133 2025-04-01 import_vat         Import VAT            830
#> 134 2025-05-01 import_vat         Import VAT            910
#> 135 2025-06-01 import_vat         Import VAT            800
#> 136 2025-07-01 import_vat         Import VAT            680
#> 137 2025-08-01 import_vat         Import VAT            700
#> 138 2025-09-01 import_vat         Import VAT            730
#> 139 2020-01-01   payments       VAT payments          19500
#> 140 2020-02-01   payments       VAT payments          18200
#> 141 2020-03-01   payments       VAT payments           7250
#> 142 2020-04-01   payments       VAT payments           4560
#> 143 2020-05-01   payments       VAT payments           5350
#> 144 2020-06-01   payments       VAT payments           5520
#> 145 2020-07-01   payments       VAT payments          15000
#> 146 2020-08-01   payments       VAT payments          14600
#> 147 2020-09-01   payments       VAT payments          12200
#> 148 2020-10-01   payments       VAT payments          17900
#> 149 2020-11-01   payments       VAT payments          16900
#> 150 2020-12-01   payments       VAT payments          14000
#> 151 2021-01-01   payments       VAT payments          18600
#> 152 2021-02-01   payments       VAT payments          18200
#> 153 2021-03-01   payments       VAT payments          19000
#> 154 2021-04-01   payments       VAT payments          20000
#> 155 2021-05-01   payments       VAT payments          18800
#> 156 2021-06-01   payments       VAT payments          15700
#> 157 2021-07-01   payments       VAT payments          23200
#> 158 2021-08-01   payments       VAT payments          21700
#> 159 2021-09-01   payments       VAT payments          15200
#> 160 2021-10-01   payments       VAT payments          23300
#> 161 2021-11-01   payments       VAT payments          22300
#> 162 2021-12-01   payments       VAT payments          16400
#> 163 2022-01-01   payments       VAT payments          24400
#> 164 2022-02-01   payments       VAT payments          22000
#> 165 2022-03-01   payments       VAT payments          14600
#> 166 2022-04-01   payments       VAT payments          22800
#> 167 2022-05-01   payments       VAT payments          21600
#> 168 2022-06-01   payments       VAT payments          15400
#> 169 2022-07-01   payments       VAT payments          24200
#> 170 2022-08-01   payments       VAT payments          22300
#> 171 2022-09-01   payments       VAT payments          15100
#> 172 2022-10-01   payments       VAT payments          24700
#> 173 2022-11-01   payments       VAT payments          22700
#> 174 2022-12-01   payments       VAT payments          17000
#> 175 2023-01-01   payments       VAT payments          26500
#> 176 2023-02-01   payments       VAT payments          23200
#> 177 2023-03-01   payments       VAT payments          16500
#> 178 2023-04-01   payments       VAT payments          25200
#> 179 2023-05-01   payments       VAT payments          23900
#> 180 2023-06-01   payments       VAT payments          17100
#> 181 2023-07-01   payments       VAT payments          26800
#> 182 2023-08-01   payments       VAT payments          23700
#> 183 2023-09-01   payments       VAT payments          16600
#> 184 2023-10-01   payments       VAT payments          26700
#> 185 2023-11-01   payments       VAT payments          23900
#> 186 2023-12-01   payments       VAT payments          17300
#> 187 2024-01-01   payments       VAT payments          27700
#> 188 2024-02-01   payments       VAT payments          24600
#> 189 2024-03-01   payments       VAT payments          16900
#> 190 2024-04-01   payments       VAT payments          26000
#> 191 2024-05-01   payments       VAT payments          23700
#> 192 2024-06-01   payments       VAT payments          17300
#> 193 2024-07-01   payments       VAT payments          27500
#> 194 2024-08-01   payments       VAT payments          23700
#> 195 2024-09-01   payments       VAT payments          17100
#> 196 2024-10-01   payments       VAT payments          27300
#> 197 2024-11-01   payments       VAT payments          23900
#> 198 2024-12-01   payments       VAT payments          18200
#> 199 2025-01-01   payments       VAT payments          27500
#> 200 2025-02-01   payments       VAT payments          25600
#> 201 2025-03-01   payments       VAT payments          17400
#> 202 2025-04-01   payments       VAT payments          27300
#> 203 2025-05-01   payments       VAT payments          24600
#> 204 2025-06-01   payments       VAT payments          18100
#> 205 2025-07-01   payments       VAT payments          28300
#> 206 2025-08-01   payments       VAT payments          23900
#> 207 2025-09-01   payments       VAT payments          17800
#> 208 2020-01-01 repayments     VAT repayments          -7460
#> 209 2020-02-01 repayments     VAT repayments          -8270
#> 210 2020-03-01 repayments     VAT repayments          -7430
#> 211 2020-04-01 repayments     VAT repayments          -7430
#> 212 2020-05-01 repayments     VAT repayments          -7720
#> 213 2020-06-01 repayments     VAT repayments          -6290
#> 214 2020-07-01 repayments     VAT repayments          -6910
#> 215 2020-08-01 repayments     VAT repayments          -7200
#> 216 2020-09-01 repayments     VAT repayments          -6990
#> 217 2020-10-01 repayments     VAT repayments          -7260
#> 218 2020-11-01 repayments     VAT repayments          -7870
#> 219 2020-12-01 repayments     VAT repayments          -8490
#> 220 2021-01-01 repayments     VAT repayments          -5850
#> 221 2021-02-01 repayments     VAT repayments          -8600
#> 222 2021-03-01 repayments     VAT repayments          -7820
#> 223 2021-04-01 repayments     VAT repayments          -7210
#> 224 2021-05-01 repayments     VAT repayments          -8420
#> 225 2021-06-01 repayments     VAT repayments          -8440
#> 226 2021-07-01 repayments     VAT repayments          -7530
#> 227 2021-08-01 repayments     VAT repayments          -8320
#> 228 2021-09-01 repayments     VAT repayments          -8210
#> 229 2021-10-01 repayments     VAT repayments          -7530
#> 230 2021-11-01 repayments     VAT repayments          -8500
#> 231 2021-12-01 repayments     VAT repayments          -8580
#> 232 2022-01-01 repayments     VAT repayments          -7030
#> 233 2022-02-01 repayments     VAT repayments          -8380
#> 234 2022-03-01 repayments     VAT repayments          -8150
#> 235 2022-04-01 repayments     VAT repayments          -6820
#> 236 2022-05-01 repayments     VAT repayments         -11400
#> 237 2022-06-01 repayments     VAT repayments          -7940
#> 238 2022-07-01 repayments     VAT repayments          -8140
#> 239 2022-08-01 repayments     VAT repayments         -10500
#> 240 2022-09-01 repayments     VAT repayments          -7570
#> 241 2022-10-01 repayments     VAT repayments          -9010
#> 242 2022-11-01 repayments     VAT repayments          -9650
#> 243 2022-12-01 repayments     VAT repayments          -9100
#> 244 2023-01-01 repayments     VAT repayments          -7820
#> 245 2023-02-01 repayments     VAT repayments         -10000
#> 246 2023-03-01 repayments     VAT repayments          -9080
#> 247 2023-04-01 repayments     VAT repayments          -8280
#> 248 2023-05-01 repayments     VAT repayments         -11000
#> 249 2023-06-01 repayments     VAT repayments          -8580
#> 250 2023-07-01 repayments     VAT repayments          -9060
#> 251 2023-08-01 repayments     VAT repayments          -9290
#> 252 2023-09-01 repayments     VAT repayments          -9930
#> 253 2023-10-01 repayments     VAT repayments          -9140
#> 254 2023-11-01 repayments     VAT repayments         -10400
#> 255 2023-12-01 repayments     VAT repayments          -9050
#> 256 2024-01-01 repayments     VAT repayments          -8670
#> 257 2024-02-01 repayments     VAT repayments         -10000
#> 258 2024-03-01 repayments     VAT repayments          -8360
#> 259 2024-04-01 repayments     VAT repayments          -9240
#> 260 2024-05-01 repayments     VAT repayments         -10900
#> 261 2024-06-01 repayments     VAT repayments          -7890
#> 262 2024-07-01 repayments     VAT repayments          -9690
#> 263 2024-08-01 repayments     VAT repayments         -10300
#> 264 2024-09-01 repayments     VAT repayments          -8680
#> 265 2024-10-01 repayments     VAT repayments          -9360
#> 266 2024-11-01 repayments     VAT repayments          -9470
#> 267 2024-12-01 repayments     VAT repayments         -10300
#> 268 2025-01-01 repayments     VAT repayments          -9010
#> 269 2025-02-01 repayments     VAT repayments         -10200
#> 270 2025-03-01 repayments     VAT repayments          -8460
#> 271 2025-04-01 repayments     VAT repayments          -9100
#> 272 2025-05-01 repayments     VAT repayments         -10600
#> 273 2025-06-01 repayments     VAT repayments          -8910
#> 274 2025-07-01 repayments     VAT repayments          -8620
#> 275 2025-08-01 repayments     VAT repayments         -11500
#> 276 2025-09-01 repayments     VAT repayments          -8580
#> 277 2020-01-01      total Total VAT receipts          14500
#> 278 2020-02-01      total Total VAT receipts          12600
#> 279 2020-03-01      total Total VAT receipts           2110
#> 280 2020-04-01      total Total VAT receipts           -900
#> 281 2020-05-01      total Total VAT receipts           -580
#> 282 2020-06-01      total Total VAT receipts           1080
#> 283 2020-07-01      total Total VAT receipts          10600
#> 284 2020-08-01      total Total VAT receipts          10100
#> 285 2020-09-01      total Total VAT receipts           7800
#> 286 2020-10-01      total Total VAT receipts          13400
#> 287 2020-11-01      total Total VAT receipts          12200
#> 288 2020-12-01      total Total VAT receipts           8540
#> 289 2021-01-01      total Total VAT receipts          15400
#> 290 2021-02-01      total Total VAT receipts          11200
#> 291 2021-03-01      total Total VAT receipts          12900
#> 292 2021-04-01      total Total VAT receipts          14700
#> 293 2021-05-01      total Total VAT receipts          11800
#> 294 2021-06-01      total Total VAT receipts           8660
#> 295 2021-07-01      total Total VAT receipts          17100
#> 296 2021-08-01      total Total VAT receipts          14700
#> 297 2021-09-01      total Total VAT receipts           8330
#> 298 2021-10-01      total Total VAT receipts          17100
#> 299 2021-11-01      total Total VAT receipts          15100
#> 300 2021-12-01      total Total VAT receipts           9160
#> 301 2022-01-01      total Total VAT receipts          18600
#> 302 2022-02-01      total Total VAT receipts          14800
#> 303 2022-03-01      total Total VAT receipts           7510
#> 304 2022-04-01      total Total VAT receipts          17200
#> 305 2022-05-01      total Total VAT receipts          11300
#> 306 2022-06-01      total Total VAT receipts           8590
#> 307 2022-07-01      total Total VAT receipts          17200
#> 308 2022-08-01      total Total VAT receipts          12900
#> 309 2022-09-01      total Total VAT receipts           8630
#> 310 2022-10-01      total Total VAT receipts          16700
#> 311 2022-11-01      total Total VAT receipts          14400
#> 312 2022-12-01      total Total VAT receipts           8990
#> 313 2023-01-01      total Total VAT receipts          19700
#> 314 2023-02-01      total Total VAT receipts          14000
#> 315 2023-03-01      total Total VAT receipts           8460
#> 316 2023-04-01      total Total VAT receipts          17900
#> 317 2023-05-01      total Total VAT receipts          13700
#> 318 2023-06-01      total Total VAT receipts           9320
#> 319 2023-07-01      total Total VAT receipts          18600
#> 320 2023-08-01      total Total VAT receipts          15400
#> 321 2023-09-01      total Total VAT receipts           7510
#> 322 2023-10-01      total Total VAT receipts          18300
#> 323 2023-11-01      total Total VAT receipts          14500
#> 324 2023-12-01      total Total VAT receipts           8990
#> 325 2024-01-01      total Total VAT receipts          19700
#> 326 2024-02-01      total Total VAT receipts          15200
#> 327 2024-03-01      total Total VAT receipts           9170
#> 328 2024-04-01      total Total VAT receipts          17600
#> 329 2024-05-01      total Total VAT receipts          13500
#> 330 2024-06-01      total Total VAT receipts          10400
#> 331 2024-07-01      total Total VAT receipts          18500
#> 332 2024-08-01      total Total VAT receipts          14100
#> 333 2024-09-01      total Total VAT receipts           9150
#> 334 2024-10-01      total Total VAT receipts          18700
#> 335 2024-11-01      total Total VAT receipts          15400
#> 336 2024-12-01      total Total VAT receipts           8610
#> 337 2025-01-01      total Total VAT receipts          19300
#> 338 2025-02-01      total Total VAT receipts          16200
#> 339 2025-03-01      total Total VAT receipts           9590
#> 340 2025-04-01      total Total VAT receipts          19000
#> 341 2025-05-01      total Total VAT receipts          14900
#> 342 2025-06-01      total Total VAT receipts          10000
#> 343 2025-07-01      total Total VAT receipts          20400
#> 344 2025-08-01      total Total VAT receipts          13100
#> 345 2025-09-01      total Total VAT receipts           9920
options(op)
# }
```
