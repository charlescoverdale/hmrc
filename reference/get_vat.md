# Download HMRC VAT receipts

Downloads and tidies the HMRC VAT Annual Statistics bulletin, which
reports monthly VAT receipts broken down into payments, repayments,
import VAT, and home VAT. Monthly data runs from April 1973; the
bulletin is published annually (December).

## Usage

``` r
get_vat(measure = NULL, start = NULL, end = NULL, cache = TRUE)
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

A data frame with columns:

- date:

  `Date`. First day of the reference month.

- measure:

  Character. VAT measure identifier.

- description:

  Character. Plain-English measure label.

- receipts_gbp_m:

  Numeric. Value in millions of pounds. Repayments are negative (money
  flowing out from HMRC to businesses).

## Details

Note that early years (pre-1985) have suppressed payment and repayment
splits; only the total is available for those periods. From January
2021, import VAT collected via postponed VAT accounting is recorded
within payments and repayments rather than the import VAT column.

## See also

Other tax receipts:
[`get_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/get_income_tax_stats.md),
[`get_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/get_tax_receipts.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
# Total VAT receipts since 2010
get_vat(measure = "total", start = "2010-01")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [427ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [721ms]
#> 
#> ℹ Parsing data
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> ✔ Parsing data [79ms]
#> 
#>            date measure        description receipts_gbp_m
#> 2962 2010-01-01   total Total VAT receipts           8230
#> 2963 2010-02-01   total Total VAT receipts           6590
#> 2964 2010-03-01   total Total VAT receipts           4280
#> 2965 2010-04-01   total Total VAT receipts           9470
#> 2966 2010-05-01   total Total VAT receipts           5460
#> 2967 2010-06-01   total Total VAT receipts           4960
#> 2968 2010-07-01   total Total VAT receipts           8450
#> 2969 2010-08-01   total Total VAT receipts           7530
#> 2970 2010-09-01   total Total VAT receipts           4590
#> 2971 2010-10-01   total Total VAT receipts           8690
#> 2972 2010-11-01   total Total VAT receipts           7620
#> 2973 2010-12-01   total Total VAT receipts           5000
#> 2974 2011-01-01   total Total VAT receipts           8800
#> 2975 2011-02-01   total Total VAT receipts           8380
#> 2976 2011-03-01   total Total VAT receipts           4550
#> 2977 2011-04-01   total Total VAT receipts          10600
#> 2978 2011-05-01   total Total VAT receipts           8000
#> 2979 2011-06-01   total Total VAT receipts           5470
#> 2980 2011-07-01   total Total VAT receipts           9960
#> 2981 2011-08-01   total Total VAT receipts           8550
#> 2982 2011-09-01   total Total VAT receipts           5470
#> 2983 2011-10-01   total Total VAT receipts          10600
#> 2984 2011-11-01   total Total VAT receipts           9470
#> 2985 2011-12-01   total Total VAT receipts           5380
#> 2986 2012-01-01   total Total VAT receipts          10300
#> 2987 2012-02-01   total Total VAT receipts           8800
#> 2988 2012-03-01   total Total VAT receipts           5680
#> 2989 2012-04-01   total Total VAT receipts          10200
#> 2990 2012-05-01   total Total VAT receipts           8360
#> 2991 2012-06-01   total Total VAT receipts           5870
#> 2992 2012-07-01   total Total VAT receipts          10100
#> 2993 2012-08-01   total Total VAT receipts           9050
#> 2994 2012-09-01   total Total VAT receipts           5420
#> 2995 2012-10-01   total Total VAT receipts          10200
#> 2996 2012-11-01   total Total VAT receipts           8760
#> 2997 2012-12-01   total Total VAT receipts           5800
#> 2998 2013-01-01   total Total VAT receipts          11200
#> 2999 2013-02-01   total Total VAT receipts           9130
#> 3000 2013-03-01   total Total VAT receipts           6430
#> 3001 2013-04-01   total Total VAT receipts          10200
#> 3002 2013-05-01   total Total VAT receipts           8260
#> 3003 2013-06-01   total Total VAT receipts           6510
#> 3004 2013-07-01   total Total VAT receipts          10200
#> 3005 2013-08-01   total Total VAT receipts           9190
#> 3006 2013-09-01   total Total VAT receipts           6260
#> 3007 2013-10-01   total Total VAT receipts          11500
#> 3008 2013-11-01   total Total VAT receipts           9060
#> 3009 2013-12-01   total Total VAT receipts           5760
#> 3010 2014-01-01   total Total VAT receipts          11100
#> 3011 2014-02-01   total Total VAT receipts          10400
#> 3012 2014-03-01   total Total VAT receipts           6160
#> 3013 2014-04-01   total Total VAT receipts          11200
#> 3014 2014-05-01   total Total VAT receipts           9430
#> 3015 2014-06-01   total Total VAT receipts           6350
#> 3016 2014-07-01   total Total VAT receipts          11100
#> 3017 2014-08-01   total Total VAT receipts           9980
#> 3018 2014-09-01   total Total VAT receipts           5830
#> 3019 2014-10-01   total Total VAT receipts          11200
#> 3020 2014-11-01   total Total VAT receipts           9990
#> 3021 2014-12-01   total Total VAT receipts           6600
#> 3022 2015-01-01   total Total VAT receipts          12200
#> 3023 2015-02-01   total Total VAT receipts          10200
#> 3024 2015-03-01   total Total VAT receipts           7290
#> 3025 2015-04-01   total Total VAT receipts          10900
#> 3026 2015-05-01   total Total VAT receipts           9490
#> 3027 2015-06-01   total Total VAT receipts           6460
#> 3028 2015-07-01   total Total VAT receipts          11500
#> 3029 2015-08-01   total Total VAT receipts          10000
#> 3030 2015-09-01   total Total VAT receipts           6920
#> 3031 2015-10-01   total Total VAT receipts          11900
#> 3032 2015-11-01   total Total VAT receipts          10900
#> 3033 2015-12-01   total Total VAT receipts           6390
#> 3034 2016-01-01   total Total VAT receipts          12500
#> 3035 2016-02-01   total Total VAT receipts          10900
#> 3036 2016-03-01   total Total VAT receipts           7010
#> 3037 2016-04-01   total Total VAT receipts          11100
#> 3038 2016-05-01   total Total VAT receipts          11000
#> 3039 2016-06-01   total Total VAT receipts           6060
#> 3040 2016-07-01   total Total VAT receipts          12200
#> 3041 2016-08-01   total Total VAT receipts          10800
#> 3042 2016-09-01   total Total VAT receipts           6490
#> 3043 2016-10-01   total Total VAT receipts          12300
#> 3044 2016-11-01   total Total VAT receipts          11000
#> 3045 2016-12-01   total Total VAT receipts           7190
#> 3046 2017-01-01   total Total VAT receipts          13300
#> 3047 2017-02-01   total Total VAT receipts          11000
#> 3048 2017-03-01   total Total VAT receipts           7360
#> 3049 2017-04-01   total Total VAT receipts          13200
#> 3050 2017-05-01   total Total VAT receipts          10500
#> 3051 2017-06-01   total Total VAT receipts           6490
#> 3052 2017-07-01   total Total VAT receipts          12700
#> 3053 2017-08-01   total Total VAT receipts          10600
#> 3054 2017-09-01   total Total VAT receipts           7810
#> 3055 2017-10-01   total Total VAT receipts          13200
#> 3056 2017-11-01   total Total VAT receipts          11500
#> 3057 2017-12-01   total Total VAT receipts           7100
#> 3058 2018-01-01   total Total VAT receipts          13900
#> 3059 2018-02-01   total Total VAT receipts          11700
#> 3060 2018-03-01   total Total VAT receipts           7600
#> 3061 2018-04-01   total Total VAT receipts          12600
#> 3062 2018-05-01   total Total VAT receipts          10900
#> 3063 2018-06-01   total Total VAT receipts           7310
#> 3064 2018-07-01   total Total VAT receipts          13800
#> 3065 2018-08-01   total Total VAT receipts          11400
#> 3066 2018-09-01   total Total VAT receipts           8270
#> 3067 2018-10-01   total Total VAT receipts          13200
#> 3068 2018-11-01   total Total VAT receipts          12000
#> 3069 2018-12-01   total Total VAT receipts           7670
#> 3070 2019-01-01   total Total VAT receipts          13700
#> 3071 2019-02-01   total Total VAT receipts          13400
#> 3072 2019-03-01   total Total VAT receipts           8300
#> 3073 2019-04-01   total Total VAT receipts          13000
#> 3074 2019-05-01   total Total VAT receipts          11000
#> 3075 2019-06-01   total Total VAT receipts           8120
#> 3076 2019-07-01   total Total VAT receipts          13600
#> 3077 2019-08-01   total Total VAT receipts          12400
#> 3078 2019-09-01   total Total VAT receipts           8250
#> 3079 2019-10-01   total Total VAT receipts          13600
#> 3080 2019-11-01   total Total VAT receipts          13000
#> 3081 2019-12-01   total Total VAT receipts           7620
#> 3082 2020-01-01   total Total VAT receipts          14500
#> 3083 2020-02-01   total Total VAT receipts          12600
#> 3084 2020-03-01   total Total VAT receipts           2110
#> 3085 2020-04-01   total Total VAT receipts           -900
#> 3086 2020-05-01   total Total VAT receipts           -580
#> 3087 2020-06-01   total Total VAT receipts           1080
#> 3088 2020-07-01   total Total VAT receipts          10600
#> 3089 2020-08-01   total Total VAT receipts          10100
#> 3090 2020-09-01   total Total VAT receipts           7800
#> 3091 2020-10-01   total Total VAT receipts          13400
#> 3092 2020-11-01   total Total VAT receipts          12200
#> 3093 2020-12-01   total Total VAT receipts           8540
#> 3094 2021-01-01   total Total VAT receipts          15400
#> 3095 2021-02-01   total Total VAT receipts          11200
#> 3096 2021-03-01   total Total VAT receipts          12900
#> 3097 2021-04-01   total Total VAT receipts          14700
#> 3098 2021-05-01   total Total VAT receipts          11800
#> 3099 2021-06-01   total Total VAT receipts           8660
#> 3100 2021-07-01   total Total VAT receipts          17100
#> 3101 2021-08-01   total Total VAT receipts          14700
#> 3102 2021-09-01   total Total VAT receipts           8330
#> 3103 2021-10-01   total Total VAT receipts          17100
#> 3104 2021-11-01   total Total VAT receipts          15100
#> 3105 2021-12-01   total Total VAT receipts           9160
#> 3106 2022-01-01   total Total VAT receipts          18600
#> 3107 2022-02-01   total Total VAT receipts          14800
#> 3108 2022-03-01   total Total VAT receipts           7510
#> 3109 2022-04-01   total Total VAT receipts          17200
#> 3110 2022-05-01   total Total VAT receipts          11300
#> 3111 2022-06-01   total Total VAT receipts           8590
#> 3112 2022-07-01   total Total VAT receipts          17200
#> 3113 2022-08-01   total Total VAT receipts          12900
#> 3114 2022-09-01   total Total VAT receipts           8630
#> 3115 2022-10-01   total Total VAT receipts          16700
#> 3116 2022-11-01   total Total VAT receipts          14400
#> 3117 2022-12-01   total Total VAT receipts           8990
#> 3118 2023-01-01   total Total VAT receipts          19700
#> 3119 2023-02-01   total Total VAT receipts          14000
#> 3120 2023-03-01   total Total VAT receipts           8460
#> 3121 2023-04-01   total Total VAT receipts          17900
#> 3122 2023-05-01   total Total VAT receipts          13700
#> 3123 2023-06-01   total Total VAT receipts           9320
#> 3124 2023-07-01   total Total VAT receipts          18600
#> 3125 2023-08-01   total Total VAT receipts          15400
#> 3126 2023-09-01   total Total VAT receipts           7510
#> 3127 2023-10-01   total Total VAT receipts          18300
#> 3128 2023-11-01   total Total VAT receipts          14500
#> 3129 2023-12-01   total Total VAT receipts           8990
#> 3130 2024-01-01   total Total VAT receipts          19700
#> 3131 2024-02-01   total Total VAT receipts          15200
#> 3132 2024-03-01   total Total VAT receipts           9170
#> 3133 2024-04-01   total Total VAT receipts          17600
#> 3134 2024-05-01   total Total VAT receipts          13500
#> 3135 2024-06-01   total Total VAT receipts          10400
#> 3136 2024-07-01   total Total VAT receipts          18500
#> 3137 2024-08-01   total Total VAT receipts          14100
#> 3138 2024-09-01   total Total VAT receipts           9150
#> 3139 2024-10-01   total Total VAT receipts          18700
#> 3140 2024-11-01   total Total VAT receipts          15400
#> 3141 2024-12-01   total Total VAT receipts           8610
#> 3142 2025-01-01   total Total VAT receipts          19300
#> 3143 2025-02-01   total Total VAT receipts          16200
#> 3144 2025-03-01   total Total VAT receipts           9590
#> 3145 2025-04-01   total Total VAT receipts          19000
#> 3146 2025-05-01   total Total VAT receipts          14900
#> 3147 2025-06-01   total Total VAT receipts          10000
#> 3148 2025-07-01   total Total VAT receipts          20400
#> 3149 2025-08-01   total Total VAT receipts          13100
#> 3150 2025-09-01   total Total VAT receipts           9920

# Full breakdown
get_vat(start = "2020-01")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [11ms]
#> 
#> ℹ Using cached file
#> ✔ Using cached file [4ms]
#> 
#> ℹ Parsing data
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> ✔ Parsing data [79ms]
#> 
#>            date    measure        description receipts_gbp_m
#> 562  2020-01-01   home_vat           Home VAT          12000
#> 563  2020-02-01   home_vat           Home VAT           9900
#> 564  2020-03-01   home_vat           Home VAT           -190
#> 565  2020-04-01   home_vat           Home VAT          -2870
#> 566  2020-05-01   home_vat           Home VAT          -2360
#> 567  2020-06-01   home_vat           Home VAT           -770
#> 568  2020-07-01   home_vat           Home VAT           8060
#> 569  2020-08-01   home_vat           Home VAT           7440
#> 570  2020-09-01   home_vat           Home VAT           5250
#> 571  2020-10-01   home_vat           Home VAT          10600
#> 572  2020-11-01   home_vat           Home VAT           9040
#> 573  2020-12-01   home_vat           Home VAT           5560
#> 574  2021-01-01   home_vat           Home VAT          12700
#> 575  2021-02-01   home_vat           Home VAT           9580
#> 576  2021-03-01   home_vat           Home VAT          11100
#> 577  2021-04-01   home_vat           Home VAT          12800
#> 578  2021-05-01   home_vat           Home VAT          10400
#> 579  2021-06-01   home_vat           Home VAT           7260
#> 580  2021-07-01   home_vat           Home VAT          15700
#> 581  2021-08-01   home_vat           Home VAT          13400
#> 582  2021-09-01   home_vat           Home VAT           6950
#> 583  2021-10-01   home_vat           Home VAT          15800
#> 584  2021-11-01   home_vat           Home VAT          13800
#> 585  2021-12-01   home_vat           Home VAT           7840
#> 586  2022-01-01   home_vat           Home VAT          17400
#> 587  2022-02-01   home_vat           Home VAT          13600
#> 588  2022-03-01   home_vat           Home VAT           6450
#> 589  2022-04-01   home_vat           Home VAT          16000
#> 590  2022-05-01   home_vat           Home VAT          10300
#> 591  2022-06-01   home_vat           Home VAT           7450
#> 592  2022-07-01   home_vat           Home VAT          16100
#> 593  2022-08-01   home_vat           Home VAT          11700
#> 594  2022-09-01   home_vat           Home VAT           7500
#> 595  2022-10-01   home_vat           Home VAT          15600
#> 596  2022-11-01   home_vat           Home VAT          13100
#> 597  2022-12-01   home_vat           Home VAT           7910
#> 598  2023-01-01   home_vat           Home VAT          18700
#> 599  2023-02-01   home_vat           Home VAT          13200
#> 600  2023-03-01   home_vat           Home VAT           7450
#> 601  2023-04-01   home_vat           Home VAT          17000
#> 602  2023-05-01   home_vat           Home VAT          12900
#> 603  2023-06-01   home_vat           Home VAT           8470
#> 604  2023-07-01   home_vat           Home VAT          17700
#> 605  2023-08-01   home_vat           Home VAT          14400
#> 606  2023-09-01   home_vat           Home VAT           6720
#> 607  2023-10-01   home_vat           Home VAT          17500
#> 608  2023-11-01   home_vat           Home VAT          13500
#> 609  2023-12-01   home_vat           Home VAT           8200
#> 610  2024-01-01   home_vat           Home VAT          19000
#> 611  2024-02-01   home_vat           Home VAT          14600
#> 612  2024-03-01   home_vat           Home VAT           8500
#> 613  2024-04-01   home_vat           Home VAT          16700
#> 614  2024-05-01   home_vat           Home VAT          12800
#> 615  2024-06-01   home_vat           Home VAT           9380
#> 616  2024-07-01   home_vat           Home VAT          17800
#> 617  2024-08-01   home_vat           Home VAT          13400
#> 618  2024-09-01   home_vat           Home VAT           8440
#> 619  2024-10-01   home_vat           Home VAT          18000
#> 620  2024-11-01   home_vat           Home VAT          14500
#> 621  2024-12-01   home_vat           Home VAT           7910
#> 622  2025-01-01   home_vat           Home VAT          18500
#> 623  2025-02-01   home_vat           Home VAT          15400
#> 624  2025-03-01   home_vat           Home VAT           8950
#> 625  2025-04-01   home_vat           Home VAT          18100
#> 626  2025-05-01   home_vat           Home VAT          14000
#> 627  2025-06-01   home_vat           Home VAT           9200
#> 628  2025-07-01   home_vat           Home VAT          19700
#> 629  2025-08-01   home_vat           Home VAT          12400
#> 630  2025-09-01   home_vat           Home VAT           9200
#> 1192 2020-01-01 import_vat         Import VAT           2470
#> 1193 2020-02-01 import_vat         Import VAT           2690
#> 1194 2020-03-01 import_vat         Import VAT           2290
#> 1195 2020-04-01 import_vat         Import VAT           1970
#> 1196 2020-05-01 import_vat         Import VAT           1780
#> 1197 2020-06-01 import_vat         Import VAT           1850
#> 1198 2020-07-01 import_vat         Import VAT           2520
#> 1199 2020-08-01 import_vat         Import VAT           2630
#> 1200 2020-09-01 import_vat         Import VAT           2550
#> 1201 2020-10-01 import_vat         Import VAT           2810
#> 1202 2020-11-01 import_vat         Import VAT           3180
#> 1203 2020-12-01 import_vat         Import VAT           2980
#> 1204 2021-01-01 import_vat         Import VAT           2670
#> 1205 2021-02-01 import_vat         Import VAT           1600
#> 1206 2021-03-01 import_vat         Import VAT           1710
#> 1207 2021-04-01 import_vat         Import VAT           1890
#> 1208 2021-05-01 import_vat         Import VAT           1420
#> 1209 2021-06-01 import_vat         Import VAT           1390
#> 1210 2021-07-01 import_vat         Import VAT           1400
#> 1211 2021-08-01 import_vat         Import VAT           1350
#> 1212 2021-09-01 import_vat         Import VAT           1370
#> 1213 2021-10-01 import_vat         Import VAT           1360
#> 1214 2021-11-01 import_vat         Import VAT           1260
#> 1215 2021-12-01 import_vat         Import VAT           1320
#> 1216 2022-01-01 import_vat         Import VAT           1180
#> 1217 2022-02-01 import_vat         Import VAT           1160
#> 1218 2022-03-01 import_vat         Import VAT           1060
#> 1219 2022-04-01 import_vat         Import VAT           1200
#> 1220 2022-05-01 import_vat         Import VAT           1040
#> 1221 2022-06-01 import_vat         Import VAT           1130
#> 1222 2022-07-01 import_vat         Import VAT           1140
#> 1223 2022-08-01 import_vat         Import VAT           1110
#> 1224 2022-09-01 import_vat         Import VAT           1130
#> 1225 2022-10-01 import_vat         Import VAT           1080
#> 1226 2022-11-01 import_vat         Import VAT           1280
#> 1227 2022-12-01 import_vat         Import VAT           1080
#> 1228 2023-01-01 import_vat         Import VAT            980
#> 1229 2023-02-01 import_vat         Import VAT            860
#> 1230 2023-03-01 import_vat         Import VAT           1010
#> 1231 2023-04-01 import_vat         Import VAT            990
#> 1232 2023-05-01 import_vat         Import VAT            810
#> 1233 2023-06-01 import_vat         Import VAT            850
#> 1234 2023-07-01 import_vat         Import VAT            860
#> 1235 2023-08-01 import_vat         Import VAT           1010
#> 1236 2023-09-01 import_vat         Import VAT            800
#> 1237 2023-10-01 import_vat         Import VAT            810
#> 1238 2023-11-01 import_vat         Import VAT            950
#> 1239 2023-12-01 import_vat         Import VAT            790
#> 1240 2024-01-01 import_vat         Import VAT            700
#> 1241 2024-02-01 import_vat         Import VAT            670
#> 1242 2024-03-01 import_vat         Import VAT            670
#> 1243 2024-04-01 import_vat         Import VAT            870
#> 1244 2024-05-01 import_vat         Import VAT            700
#> 1245 2024-06-01 import_vat         Import VAT            980
#> 1246 2024-07-01 import_vat         Import VAT            730
#> 1247 2024-08-01 import_vat         Import VAT            740
#> 1248 2024-09-01 import_vat         Import VAT            700
#> 1249 2024-10-01 import_vat         Import VAT            690
#> 1250 2024-11-01 import_vat         Import VAT            930
#> 1251 2024-12-01 import_vat         Import VAT            700
#> 1252 2025-01-01 import_vat         Import VAT            830
#> 1253 2025-02-01 import_vat         Import VAT            730
#> 1254 2025-03-01 import_vat         Import VAT            630
#> 1255 2025-04-01 import_vat         Import VAT            830
#> 1256 2025-05-01 import_vat         Import VAT            910
#> 1257 2025-06-01 import_vat         Import VAT            800
#> 1258 2025-07-01 import_vat         Import VAT            680
#> 1259 2025-08-01 import_vat         Import VAT            700
#> 1260 2025-09-01 import_vat         Import VAT            730
#> 1822 2020-01-01   payments       VAT payments          19500
#> 1823 2020-02-01   payments       VAT payments          18200
#> 1824 2020-03-01   payments       VAT payments           7250
#> 1825 2020-04-01   payments       VAT payments           4560
#> 1826 2020-05-01   payments       VAT payments           5350
#> 1827 2020-06-01   payments       VAT payments           5520
#> 1828 2020-07-01   payments       VAT payments          15000
#> 1829 2020-08-01   payments       VAT payments          14600
#> 1830 2020-09-01   payments       VAT payments          12200
#> 1831 2020-10-01   payments       VAT payments          17900
#> 1832 2020-11-01   payments       VAT payments          16900
#> 1833 2020-12-01   payments       VAT payments          14000
#> 1834 2021-01-01   payments       VAT payments          18600
#> 1835 2021-02-01   payments       VAT payments          18200
#> 1836 2021-03-01   payments       VAT payments          19000
#> 1837 2021-04-01   payments       VAT payments          20000
#> 1838 2021-05-01   payments       VAT payments          18800
#> 1839 2021-06-01   payments       VAT payments          15700
#> 1840 2021-07-01   payments       VAT payments          23200
#> 1841 2021-08-01   payments       VAT payments          21700
#> 1842 2021-09-01   payments       VAT payments          15200
#> 1843 2021-10-01   payments       VAT payments          23300
#> 1844 2021-11-01   payments       VAT payments          22300
#> 1845 2021-12-01   payments       VAT payments          16400
#> 1846 2022-01-01   payments       VAT payments          24400
#> 1847 2022-02-01   payments       VAT payments          22000
#> 1848 2022-03-01   payments       VAT payments          14600
#> 1849 2022-04-01   payments       VAT payments          22800
#> 1850 2022-05-01   payments       VAT payments          21600
#> 1851 2022-06-01   payments       VAT payments          15400
#> 1852 2022-07-01   payments       VAT payments          24200
#> 1853 2022-08-01   payments       VAT payments          22300
#> 1854 2022-09-01   payments       VAT payments          15100
#> 1855 2022-10-01   payments       VAT payments          24700
#> 1856 2022-11-01   payments       VAT payments          22700
#> 1857 2022-12-01   payments       VAT payments          17000
#> 1858 2023-01-01   payments       VAT payments          26500
#> 1859 2023-02-01   payments       VAT payments          23200
#> 1860 2023-03-01   payments       VAT payments          16500
#> 1861 2023-04-01   payments       VAT payments          25200
#> 1862 2023-05-01   payments       VAT payments          23900
#> 1863 2023-06-01   payments       VAT payments          17100
#> 1864 2023-07-01   payments       VAT payments          26800
#> 1865 2023-08-01   payments       VAT payments          23700
#> 1866 2023-09-01   payments       VAT payments          16600
#> 1867 2023-10-01   payments       VAT payments          26700
#> 1868 2023-11-01   payments       VAT payments          23900
#> 1869 2023-12-01   payments       VAT payments          17300
#> 1870 2024-01-01   payments       VAT payments          27700
#> 1871 2024-02-01   payments       VAT payments          24600
#> 1872 2024-03-01   payments       VAT payments          16900
#> 1873 2024-04-01   payments       VAT payments          26000
#> 1874 2024-05-01   payments       VAT payments          23700
#> 1875 2024-06-01   payments       VAT payments          17300
#> 1876 2024-07-01   payments       VAT payments          27500
#> 1877 2024-08-01   payments       VAT payments          23700
#> 1878 2024-09-01   payments       VAT payments          17100
#> 1879 2024-10-01   payments       VAT payments          27300
#> 1880 2024-11-01   payments       VAT payments          23900
#> 1881 2024-12-01   payments       VAT payments          18200
#> 1882 2025-01-01   payments       VAT payments          27500
#> 1883 2025-02-01   payments       VAT payments          25600
#> 1884 2025-03-01   payments       VAT payments          17400
#> 1885 2025-04-01   payments       VAT payments          27300
#> 1886 2025-05-01   payments       VAT payments          24600
#> 1887 2025-06-01   payments       VAT payments          18100
#> 1888 2025-07-01   payments       VAT payments          28300
#> 1889 2025-08-01   payments       VAT payments          23900
#> 1890 2025-09-01   payments       VAT payments          17800
#> 2452 2020-01-01 repayments     VAT repayments          -7460
#> 2453 2020-02-01 repayments     VAT repayments          -8270
#> 2454 2020-03-01 repayments     VAT repayments          -7430
#> 2455 2020-04-01 repayments     VAT repayments          -7430
#> 2456 2020-05-01 repayments     VAT repayments          -7720
#> 2457 2020-06-01 repayments     VAT repayments          -6290
#> 2458 2020-07-01 repayments     VAT repayments          -6910
#> 2459 2020-08-01 repayments     VAT repayments          -7200
#> 2460 2020-09-01 repayments     VAT repayments          -6990
#> 2461 2020-10-01 repayments     VAT repayments          -7260
#> 2462 2020-11-01 repayments     VAT repayments          -7870
#> 2463 2020-12-01 repayments     VAT repayments          -8490
#> 2464 2021-01-01 repayments     VAT repayments          -5850
#> 2465 2021-02-01 repayments     VAT repayments          -8600
#> 2466 2021-03-01 repayments     VAT repayments          -7820
#> 2467 2021-04-01 repayments     VAT repayments          -7210
#> 2468 2021-05-01 repayments     VAT repayments          -8420
#> 2469 2021-06-01 repayments     VAT repayments          -8440
#> 2470 2021-07-01 repayments     VAT repayments          -7530
#> 2471 2021-08-01 repayments     VAT repayments          -8320
#> 2472 2021-09-01 repayments     VAT repayments          -8210
#> 2473 2021-10-01 repayments     VAT repayments          -7530
#> 2474 2021-11-01 repayments     VAT repayments          -8500
#> 2475 2021-12-01 repayments     VAT repayments          -8580
#> 2476 2022-01-01 repayments     VAT repayments          -7030
#> 2477 2022-02-01 repayments     VAT repayments          -8380
#> 2478 2022-03-01 repayments     VAT repayments          -8150
#> 2479 2022-04-01 repayments     VAT repayments          -6820
#> 2480 2022-05-01 repayments     VAT repayments         -11400
#> 2481 2022-06-01 repayments     VAT repayments          -7940
#> 2482 2022-07-01 repayments     VAT repayments          -8140
#> 2483 2022-08-01 repayments     VAT repayments         -10500
#> 2484 2022-09-01 repayments     VAT repayments          -7570
#> 2485 2022-10-01 repayments     VAT repayments          -9010
#> 2486 2022-11-01 repayments     VAT repayments          -9650
#> 2487 2022-12-01 repayments     VAT repayments          -9100
#> 2488 2023-01-01 repayments     VAT repayments          -7820
#> 2489 2023-02-01 repayments     VAT repayments         -10000
#> 2490 2023-03-01 repayments     VAT repayments          -9080
#> 2491 2023-04-01 repayments     VAT repayments          -8280
#> 2492 2023-05-01 repayments     VAT repayments         -11000
#> 2493 2023-06-01 repayments     VAT repayments          -8580
#> 2494 2023-07-01 repayments     VAT repayments          -9060
#> 2495 2023-08-01 repayments     VAT repayments          -9290
#> 2496 2023-09-01 repayments     VAT repayments          -9930
#> 2497 2023-10-01 repayments     VAT repayments          -9140
#> 2498 2023-11-01 repayments     VAT repayments         -10400
#> 2499 2023-12-01 repayments     VAT repayments          -9050
#> 2500 2024-01-01 repayments     VAT repayments          -8670
#> 2501 2024-02-01 repayments     VAT repayments         -10000
#> 2502 2024-03-01 repayments     VAT repayments          -8360
#> 2503 2024-04-01 repayments     VAT repayments          -9240
#> 2504 2024-05-01 repayments     VAT repayments         -10900
#> 2505 2024-06-01 repayments     VAT repayments          -7890
#> 2506 2024-07-01 repayments     VAT repayments          -9690
#> 2507 2024-08-01 repayments     VAT repayments         -10300
#> 2508 2024-09-01 repayments     VAT repayments          -8680
#> 2509 2024-10-01 repayments     VAT repayments          -9360
#> 2510 2024-11-01 repayments     VAT repayments          -9470
#> 2511 2024-12-01 repayments     VAT repayments         -10300
#> 2512 2025-01-01 repayments     VAT repayments          -9010
#> 2513 2025-02-01 repayments     VAT repayments         -10200
#> 2514 2025-03-01 repayments     VAT repayments          -8460
#> 2515 2025-04-01 repayments     VAT repayments          -9100
#> 2516 2025-05-01 repayments     VAT repayments         -10600
#> 2517 2025-06-01 repayments     VAT repayments          -8910
#> 2518 2025-07-01 repayments     VAT repayments          -8620
#> 2519 2025-08-01 repayments     VAT repayments         -11500
#> 2520 2025-09-01 repayments     VAT repayments          -8580
#> 3082 2020-01-01      total Total VAT receipts          14500
#> 3083 2020-02-01      total Total VAT receipts          12600
#> 3084 2020-03-01      total Total VAT receipts           2110
#> 3085 2020-04-01      total Total VAT receipts           -900
#> 3086 2020-05-01      total Total VAT receipts           -580
#> 3087 2020-06-01      total Total VAT receipts           1080
#> 3088 2020-07-01      total Total VAT receipts          10600
#> 3089 2020-08-01      total Total VAT receipts          10100
#> 3090 2020-09-01      total Total VAT receipts           7800
#> 3091 2020-10-01      total Total VAT receipts          13400
#> 3092 2020-11-01      total Total VAT receipts          12200
#> 3093 2020-12-01      total Total VAT receipts           8540
#> 3094 2021-01-01      total Total VAT receipts          15400
#> 3095 2021-02-01      total Total VAT receipts          11200
#> 3096 2021-03-01      total Total VAT receipts          12900
#> 3097 2021-04-01      total Total VAT receipts          14700
#> 3098 2021-05-01      total Total VAT receipts          11800
#> 3099 2021-06-01      total Total VAT receipts           8660
#> 3100 2021-07-01      total Total VAT receipts          17100
#> 3101 2021-08-01      total Total VAT receipts          14700
#> 3102 2021-09-01      total Total VAT receipts           8330
#> 3103 2021-10-01      total Total VAT receipts          17100
#> 3104 2021-11-01      total Total VAT receipts          15100
#> 3105 2021-12-01      total Total VAT receipts           9160
#> 3106 2022-01-01      total Total VAT receipts          18600
#> 3107 2022-02-01      total Total VAT receipts          14800
#> 3108 2022-03-01      total Total VAT receipts           7510
#> 3109 2022-04-01      total Total VAT receipts          17200
#> 3110 2022-05-01      total Total VAT receipts          11300
#> 3111 2022-06-01      total Total VAT receipts           8590
#> 3112 2022-07-01      total Total VAT receipts          17200
#> 3113 2022-08-01      total Total VAT receipts          12900
#> 3114 2022-09-01      total Total VAT receipts           8630
#> 3115 2022-10-01      total Total VAT receipts          16700
#> 3116 2022-11-01      total Total VAT receipts          14400
#> 3117 2022-12-01      total Total VAT receipts           8990
#> 3118 2023-01-01      total Total VAT receipts          19700
#> 3119 2023-02-01      total Total VAT receipts          14000
#> 3120 2023-03-01      total Total VAT receipts           8460
#> 3121 2023-04-01      total Total VAT receipts          17900
#> 3122 2023-05-01      total Total VAT receipts          13700
#> 3123 2023-06-01      total Total VAT receipts           9320
#> 3124 2023-07-01      total Total VAT receipts          18600
#> 3125 2023-08-01      total Total VAT receipts          15400
#> 3126 2023-09-01      total Total VAT receipts           7510
#> 3127 2023-10-01      total Total VAT receipts          18300
#> 3128 2023-11-01      total Total VAT receipts          14500
#> 3129 2023-12-01      total Total VAT receipts           8990
#> 3130 2024-01-01      total Total VAT receipts          19700
#> 3131 2024-02-01      total Total VAT receipts          15200
#> 3132 2024-03-01      total Total VAT receipts           9170
#> 3133 2024-04-01      total Total VAT receipts          17600
#> 3134 2024-05-01      total Total VAT receipts          13500
#> 3135 2024-06-01      total Total VAT receipts          10400
#> 3136 2024-07-01      total Total VAT receipts          18500
#> 3137 2024-08-01      total Total VAT receipts          14100
#> 3138 2024-09-01      total Total VAT receipts           9150
#> 3139 2024-10-01      total Total VAT receipts          18700
#> 3140 2024-11-01      total Total VAT receipts          15400
#> 3141 2024-12-01      total Total VAT receipts           8610
#> 3142 2025-01-01      total Total VAT receipts          19300
#> 3143 2025-02-01      total Total VAT receipts          16200
#> 3144 2025-03-01      total Total VAT receipts           9590
#> 3145 2025-04-01      total Total VAT receipts          19000
#> 3146 2025-05-01      total Total VAT receipts          14900
#> 3147 2025-06-01      total Total VAT receipts          10000
#> 3148 2025-07-01      total Total VAT receipts          20400
#> 3149 2025-08-01      total Total VAT receipts          13100
#> 3150 2025-09-01      total Total VAT receipts           9920
options(op)
# }
```
