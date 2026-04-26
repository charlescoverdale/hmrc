# Download HMRC tobacco duty receipts

Downloads and tidies the HMRC Tobacco Bulletin, which reports monthly
tobacco products duty receipts by product type. Data runs from January
1991 to the most recent published month, updated twice per year
(February and August).

## Usage

``` r
hmrc_tobacco_duties(product = NULL, start = NULL, end = NULL, cache = TRUE)
```

## Source

<https://www.gov.uk/government/statistics/tobacco-bulletin>

## Arguments

- product:

  Character vector or `NULL` (default = all products). Valid values:
  `"cigarettes"`, `"cigars"`, `"hand_rolling"`, `"other"`, `"total"`.

- start:

  Character `"YYYY-MM"` or a `Date` object.

- end:

  Character `"YYYY-MM"` or a `Date` object.

- cache:

  Logical. Use cached file if available (default `TRUE`).

## Value

An `hmrc_tbl` with columns `date`, `product`, `description`,
`receipts_gbp_m`.

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
[`hmrc_vat()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_vat.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
hmrc_tobacco_duties(start = "2015-01")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [539ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [24ms]
#> 
#> ℹ Parsing data
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> ✔ Parsing data [216ms]
#> 
#> # Tobacco Bulletin
#> # Source: https://www.gov.uk/government/statistics/tobacco-bulletin
#> # Fetched 2026-04-26 13:02:09 UTC | Vintage: latest | Cells: cash | Freq: monthly | 665 rows x 4 cols
#> 
#>           date      product            description receipts_gbp_m
#> 1   2015-01-01   cigarettes             Cigarettes    862.0656853
#> 2   2015-02-01   cigarettes             Cigarettes    521.4350242
#> 3   2015-03-01   cigarettes             Cigarettes    666.1018111
#> 4   2015-04-01   cigarettes             Cigarettes   1261.4286049
#> 5   2015-05-01   cigarettes             Cigarettes    203.5007113
#> 6   2015-06-01   cigarettes             Cigarettes    491.9633763
#> 7   2015-07-01   cigarettes             Cigarettes    660.0018586
#> 8   2015-08-01   cigarettes             Cigarettes   1072.3722080
#> 9   2015-09-01   cigarettes             Cigarettes    400.8425784
#> 10  2015-10-01   cigarettes             Cigarettes    740.5639497
#> 11  2015-11-01   cigarettes             Cigarettes    738.9549925
#> 12  2015-12-01   cigarettes             Cigarettes    412.6559766
#> 13  2016-01-01   cigarettes             Cigarettes    783.0978989
#> 14  2016-02-01   cigarettes             Cigarettes    548.1948031
#> 15  2016-03-01   cigarettes             Cigarettes    919.0399674
#> 16  2016-04-01   cigarettes             Cigarettes    892.6538058
#> 17  2016-05-01   cigarettes             Cigarettes    233.3492436
#> 18  2016-06-01   cigarettes             Cigarettes    537.7789601
#> 19  2016-07-01   cigarettes             Cigarettes    623.0975222
#> 20  2016-08-01   cigarettes             Cigarettes    654.3711575
#> 21  2016-09-01   cigarettes             Cigarettes    721.3981539
#> 22  2016-10-01   cigarettes             Cigarettes    727.3861262
#> 23  2016-11-01   cigarettes             Cigarettes    623.8627261
#> 24  2016-12-01   cigarettes             Cigarettes    529.3115238
#> 25  2017-01-01   cigarettes             Cigarettes    764.2924688
#> 26  2017-02-01   cigarettes             Cigarettes    617.3951252
#> 27  2017-03-01   cigarettes             Cigarettes    659.8317612
#> 28  2017-04-01   cigarettes             Cigarettes    696.2788547
#> 29  2017-05-01   cigarettes             Cigarettes    413.2920131
#> 30  2017-06-01   cigarettes             Cigarettes    639.4464948
#> 31  2017-07-01   cigarettes             Cigarettes    687.7692975
#> 32  2017-08-01   cigarettes             Cigarettes    637.0783845
#> 33  2017-09-01   cigarettes             Cigarettes    722.3959343
#> 34  2017-10-01   cigarettes             Cigarettes    632.8147165
#> 35  2017-11-01   cigarettes             Cigarettes    538.1104826
#> 36  2017-12-01   cigarettes             Cigarettes    997.9195567
#> 37  2018-01-01   cigarettes             Cigarettes    453.3192877
#> 38  2018-02-01   cigarettes             Cigarettes    434.3157435
#> 39  2018-03-01   cigarettes             Cigarettes    566.2666363
#> 40  2018-04-01   cigarettes             Cigarettes    652.0927709
#> 41  2018-05-01   cigarettes             Cigarettes    848.1127845
#> 42  2018-06-01   cigarettes             Cigarettes    519.6370747
#> 43  2018-07-01   cigarettes             Cigarettes    671.7128750
#> 44  2018-08-01   cigarettes             Cigarettes    612.6141810
#> 45  2018-09-01   cigarettes             Cigarettes    772.4159656
#> 46  2018-10-01   cigarettes             Cigarettes    591.7767336
#> 47  2018-11-01   cigarettes             Cigarettes    990.7640516
#> 48  2018-12-01   cigarettes             Cigarettes    226.4380604
#> 49  2019-01-01   cigarettes             Cigarettes    578.8838797
#> 50  2019-02-01   cigarettes             Cigarettes    533.7900804
#> 51  2019-03-01   cigarettes             Cigarettes    749.5968509
#> 52  2019-04-01   cigarettes             Cigarettes    511.5866120
#> 53  2019-05-01   cigarettes             Cigarettes    522.7324652
#> 54  2019-06-01   cigarettes             Cigarettes    626.7823225
#> 55  2019-07-01   cigarettes             Cigarettes    598.6973317
#> 56  2019-08-01   cigarettes             Cigarettes    717.2491691
#> 57  2019-09-01   cigarettes             Cigarettes    767.2179633
#> 58  2019-10-01   cigarettes             Cigarettes    540.5267096
#> 59  2019-11-01   cigarettes             Cigarettes    504.9899030
#> 60  2019-12-01   cigarettes             Cigarettes    470.9444060
#> 61  2020-01-01   cigarettes             Cigarettes    867.9977522
#> 62  2020-02-01   cigarettes             Cigarettes    378.7787325
#> 63  2020-03-01   cigarettes             Cigarettes    643.0246358
#> 64  2020-04-01   cigarettes             Cigarettes   1228.3023259
#> 65  2020-05-01   cigarettes             Cigarettes    182.6173742
#> 66  2020-06-01   cigarettes             Cigarettes    385.5083757
#> 67  2020-07-01   cigarettes             Cigarettes    657.4709098
#> 68  2020-08-01   cigarettes             Cigarettes    680.0859550
#> 69  2020-09-01   cigarettes             Cigarettes    825.4272529
#> 70  2020-10-01   cigarettes             Cigarettes    634.4134470
#> 71  2020-11-01   cigarettes             Cigarettes    667.6239778
#> 72  2020-12-01   cigarettes             Cigarettes    516.6930184
#> 73  2021-01-01   cigarettes             Cigarettes    759.4978606
#> 74  2021-02-01   cigarettes             Cigarettes    436.2116186
#> 75  2021-03-01   cigarettes             Cigarettes    644.0407626
#> 76  2021-04-01   cigarettes             Cigarettes    961.4629177
#> 77  2021-05-01   cigarettes             Cigarettes    363.5162003
#> 78  2021-06-01   cigarettes             Cigarettes    466.7398800
#> 79  2021-07-01   cigarettes             Cigarettes    902.3972769
#> 80  2021-08-01   cigarettes             Cigarettes    550.2134326
#> 81  2021-09-01   cigarettes             Cigarettes    916.2310273
#> 82  2021-10-01   cigarettes             Cigarettes    560.6371702
#> 83  2021-11-01   cigarettes             Cigarettes    676.4296053
#> 84  2021-12-01   cigarettes             Cigarettes    544.2145185
#> 85  2022-01-01   cigarettes             Cigarettes    670.5757539
#> 86  2022-02-01   cigarettes             Cigarettes    508.1704671
#> 87  2022-03-01   cigarettes             Cigarettes    583.0199101
#> 88  2022-04-01   cigarettes             Cigarettes   1060.7363518
#> 89  2022-05-01   cigarettes             Cigarettes    420.4670914
#> 90  2022-06-01   cigarettes             Cigarettes    477.2244988
#> 91  2022-07-01   cigarettes             Cigarettes    675.1078061
#> 92  2022-08-01   cigarettes             Cigarettes    590.6756335
#> 93  2022-09-01   cigarettes             Cigarettes    945.3381168
#> 94  2022-10-01   cigarettes             Cigarettes    490.0963599
#> 95  2022-11-01   cigarettes             Cigarettes    544.7927600
#> 96  2022-12-01   cigarettes             Cigarettes    769.0116667
#> 97  2023-01-01   cigarettes             Cigarettes    556.9705659
#> 98  2023-02-01   cigarettes             Cigarettes    444.3263030
#> 99  2023-03-01   cigarettes             Cigarettes    593.5141464
#> 100 2023-04-01   cigarettes             Cigarettes    474.5603726
#> 101 2023-05-01   cigarettes             Cigarettes    366.9616092
#> 102 2023-06-01   cigarettes             Cigarettes    432.4113751
#> 103 2023-07-01   cigarettes             Cigarettes    676.6709333
#> 104 2023-08-01   cigarettes             Cigarettes    675.3459240
#> 105 2023-09-01   cigarettes             Cigarettes    710.2312447
#> 106 2023-10-01   cigarettes             Cigarettes    532.0359583
#> 107 2023-11-01   cigarettes             Cigarettes    492.7563734
#> 108 2023-12-01   cigarettes             Cigarettes    535.1258298
#> 109 2024-01-01   cigarettes             Cigarettes    694.3750517
#> 110 2024-02-01   cigarettes             Cigarettes    478.3896020
#> 111 2024-03-01   cigarettes             Cigarettes    466.0025136
#> 112 2024-04-01   cigarettes             Cigarettes    617.1495907
#> 113 2024-05-01   cigarettes             Cigarettes    352.3243500
#> 114 2024-06-01   cigarettes             Cigarettes    447.4153851
#> 115 2024-07-01   cigarettes             Cigarettes    578.5200471
#> 116 2024-08-01   cigarettes             Cigarettes    620.5547732
#> 117 2024-09-01   cigarettes             Cigarettes    590.8890108
#> 118 2024-10-01   cigarettes             Cigarettes    471.0033925
#> 119 2024-11-01   cigarettes             Cigarettes    526.4591163
#> 120 2024-12-01   cigarettes             Cigarettes    386.1280838
#> 121 2025-01-01   cigarettes             Cigarettes    459.0771967
#> 122 2025-02-01   cigarettes             Cigarettes    548.6866433
#> 123 2025-03-01   cigarettes             Cigarettes    315.6316069
#> 124 2025-04-01   cigarettes             Cigarettes    621.7795624
#> 125 2025-05-01   cigarettes             Cigarettes    440.7951370
#> 126 2025-06-01   cigarettes             Cigarettes    493.3794652
#> 127 2025-07-01   cigarettes             Cigarettes    590.2182821
#> 128 2025-08-01   cigarettes             Cigarettes    477.0591035
#> 129 2025-09-01   cigarettes             Cigarettes    564.4605731
#> 130 2025-10-01   cigarettes             Cigarettes    442.5215765
#> 131 2025-11-01   cigarettes             Cigarettes    436.6937788
#> 132 2025-12-01   cigarettes             Cigarettes    468.6907599
#> 133 2026-01-01   cigarettes             Cigarettes    335.8754719
#> 134 2015-01-01       cigars                 Cigars      7.8785909
#> 135 2015-02-01       cigars                 Cigars      6.0995474
#> 136 2015-03-01       cigars                 Cigars      6.6080731
#> 137 2015-04-01       cigars                 Cigars     12.3833481
#> 138 2015-05-01       cigars                 Cigars      2.6802062
#> 139 2015-06-01       cigars                 Cigars      7.0539740
#> 140 2015-07-01       cigars                 Cigars      4.8254371
#> 141 2015-08-01       cigars                 Cigars      6.1394868
#> 142 2015-09-01       cigars                 Cigars      5.7634705
#> 143 2015-10-01       cigars                 Cigars      5.9899610
#> 144 2015-11-01       cigars                 Cigars      6.2830437
#> 145 2015-12-01       cigars                 Cigars      6.5766839
#> 146 2016-01-01       cigars                 Cigars      6.1763243
#> 147 2016-02-01       cigars                 Cigars     10.2111931
#> 148 2016-03-01       cigars                 Cigars     11.8752729
#> 149 2016-04-01       cigars                 Cigars      4.5781139
#> 150 2016-05-01       cigars                 Cigars      2.7996422
#> 151 2016-06-01       cigars                 Cigars      3.4341334
#> 152 2016-07-01       cigars                 Cigars      4.7275736
#> 153 2016-08-01       cigars                 Cigars      5.5424121
#> 154 2016-09-01       cigars                 Cigars      5.7633660
#> 155 2016-10-01       cigars                 Cigars      6.2869217
#> 156 2016-11-01       cigars                 Cigars      6.0595061
#> 157 2016-12-01       cigars                 Cigars      5.3939746
#> 158 2017-01-01       cigars                 Cigars      7.6770048
#> 159 2017-02-01       cigars                 Cigars      4.9160551
#> 160 2017-03-01       cigars                 Cigars     14.1032452
#> 161 2017-04-01       cigars                 Cigars      7.7861891
#> 162 2017-05-01       cigars                 Cigars      2.7018153
#> 163 2017-06-01       cigars                 Cigars      3.3544994
#> 164 2017-07-01       cigars                 Cigars      4.3555160
#> 165 2017-08-01       cigars                 Cigars      4.6053771
#> 166 2017-09-01       cigars                 Cigars      5.9472645
#> 167 2017-10-01       cigars                 Cigars      6.2966490
#> 168 2017-11-01       cigars                 Cigars      6.3669846
#> 169 2017-12-01       cigars                 Cigars      7.5651806
#> 170 2018-01-01       cigars                 Cigars      4.9490104
#> 171 2018-02-01       cigars                 Cigars      5.2220374
#> 172 2018-03-01       cigars                 Cigars      4.6591081
#> 173 2018-04-01       cigars                 Cigars      6.5361911
#> 174 2018-05-01       cigars                 Cigars      6.2114491
#> 175 2018-06-01       cigars                 Cigars      6.1485152
#> 176 2018-07-01       cigars                 Cigars      6.9705156
#> 177 2018-08-01       cigars                 Cigars      5.8258765
#> 178 2018-09-01       cigars                 Cigars      7.4780885
#> 179 2018-10-01       cigars                 Cigars      6.3333131
#> 180 2018-11-01       cigars                 Cigars     10.6723182
#> 181 2018-12-01       cigars                 Cigars      3.4819085
#> 182 2019-01-01       cigars                 Cigars      4.8296319
#> 183 2019-02-01       cigars                 Cigars      5.0980561
#> 184 2019-03-01       cigars                 Cigars      4.7287181
#> 185 2019-04-01       cigars                 Cigars      6.3740216
#> 186 2019-05-01       cigars                 Cigars      6.3391325
#> 187 2019-06-01       cigars                 Cigars      6.0085321
#> 188 2019-07-01       cigars                 Cigars      6.5257744
#> 189 2019-08-01       cigars                 Cigars      5.8861968
#> 190 2019-09-01       cigars                 Cigars      7.1916735
#> 191 2019-10-01       cigars                 Cigars      6.3243657
#> 192 2019-11-01       cigars                 Cigars     10.2636497
#> 193 2019-12-01       cigars                 Cigars      3.5575226
#> 194 2020-01-01       cigars                 Cigars      7.4836829
#> 195 2020-02-01       cigars                 Cigars      5.0198839
#> 196 2020-03-01       cigars                 Cigars     21.8125447
#> 197 2020-04-01       cigars                 Cigars      7.2748921
#> 198 2020-05-01       cigars                 Cigars      2.4833984
#> 199 2020-06-01       cigars                 Cigars      3.0538119
#> 200 2020-07-01       cigars                 Cigars      7.0370045
#> 201 2020-08-01       cigars                 Cigars      9.9812844
#> 202 2020-09-01       cigars                 Cigars      8.4631731
#> 203 2020-10-01       cigars                 Cigars     10.3652211
#> 204 2020-11-01       cigars                 Cigars     21.7722781
#> 205 2020-12-01       cigars                 Cigars      9.9517230
#> 206 2021-01-01       cigars                 Cigars      5.6615662
#> 207 2021-02-01       cigars                 Cigars      9.4361194
#> 208 2021-03-01       cigars                 Cigars     13.8645109
#> 209 2021-04-01       cigars                 Cigars      8.3584520
#> 210 2021-05-01       cigars                 Cigars      8.6625619
#> 211 2021-06-01       cigars                 Cigars      9.8141209
#> 212 2021-07-01       cigars                 Cigars     14.3247546
#> 213 2021-08-01       cigars                 Cigars     10.5439602
#> 214 2021-09-01       cigars                 Cigars     11.4432522
#> 215 2021-10-01       cigars                 Cigars     11.3392715
#> 216 2021-11-01       cigars                 Cigars     16.7196147
#> 217 2021-12-01       cigars                 Cigars      8.7546888
#> 218 2022-01-01       cigars                 Cigars      8.7893287
#> 219 2022-02-01       cigars                 Cigars     10.2044731
#> 220 2022-03-01       cigars                 Cigars      9.5588572
#> 221 2022-04-01       cigars                 Cigars     12.6353597
#> 222 2022-05-01       cigars                 Cigars      9.8400353
#> 223 2022-06-01       cigars                 Cigars     13.8525626
#> 224 2022-07-01       cigars                 Cigars     12.7797552
#> 225 2022-08-01       cigars                 Cigars     10.8700397
#> 226 2022-09-01       cigars                 Cigars     17.8447571
#> 227 2022-10-01       cigars                 Cigars     10.5239315
#> 228 2022-11-01       cigars                 Cigars     10.4152324
#> 229 2022-12-01       cigars                 Cigars     15.5269147
#> 230 2023-01-01       cigars                 Cigars      7.9546769
#> 231 2023-02-01       cigars                 Cigars      9.2384860
#> 232 2023-03-01       cigars                 Cigars     17.7407059
#> 233 2023-04-01       cigars                 Cigars     10.5078787
#> 234 2023-05-01       cigars                 Cigars      9.3448069
#> 235 2023-06-01       cigars                 Cigars     10.3510227
#> 236 2023-07-01       cigars                 Cigars     11.0208665
#> 237 2023-08-01       cigars                 Cigars     10.8573460
#> 238 2023-09-01       cigars                 Cigars     15.3199871
#> 239 2023-10-01       cigars                 Cigars     11.4582702
#> 240 2023-11-01       cigars                 Cigars     13.3550191
#> 241 2023-12-01       cigars                 Cigars     18.6395099
#> 242 2024-01-01       cigars                 Cigars     11.5026006
#> 243 2024-02-01       cigars                 Cigars      8.0313110
#> 244 2024-03-01       cigars                 Cigars     19.1789108
#> 245 2024-04-01       cigars                 Cigars     13.4894600
#> 246 2024-05-01       cigars                 Cigars      9.2057234
#> 247 2024-06-01       cigars                 Cigars     12.1925787
#> 248 2024-07-01       cigars                 Cigars     13.2947335
#> 249 2024-08-01       cigars                 Cigars     15.0546176
#> 250 2024-09-01       cigars                 Cigars     15.4521396
#> 251 2024-10-01       cigars                 Cigars     17.0958868
#> 252 2024-11-01       cigars                 Cigars     25.9116419
#> 253 2024-12-01       cigars                 Cigars      5.0877754
#> 254 2025-01-01       cigars                 Cigars      7.4385300
#> 255 2025-02-01       cigars                 Cigars     12.8868034
#> 256 2025-03-01       cigars                 Cigars      9.6822073
#> 257 2025-04-01       cigars                 Cigars     15.2554551
#> 258 2025-05-01       cigars                 Cigars     12.8659986
#> 259 2025-06-01       cigars                 Cigars     13.2729790
#> 260 2025-07-01       cigars                 Cigars     14.1007624
#> 261 2025-08-01       cigars                 Cigars     15.8153227
#> 262 2025-09-01       cigars                 Cigars     10.1627098
#> 263 2025-10-01       cigars                 Cigars     12.9406948
#> 264 2025-11-01       cigars                 Cigars     13.2971913
#> 265 2025-12-01       cigars                 Cigars     16.5024589
#> 266 2026-01-01       cigars                 Cigars     11.0520167
#> 267 2015-01-01 hand_rolling   Hand-rolling tobacco    122.0301667
#> 268 2015-02-01 hand_rolling   Hand-rolling tobacco     70.2147767
#> 269 2015-03-01 hand_rolling   Hand-rolling tobacco    103.1573954
#> 270 2015-04-01 hand_rolling   Hand-rolling tobacco    176.0453336
#> 271 2015-05-01 hand_rolling   Hand-rolling tobacco     29.4794772
#> 272 2015-06-01 hand_rolling   Hand-rolling tobacco     71.4885642
#> 273 2015-07-01 hand_rolling   Hand-rolling tobacco     89.7972134
#> 274 2015-08-01 hand_rolling   Hand-rolling tobacco    136.6238862
#> 275 2015-09-01 hand_rolling   Hand-rolling tobacco     59.1260464
#> 276 2015-10-01 hand_rolling   Hand-rolling tobacco     97.1496217
#> 277 2015-11-01 hand_rolling   Hand-rolling tobacco     92.4931120
#> 278 2015-12-01 hand_rolling   Hand-rolling tobacco     86.7548505
#> 279 2016-01-01 hand_rolling   Hand-rolling tobacco    123.9744591
#> 280 2016-02-01 hand_rolling   Hand-rolling tobacco     73.9334358
#> 281 2016-03-01 hand_rolling   Hand-rolling tobacco    106.1628494
#> 282 2016-04-01 hand_rolling   Hand-rolling tobacco    174.2860928
#> 283 2016-05-01 hand_rolling   Hand-rolling tobacco     31.6358959
#> 284 2016-06-01 hand_rolling   Hand-rolling tobacco     81.8102189
#> 285 2016-07-01 hand_rolling   Hand-rolling tobacco     96.4959662
#> 286 2016-08-01 hand_rolling   Hand-rolling tobacco     98.1324832
#> 287 2016-09-01 hand_rolling   Hand-rolling tobacco    114.1907427
#> 288 2016-10-01 hand_rolling   Hand-rolling tobacco    121.8397691
#> 289 2016-11-01 hand_rolling   Hand-rolling tobacco     85.7824967
#> 290 2016-12-01 hand_rolling   Hand-rolling tobacco     96.0523473
#> 291 2017-01-01 hand_rolling   Hand-rolling tobacco    135.7634789
#> 292 2017-02-01 hand_rolling   Hand-rolling tobacco     91.7002864
#> 293 2017-03-01 hand_rolling   Hand-rolling tobacco    103.8056430
#> 294 2017-04-01 hand_rolling   Hand-rolling tobacco    138.0187252
#> 295 2017-05-01 hand_rolling   Hand-rolling tobacco     70.9833069
#> 296 2017-06-01 hand_rolling   Hand-rolling tobacco    109.4120767
#> 297 2017-07-01 hand_rolling   Hand-rolling tobacco    106.0372148
#> 298 2017-08-01 hand_rolling   Hand-rolling tobacco    113.3950820
#> 299 2017-09-01 hand_rolling   Hand-rolling tobacco    120.5843558
#> 300 2017-10-01 hand_rolling   Hand-rolling tobacco    112.2743566
#> 301 2017-11-01 hand_rolling   Hand-rolling tobacco    107.0665990
#> 302 2017-12-01 hand_rolling   Hand-rolling tobacco    162.1712081
#> 303 2018-01-01 hand_rolling   Hand-rolling tobacco     93.4805327
#> 304 2018-02-01 hand_rolling   Hand-rolling tobacco     81.8722535
#> 305 2018-03-01 hand_rolling   Hand-rolling tobacco    105.0293105
#> 306 2018-04-01 hand_rolling   Hand-rolling tobacco    123.1655576
#> 307 2018-05-01 hand_rolling   Hand-rolling tobacco    113.5850464
#> 308 2018-06-01 hand_rolling   Hand-rolling tobacco    123.3926221
#> 309 2018-07-01 hand_rolling   Hand-rolling tobacco    122.6281466
#> 310 2018-08-01 hand_rolling   Hand-rolling tobacco    123.0568548
#> 311 2018-09-01 hand_rolling   Hand-rolling tobacco    138.8142549
#> 312 2018-10-01 hand_rolling   Hand-rolling tobacco    105.2423758
#> 313 2018-11-01 hand_rolling   Hand-rolling tobacco    236.8745790
#> 314 2018-12-01 hand_rolling   Hand-rolling tobacco     37.9719611
#> 315 2019-01-01 hand_rolling   Hand-rolling tobacco    101.2322231
#> 316 2019-02-01 hand_rolling   Hand-rolling tobacco    107.4184450
#> 317 2019-03-01 hand_rolling   Hand-rolling tobacco    110.6975244
#> 318 2019-04-01 hand_rolling   Hand-rolling tobacco    127.6403628
#> 319 2019-05-01 hand_rolling   Hand-rolling tobacco    117.1069224
#> 320 2019-06-01 hand_rolling   Hand-rolling tobacco    132.6318513
#> 321 2019-07-01 hand_rolling   Hand-rolling tobacco    117.0505924
#> 322 2019-08-01 hand_rolling   Hand-rolling tobacco    162.7711343
#> 323 2019-09-01 hand_rolling   Hand-rolling tobacco    137.9836199
#> 324 2019-10-01 hand_rolling   Hand-rolling tobacco    117.8014458
#> 325 2019-11-01 hand_rolling   Hand-rolling tobacco    118.8148912
#> 326 2019-12-01 hand_rolling   Hand-rolling tobacco    113.1924149
#> 327 2020-01-01 hand_rolling   Hand-rolling tobacco    168.6487820
#> 328 2020-02-01 hand_rolling   Hand-rolling tobacco     88.6235208
#> 329 2020-03-01 hand_rolling   Hand-rolling tobacco    131.8876261
#> 330 2020-04-01 hand_rolling   Hand-rolling tobacco    300.4117752
#> 331 2020-05-01 hand_rolling   Hand-rolling tobacco     43.3836651
#> 332 2020-06-01 hand_rolling   Hand-rolling tobacco    149.3840521
#> 333 2020-07-01 hand_rolling   Hand-rolling tobacco    204.0285634
#> 334 2020-08-01 hand_rolling   Hand-rolling tobacco    193.9733826
#> 335 2020-09-01 hand_rolling   Hand-rolling tobacco    215.6618899
#> 336 2020-10-01 hand_rolling   Hand-rolling tobacco    178.7310653
#> 337 2020-11-01 hand_rolling   Hand-rolling tobacco    187.0926319
#> 338 2020-12-01 hand_rolling   Hand-rolling tobacco    168.4230217
#> 339 2021-01-01 hand_rolling   Hand-rolling tobacco    209.4668890
#> 340 2021-02-01 hand_rolling   Hand-rolling tobacco    140.2638306
#> 341 2021-03-01 hand_rolling   Hand-rolling tobacco    196.7040269
#> 342 2021-04-01 hand_rolling   Hand-rolling tobacco    390.6899445
#> 343 2021-05-01 hand_rolling   Hand-rolling tobacco     76.1664530
#> 344 2021-06-01 hand_rolling   Hand-rolling tobacco    132.4389150
#> 345 2021-07-01 hand_rolling   Hand-rolling tobacco    288.8361152
#> 346 2021-08-01 hand_rolling   Hand-rolling tobacco    141.0466609
#> 347 2021-09-01 hand_rolling   Hand-rolling tobacco    241.2572578
#> 348 2021-10-01 hand_rolling   Hand-rolling tobacco    176.5260403
#> 349 2021-11-01 hand_rolling   Hand-rolling tobacco    208.2775529
#> 350 2021-12-01 hand_rolling   Hand-rolling tobacco    182.9615980
#> 351 2022-01-01 hand_rolling   Hand-rolling tobacco    194.3418490
#> 352 2022-02-01 hand_rolling   Hand-rolling tobacco    173.5330505
#> 353 2022-03-01 hand_rolling   Hand-rolling tobacco    183.7153012
#> 354 2022-04-01 hand_rolling   Hand-rolling tobacco    197.0796221
#> 355 2022-05-01 hand_rolling   Hand-rolling tobacco    178.5808392
#> 356 2022-06-01 hand_rolling   Hand-rolling tobacco    199.0894105
#> 357 2022-07-01 hand_rolling   Hand-rolling tobacco    208.4021916
#> 358 2022-08-01 hand_rolling   Hand-rolling tobacco    164.3517029
#> 359 2022-09-01 hand_rolling   Hand-rolling tobacco    252.6255901
#> 360 2022-10-01 hand_rolling   Hand-rolling tobacco    170.5864677
#> 361 2022-11-01 hand_rolling   Hand-rolling tobacco    153.0880451
#> 362 2022-12-01 hand_rolling   Hand-rolling tobacco    196.5403008
#> 363 2023-01-01 hand_rolling   Hand-rolling tobacco    177.9851042
#> 364 2023-02-01 hand_rolling   Hand-rolling tobacco    123.1023264
#> 365 2023-03-01 hand_rolling   Hand-rolling tobacco    177.1498932
#> 366 2023-04-01 hand_rolling   Hand-rolling tobacco    160.9565526
#> 367 2023-05-01 hand_rolling   Hand-rolling tobacco    125.9619350
#> 368 2023-06-01 hand_rolling   Hand-rolling tobacco    111.5346769
#> 369 2023-07-01 hand_rolling   Hand-rolling tobacco    235.6816855
#> 370 2023-08-01 hand_rolling   Hand-rolling tobacco    173.3552709
#> 371 2023-09-01 hand_rolling   Hand-rolling tobacco    193.6994620
#> 372 2023-10-01 hand_rolling   Hand-rolling tobacco    169.9411621
#> 373 2023-11-01 hand_rolling   Hand-rolling tobacco    161.0165494
#> 374 2023-12-01 hand_rolling   Hand-rolling tobacco    193.1400786
#> 375 2024-01-01 hand_rolling   Hand-rolling tobacco    187.4501973
#> 376 2024-02-01 hand_rolling   Hand-rolling tobacco    165.7176774
#> 377 2024-03-01 hand_rolling   Hand-rolling tobacco    192.5754780
#> 378 2024-04-01 hand_rolling   Hand-rolling tobacco    179.2439454
#> 379 2024-05-01 hand_rolling   Hand-rolling tobacco     89.0109191
#> 380 2024-06-01 hand_rolling   Hand-rolling tobacco    152.4112880
#> 381 2024-07-01 hand_rolling   Hand-rolling tobacco    183.1329905
#> 382 2024-08-01 hand_rolling   Hand-rolling tobacco    154.2518923
#> 383 2024-09-01 hand_rolling   Hand-rolling tobacco    181.7424001
#> 384 2024-10-01 hand_rolling   Hand-rolling tobacco    158.2726747
#> 385 2024-11-01 hand_rolling   Hand-rolling tobacco    192.5928049
#> 386 2024-12-01 hand_rolling   Hand-rolling tobacco     97.6221860
#> 387 2025-01-01 hand_rolling   Hand-rolling tobacco    138.8409910
#> 388 2025-02-01 hand_rolling   Hand-rolling tobacco     97.6448176
#> 389 2025-03-01 hand_rolling   Hand-rolling tobacco    146.2914300
#> 390 2025-04-01 hand_rolling   Hand-rolling tobacco    153.4342203
#> 391 2025-05-01 hand_rolling   Hand-rolling tobacco    143.5695377
#> 392 2025-06-01 hand_rolling   Hand-rolling tobacco    152.1575715
#> 393 2025-07-01 hand_rolling   Hand-rolling tobacco    166.0410085
#> 394 2025-08-01 hand_rolling   Hand-rolling tobacco    145.4248128
#> 395 2025-09-01 hand_rolling   Hand-rolling tobacco    156.0241955
#> 396 2025-10-01 hand_rolling   Hand-rolling tobacco    173.4347556
#> 397 2025-11-01 hand_rolling   Hand-rolling tobacco    134.6506852
#> 398 2025-12-01 hand_rolling   Hand-rolling tobacco    151.6263272
#> 399 2026-01-01 hand_rolling   Hand-rolling tobacco     77.7320907
#> 400 2015-01-01        other Other tobacco products      2.2918184
#> 401 2015-02-01        other Other tobacco products      1.7755021
#> 402 2015-03-01        other Other tobacco products      1.7896208
#> 403 2015-04-01        other Other tobacco products      3.5229986
#> 404 2015-05-01        other Other tobacco products      0.8843264
#> 405 2015-06-01        other Other tobacco products      1.9042837
#> 406 2015-07-01        other Other tobacco products      1.8870176
#> 407 2015-08-01        other Other tobacco products      2.3494885
#> 408 2015-09-01        other Other tobacco products      1.5441285
#> 409 2015-10-01        other Other tobacco products      2.1304638
#> 410 2015-11-01        other Other tobacco products      2.0829046
#> 411 2015-12-01        other Other tobacco products      1.8410737
#> 412 2016-01-01        other Other tobacco products      1.9581350
#> 413 2016-02-01        other Other tobacco products      1.3911087
#> 414 2016-03-01        other Other tobacco products      1.8840601
#> 415 2016-04-01        other Other tobacco products      2.3312421
#> 416 2016-05-01        other Other tobacco products      1.3350193
#> 417 2016-06-01        other Other tobacco products      1.8454990
#> 418 2016-07-01        other Other tobacco products      1.8146539
#> 419 2016-08-01        other Other tobacco products      1.7108295
#> 420 2016-09-01        other Other tobacco products      1.8225638
#> 421 2016-10-01        other Other tobacco products      1.9589907
#> 422 2016-11-01        other Other tobacco products      1.6356483
#> 423 2016-12-01        other Other tobacco products      1.8342830
#> 424 2017-01-01        other Other tobacco products      1.8390259
#> 425 2017-02-01        other Other tobacco products      1.5227796
#> 426 2017-03-01        other Other tobacco products      1.8492404
#> 427 2017-04-01        other Other tobacco products      2.4772985
#> 428 2017-05-01        other Other tobacco products      1.2374263
#> 429 2017-06-01        other Other tobacco products      2.3182959
#> 430 2017-07-01        other Other tobacco products      2.1920183
#> 431 2017-08-01        other Other tobacco products      1.6222234
#> 432 2017-09-01        other Other tobacco products      2.2396162
#> 433 2017-10-01        other Other tobacco products      1.6772381
#> 434 2017-11-01        other Other tobacco products      1.9221466
#> 435 2017-12-01        other Other tobacco products      2.0570372
#> 436 2018-01-01        other Other tobacco products      1.9424981
#> 437 2018-02-01        other Other tobacco products      2.3569797
#> 438 2018-03-01        other Other tobacco products      1.4679768
#> 439 2018-04-01        other Other tobacco products      1.8351510
#> 440 2018-05-01        other Other tobacco products      2.0163026
#> 441 2018-06-01        other Other tobacco products      1.9064344
#> 442 2018-07-01        other Other tobacco products      2.0366468
#> 443 2018-08-01        other Other tobacco products      2.0163029
#> 444 2018-09-01        other Other tobacco products      2.1590906
#> 445 2018-10-01        other Other tobacco products      1.9643518
#> 446 2018-11-01        other Other tobacco products      3.5036174
#> 447 2018-12-01        other Other tobacco products      1.4952458
#> 448 2019-01-01        other Other tobacco products      1.4130114
#> 449 2019-02-01        other Other tobacco products      2.1334775
#> 450 2019-03-01        other Other tobacco products      1.4109452
#> 451 2019-04-01        other Other tobacco products      1.7924672
#> 452 2019-05-01        other Other tobacco products      1.9147071
#> 453 2019-06-01        other Other tobacco products      1.7830738
#> 454 2019-07-01        other Other tobacco products      1.8887799
#> 455 2019-08-01        other Other tobacco products      3.4321345
#> 456 2019-09-01        other Other tobacco products      2.0108005
#> 457 2019-10-01        other Other tobacco products      3.9622993
#> 458 2019-11-01        other Other tobacco products      3.2862884
#> 459 2019-12-01        other Other tobacco products      2.4067769
#> 460 2020-01-01        other Other tobacco products     -4.9209034
#> 461 2020-02-01        other Other tobacco products      1.0212822
#> 462 2020-03-01        other Other tobacco products      7.8913511
#> 463 2020-04-01        other Other tobacco products      1.8461570
#> 464 2020-05-01        other Other tobacco products      1.8488334
#> 465 2020-06-01        other Other tobacco products      2.7058716
#> 466 2020-07-01        other Other tobacco products      1.8798972
#> 467 2020-08-01        other Other tobacco products      3.8565892
#> 468 2020-09-01        other Other tobacco products      3.3385432
#> 469 2020-10-01        other Other tobacco products      3.7774370
#> 470 2020-11-01        other Other tobacco products      8.4052371
#> 471 2020-12-01        other Other tobacco products      3.6121221
#> 472 2021-01-01        other Other tobacco products      6.1944850
#> 473 2021-02-01        other Other tobacco products      1.9459439
#> 474 2021-03-01        other Other tobacco products      9.8560213
#> 475 2021-04-01        other Other tobacco products      1.6174955
#> 476 2021-05-01        other Other tobacco products      2.1482351
#> 477 2021-06-01        other Other tobacco products      2.7459408
#> 478 2021-07-01        other Other tobacco products      5.3797254
#> 479 2021-08-01        other Other tobacco products      7.2578946
#> 480 2021-09-01        other Other tobacco products      2.4953393
#> 481 2021-10-01        other Other tobacco products      9.7642426
#> 482 2021-11-01        other Other tobacco products     13.3375419
#> 483 2021-12-01        other Other tobacco products      1.6714589
#> 484 2022-01-01        other Other tobacco products      2.4877359
#> 485 2022-02-01        other Other tobacco products      2.5973437
#> 486 2022-03-01        other Other tobacco products      4.0972992
#> 487 2022-04-01        other Other tobacco products      5.2653594
#> 488 2022-05-01        other Other tobacco products      4.2957680
#> 489 2022-06-01        other Other tobacco products      5.2237431
#> 490 2022-07-01        other Other tobacco products      4.2044786
#> 491 2022-08-01        other Other tobacco products      7.4187080
#> 492 2022-09-01        other Other tobacco products      4.9619111
#> 493 2022-10-01        other Other tobacco products      6.0968408
#> 494 2022-11-01        other Other tobacco products      4.2894477
#> 495 2022-12-01        other Other tobacco products      7.0857182
#> 496 2023-01-01        other Other tobacco products      4.6343505
#> 497 2023-02-01        other Other tobacco products      4.1603715
#> 498 2023-03-01        other Other tobacco products     29.8793646
#> 499 2023-04-01        other Other tobacco products      1.9659387
#> 500 2023-05-01        other Other tobacco products      0.8561964
#> 501 2023-06-01        other Other tobacco products      0.9896870
#> 502 2023-07-01        other Other tobacco products     -0.5021930
#> 503 2023-08-01        other Other tobacco products      5.4759198
#> 504 2023-09-01        other Other tobacco products      7.7580899
#> 505 2023-10-01        other Other tobacco products      1.9291094
#> 506 2023-11-01        other Other tobacco products      4.2104912
#> 507 2023-12-01        other Other tobacco products      4.4154458
#> 508 2024-01-01        other Other tobacco products      7.5454681
#> 509 2024-02-01        other Other tobacco products      4.5202980
#> 510 2024-03-01        other Other tobacco products      9.5302935
#> 511 2024-04-01        other Other tobacco products      4.3231617
#> 512 2024-05-01        other Other tobacco products      8.1428893
#> 513 2024-06-01        other Other tobacco products      6.9557430
#> 514 2024-07-01        other Other tobacco products      8.5199092
#> 515 2024-08-01        other Other tobacco products      6.7073407
#> 516 2024-09-01        other Other tobacco products      9.4626986
#> 517 2024-10-01        other Other tobacco products      7.0369896
#> 518 2024-11-01        other Other tobacco products     10.1804637
#> 519 2024-12-01        other Other tobacco products      4.3214352
#> 520 2025-01-01        other Other tobacco products      4.6690242
#> 521 2025-02-01        other Other tobacco products      8.4628303
#> 522 2025-03-01        other Other tobacco products      6.0567504
#> 523 2025-04-01        other Other tobacco products      5.9232057
#> 524 2025-05-01        other Other tobacco products      1.4852499
#> 525 2025-06-01        other Other tobacco products      9.8740363
#> 526 2025-07-01        other Other tobacco products      2.3946005
#> 527 2025-08-01        other Other tobacco products      7.3645322
#> 528 2025-09-01        other Other tobacco products      0.8668692
#> 529 2025-10-01        other Other tobacco products     15.2515731
#> 530 2025-11-01        other Other tobacco products      8.0714275
#> 531 2025-12-01        other Other tobacco products     10.1288298
#> 532 2026-01-01        other Other tobacco products      6.1896886
#> 533 2015-01-01        total Total tobacco products    994.2662612
#> 534 2015-02-01        total Total tobacco products    599.5248503
#> 535 2015-03-01        total Total tobacco products    777.6569003
#> 536 2015-04-01        total Total tobacco products   1453.3802851
#> 537 2015-05-01        total Total tobacco products    236.5447210
#> 538 2015-06-01        total Total tobacco products    572.4101982
#> 539 2015-07-01        total Total tobacco products    756.5115268
#> 540 2015-08-01        total Total tobacco products   1217.4850694
#> 541 2015-09-01        total Total tobacco products    467.2762238
#> 542 2015-10-01        total Total tobacco products    845.8339962
#> 543 2015-11-01        total Total tobacco products    839.8140527
#> 544 2015-12-01        total Total tobacco products    507.8285848
#> 545 2016-01-01        total Total tobacco products    915.2068174
#> 546 2016-02-01        total Total tobacco products    633.7305407
#> 547 2016-03-01        total Total tobacco products   1038.9621499
#> 548 2016-04-01        total Total tobacco products   1073.8492546
#> 549 2016-05-01        total Total tobacco products    269.1198010
#> 550 2016-06-01        total Total tobacco products    624.8688114
#> 551 2016-07-01        total Total tobacco products    726.1357159
#> 552 2016-08-01        total Total tobacco products    759.7568824
#> 553 2016-09-01        total Total tobacco products    843.1748264
#> 554 2016-10-01        total Total tobacco products    857.4718078
#> 555 2016-11-01        total Total tobacco products    717.3403772
#> 556 2016-12-01        total Total tobacco products    632.5921287
#> 557 2017-01-01        total Total tobacco products    909.5719784
#> 558 2017-02-01        total Total tobacco products    715.5342463
#> 559 2017-03-01        total Total tobacco products    779.5898898
#> 560 2017-04-01        total Total tobacco products    844.5610675
#> 561 2017-05-01        total Total tobacco products    488.2145617
#> 562 2017-06-01        total Total tobacco products    754.5313667
#> 563 2017-07-01        total Total tobacco products    800.3540466
#> 564 2017-08-01        total Total tobacco products    756.7010670
#> 565 2017-09-01        total Total tobacco products    851.1671707
#> 566 2017-10-01        total Total tobacco products    753.0629603
#> 567 2017-11-01        total Total tobacco products    653.4662127
#> 568 2017-12-01        total Total tobacco products   1169.7129827
#> 569 2018-01-01        total Total tobacco products    553.6913289
#> 570 2018-02-01        total Total tobacco products    523.7670142
#> 571 2018-03-01        total Total tobacco products    677.4230316
#> 572 2018-04-01        total Total tobacco products    783.6296706
#> 573 2018-05-01        total Total tobacco products    969.9255827
#> 574 2018-06-01        total Total tobacco products    651.0846465
#> 575 2018-07-01        total Total tobacco products    803.3481839
#> 576 2018-08-01        total Total tobacco products    743.5132152
#> 577 2018-09-01        total Total tobacco products    920.8673995
#> 578 2018-10-01        total Total tobacco products    705.3167743
#> 579 2018-11-01        total Total tobacco products   1241.8145662
#> 580 2018-12-01        total Total tobacco products    269.3871759
#> 581 2019-01-01        total Total tobacco products    686.3587460
#> 582 2019-02-01        total Total tobacco products    648.4400590
#> 583 2019-03-01        total Total tobacco products    866.4340386
#> 584 2019-04-01        total Total tobacco products    647.3934636
#> 585 2019-05-01        total Total tobacco products    648.0932271
#> 586 2019-06-01        total Total tobacco products    767.2057796
#> 587 2019-07-01        total Total tobacco products    724.1624784
#> 588 2019-08-01        total Total tobacco products    889.3386347
#> 589 2019-09-01        total Total tobacco products    914.4040573
#> 590 2019-10-01        total Total tobacco products    668.6148205
#> 591 2019-11-01        total Total tobacco products    637.3547322
#> 592 2019-12-01        total Total tobacco products    590.1011204
#> 593 2020-01-01        total Total tobacco products   1039.2093137
#> 594 2020-02-01        total Total tobacco products    473.4434194
#> 595 2020-03-01        total Total tobacco products    804.6161576
#> 596 2020-04-01        total Total tobacco products   1537.8351501
#> 597 2020-05-01        total Total tobacco products    230.3332711
#> 598 2020-06-01        total Total tobacco products    540.6521113
#> 599 2020-07-01        total Total tobacco products    870.4163749
#> 600 2020-08-01        total Total tobacco products    887.8972111
#> 601 2020-09-01        total Total tobacco products   1052.8908591
#> 602 2020-10-01        total Total tobacco products    827.2871704
#> 603 2020-11-01        total Total tobacco products    884.8941248
#> 604 2020-12-01        total Total tobacco products    698.6798852
#> 605 2021-01-01        total Total tobacco products    980.8208007
#> 606 2021-02-01        total Total tobacco products    587.8575124
#> 607 2021-03-01        total Total tobacco products    864.4653216
#> 608 2021-04-01        total Total tobacco products   1362.1288097
#> 609 2021-05-01        total Total tobacco products    450.4934503
#> 610 2021-06-01        total Total tobacco products    611.7388567
#> 611 2021-07-01        total Total tobacco products   1210.9378721
#> 612 2021-08-01        total Total tobacco products    709.0619483
#> 613 2021-09-01        total Total tobacco products   1171.4268766
#> 614 2021-10-01        total Total tobacco products    758.2667247
#> 615 2021-11-01        total Total tobacco products    914.7643148
#> 616 2021-12-01        total Total tobacco products    737.6022643
#> 617 2022-01-01        total Total tobacco products    876.1946676
#> 618 2022-02-01        total Total tobacco products    694.5053343
#> 619 2022-03-01        total Total tobacco products    780.3913678
#> 620 2022-04-01        total Total tobacco products   1275.7166931
#> 621 2022-05-01        total Total tobacco products    613.1837339
#> 622 2022-06-01        total Total tobacco products    695.3902150
#> 623 2022-07-01        total Total tobacco products    900.4942315
#> 624 2022-08-01        total Total tobacco products    773.3160841
#> 625 2022-09-01        total Total tobacco products   1220.7703751
#> 626 2022-10-01        total Total tobacco products    677.3035999
#> 627 2022-11-01        total Total tobacco products    712.5854851
#> 628 2022-12-01        total Total tobacco products    988.1646004
#> 629 2023-01-01        total Total tobacco products    747.5446976
#> 630 2023-02-01        total Total tobacco products    580.8274869
#> 631 2023-03-01        total Total tobacco products    818.2841101
#> 632 2023-04-01        total Total tobacco products    647.9907427
#> 633 2023-05-01        total Total tobacco products    503.1245474
#> 634 2023-06-01        total Total tobacco products    555.2867617
#> 635 2023-07-01        total Total tobacco products    922.8712924
#> 636 2023-08-01        total Total tobacco products    865.0344607
#> 637 2023-09-01        total Total tobacco products    927.0087837
#> 638 2023-10-01        total Total tobacco products    715.3645001
#> 639 2023-11-01        total Total tobacco products    671.3384331
#> 640 2023-12-01        total Total tobacco products    751.3208641
#> 641 2024-01-01        total Total tobacco products    900.8733177
#> 642 2024-02-01        total Total tobacco products    656.6588884
#> 643 2024-03-01        total Total tobacco products    687.2871959
#> 644 2024-04-01        total Total tobacco products    814.2061577
#> 645 2024-05-01        total Total tobacco products    458.6838817
#> 646 2024-06-01        total Total tobacco products    618.9749947
#> 647 2024-07-01        total Total tobacco products    783.4676803
#> 648 2024-08-01        total Total tobacco products    796.5686238
#> 649 2024-09-01        total Total tobacco products    797.5462491
#> 650 2024-10-01        total Total tobacco products    653.4089436
#> 651 2024-11-01        total Total tobacco products    755.1440268
#> 652 2024-12-01        total Total tobacco products    493.1594804
#> 653 2025-01-01        total Total tobacco products    610.0257419
#> 654 2025-02-01        total Total tobacco products    667.6810945
#> 655 2025-03-01        total Total tobacco products    477.6619946
#> 656 2025-04-01        total Total tobacco products    796.3924435
#> 657 2025-05-01        total Total tobacco products    598.7159232
#> 658 2025-06-01        total Total tobacco products    668.6840521
#> 659 2025-07-01        total Total tobacco products    772.7546535
#> 660 2025-08-01        total Total tobacco products    645.6637712
#> 661 2025-09-01        total Total tobacco products    731.5143476
#> 662 2025-10-01        total Total tobacco products    644.1485999
#> 663 2025-11-01        total Total tobacco products    592.7130828
#> 664 2025-12-01        total Total tobacco products    646.9483757
#> 665 2026-01-01        total Total tobacco products    430.8492678
hmrc_tobacco_duties(product = "cigarettes")
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
#> ✔ Parsing data [93ms]
#> 
#> # Tobacco Bulletin
#> # Source: https://www.gov.uk/government/statistics/tobacco-bulletin
#> # Fetched 2026-04-26 13:02:09 UTC | Vintage: latest | Cells: cash | Freq: monthly | 421 rows x 4 cols
#> 
#>           date    product description receipts_gbp_m
#> 1   1991-01-01 cigarettes  Cigarettes             NA
#> 2   1991-02-01 cigarettes  Cigarettes     225.488000
#> 3   1991-03-01 cigarettes  Cigarettes     508.215000
#> 4   1991-04-01 cigarettes  Cigarettes     742.627000
#> 5   1991-05-01 cigarettes  Cigarettes     134.531093
#> 6   1991-06-01 cigarettes  Cigarettes     325.034739
#> 7   1991-07-01 cigarettes  Cigarettes     400.737913
#> 8   1991-08-01 cigarettes  Cigarettes     492.998484
#> 9   1991-09-01 cigarettes  Cigarettes     494.061726
#> 10  1991-10-01 cigarettes  Cigarettes     482.122450
#> 11  1991-11-01 cigarettes  Cigarettes     903.473702
#> 12  1991-12-01 cigarettes  Cigarettes     259.465219
#> 13  1992-01-01 cigarettes  Cigarettes     661.212020
#> 14  1992-02-01 cigarettes  Cigarettes     197.613481
#> 15  1992-03-01 cigarettes  Cigarettes     734.445951
#> 16  1992-04-01 cigarettes  Cigarettes     665.941365
#> 17  1992-05-01 cigarettes  Cigarettes     130.539238
#> 18  1992-06-01 cigarettes  Cigarettes     308.134660
#> 19  1992-07-01 cigarettes  Cigarettes     479.796215
#> 20  1992-08-01 cigarettes  Cigarettes     503.469731
#> 21  1992-09-01 cigarettes  Cigarettes     474.734956
#> 22  1992-10-01 cigarettes  Cigarettes     491.575872
#> 23  1992-11-01 cigarettes  Cigarettes     838.354822
#> 24  1992-12-01 cigarettes  Cigarettes     471.507576
#> 25  1993-01-01 cigarettes  Cigarettes     305.491000
#> 26  1993-02-01 cigarettes  Cigarettes     390.937200
#> 27  1993-03-01 cigarettes  Cigarettes     531.144500
#> 28  1993-04-01 cigarettes  Cigarettes    1375.109700
#> 29  1993-05-01 cigarettes  Cigarettes      55.973700
#> 30  1993-06-01 cigarettes  Cigarettes     154.627180
#> 31  1993-07-01 cigarettes  Cigarettes     377.538200
#> 32  1993-08-01 cigarettes  Cigarettes     920.217160
#> 33  1993-09-01 cigarettes  Cigarettes     267.190656
#> 34  1993-10-01 cigarettes  Cigarettes     353.049200
#> 35  1993-11-01 cigarettes  Cigarettes     463.103900
#> 36  1993-12-01 cigarettes  Cigarettes    1718.937900
#> 37  1994-01-01 cigarettes  Cigarettes      38.230060
#> 38  1994-02-01 cigarettes  Cigarettes     101.117140
#> 39  1994-03-01 cigarettes  Cigarettes     248.533920
#> 40  1994-04-01 cigarettes  Cigarettes     744.656320
#> 41  1994-05-01 cigarettes  Cigarettes     351.526000
#> 42  1994-06-01 cigarettes  Cigarettes     464.395450
#> 43  1994-07-01 cigarettes  Cigarettes     537.653330
#> 44  1994-08-01 cigarettes  Cigarettes     547.810630
#> 45  1994-09-01 cigarettes  Cigarettes     563.634740
#> 46  1994-10-01 cigarettes  Cigarettes     529.554250
#> 47  1994-11-01 cigarettes  Cigarettes     533.178000
#> 48  1994-12-01 cigarettes  Cigarettes    2200.885100
#> 49  1995-01-01 cigarettes  Cigarettes     374.364100
#> 50  1995-02-01 cigarettes  Cigarettes      32.841800
#> 51  1995-03-01 cigarettes  Cigarettes      71.661700
#> 52  1995-04-01 cigarettes  Cigarettes     457.072550
#> 53  1995-05-01 cigarettes  Cigarettes     259.918130
#> 54  1995-06-01 cigarettes  Cigarettes     522.982280
#> 55  1995-07-01 cigarettes  Cigarettes     543.925930
#> 56  1995-08-01 cigarettes  Cigarettes     565.669420
#> 57  1995-09-01 cigarettes  Cigarettes     645.067550
#> 58  1995-10-01 cigarettes  Cigarettes     559.493500
#> 59  1995-11-01 cigarettes  Cigarettes     602.079160
#> 60  1995-12-01 cigarettes  Cigarettes    2528.886740
#> 61  1996-01-01 cigarettes  Cigarettes       6.179331
#> 62  1996-02-01 cigarettes  Cigarettes      45.141494
#> 63  1996-03-01 cigarettes  Cigarettes     146.789549
#> 64  1996-04-01 cigarettes  Cigarettes     467.696685
#> 65  1996-05-01 cigarettes  Cigarettes     404.710575
#> 66  1996-06-01 cigarettes  Cigarettes     500.742696
#> 67  1996-07-01 cigarettes  Cigarettes     574.010542
#> 68  1996-08-01 cigarettes  Cigarettes     651.437107
#> 69  1996-09-01 cigarettes  Cigarettes     618.248872
#> 70  1996-10-01 cigarettes  Cigarettes     582.278517
#> 71  1996-11-01 cigarettes  Cigarettes     660.293077
#> 72  1996-12-01 cigarettes  Cigarettes    3022.019724
#> 73  1997-01-01 cigarettes  Cigarettes      12.297943
#> 74  1997-02-01 cigarettes  Cigarettes      58.957696
#> 75  1997-03-01 cigarettes  Cigarettes     106.292110
#> 76  1997-04-01 cigarettes  Cigarettes     347.463292
#> 77  1997-05-01 cigarettes  Cigarettes     198.837651
#> 78  1997-06-01 cigarettes  Cigarettes     506.070258
#> 79  1997-07-01 cigarettes  Cigarettes     918.814720
#> 80  1997-08-01 cigarettes  Cigarettes    2097.941968
#> 81  1997-09-01 cigarettes  Cigarettes      58.564162
#> 82  1997-10-01 cigarettes  Cigarettes     114.116665
#> 83  1997-11-01 cigarettes  Cigarettes     217.636993
#> 84  1997-12-01 cigarettes  Cigarettes    3408.446045
#> 85  1998-01-01 cigarettes  Cigarettes      17.289152
#> 86  1998-02-01 cigarettes  Cigarettes      29.889182
#> 87  1998-03-01 cigarettes  Cigarettes      85.484435
#> 88  1998-04-01 cigarettes  Cigarettes    1580.619262
#> 89  1998-05-01 cigarettes  Cigarettes       6.292671
#> 90  1998-06-01 cigarettes  Cigarettes      28.424242
#> 91  1998-07-01 cigarettes  Cigarettes      75.995741
#> 92  1998-08-01 cigarettes  Cigarettes     243.569040
#> 93  1998-09-01 cigarettes  Cigarettes     443.268190
#> 94  1998-10-01 cigarettes  Cigarettes     530.806193
#> 95  1998-11-01 cigarettes  Cigarettes     555.829090
#> 96  1998-12-01 cigarettes  Cigarettes    4376.103411
#> 97  1999-01-01 cigarettes  Cigarettes      -1.429184
#> 98  1999-02-01 cigarettes  Cigarettes       0.851810
#> 99  1999-03-01 cigarettes  Cigarettes      28.625106
#> 100 1999-04-01 cigarettes  Cigarettes      86.155363
#> 101 1999-05-01 cigarettes  Cigarettes      98.088941
#> 102 1999-06-01 cigarettes  Cigarettes     428.922330
#> 103 1999-07-01 cigarettes  Cigarettes     225.082061
#> 104 1999-08-01 cigarettes  Cigarettes     368.907698
#> 105 1999-09-01 cigarettes  Cigarettes     425.882128
#> 106 1999-10-01 cigarettes  Cigarettes     559.824424
#> 107 1999-11-01 cigarettes  Cigarettes     528.640958
#> 108 1999-12-01 cigarettes  Cigarettes     638.455377
#> 109 2000-01-01 cigarettes  Cigarettes     752.068923
#> 110 2000-02-01 cigarettes  Cigarettes     697.936338
#> 111 2000-03-01 cigarettes  Cigarettes     512.097001
#> 112 2000-04-01 cigarettes  Cigarettes    3926.017486
#> 113 2000-05-01 cigarettes  Cigarettes       2.953807
#> 114 2000-06-01 cigarettes  Cigarettes      23.176380
#> 115 2000-07-01 cigarettes  Cigarettes      57.310438
#> 116 2000-08-01 cigarettes  Cigarettes      70.746702
#> 117 2000-09-01 cigarettes  Cigarettes     183.093321
#> 118 2000-10-01 cigarettes  Cigarettes     299.624472
#> 119 2000-11-01 cigarettes  Cigarettes     516.428455
#> 120 2000-12-01 cigarettes  Cigarettes     333.302091
#> 121 2001-01-01 cigarettes  Cigarettes     503.753641
#> 122 2001-02-01 cigarettes  Cigarettes     652.443601
#> 123 2001-03-01 cigarettes  Cigarettes     677.025888
#> 124 2001-04-01 cigarettes  Cigarettes     949.927452
#> 125 2001-05-01 cigarettes  Cigarettes     188.268221
#> 126 2001-06-01 cigarettes  Cigarettes     516.019042
#> 127 2001-07-01 cigarettes  Cigarettes     589.345780
#> 128 2001-08-01 cigarettes  Cigarettes     626.116811
#> 129 2001-09-01 cigarettes  Cigarettes     731.410335
#> 130 2001-10-01 cigarettes  Cigarettes     714.572897
#> 131 2001-11-01 cigarettes  Cigarettes     591.969891
#> 132 2001-12-01 cigarettes  Cigarettes     517.149212
#> 133 2002-01-01 cigarettes  Cigarettes     657.208159
#> 134 2002-02-01 cigarettes  Cigarettes     627.313790
#> 135 2002-03-01 cigarettes  Cigarettes     596.611665
#> 136 2002-04-01 cigarettes  Cigarettes     666.837571
#> 137 2002-05-01 cigarettes  Cigarettes    1524.374792
#> 138 2002-06-01 cigarettes  Cigarettes     122.394984
#> 139 2002-07-01 cigarettes  Cigarettes     477.955540
#> 140 2002-08-01 cigarettes  Cigarettes     584.770017
#> 141 2002-09-01 cigarettes  Cigarettes     630.903100
#> 142 2002-10-01 cigarettes  Cigarettes     633.311030
#> 143 2002-11-01 cigarettes  Cigarettes     688.668820
#> 144 2002-12-01 cigarettes  Cigarettes     451.982768
#> 145 2003-01-01 cigarettes  Cigarettes     738.216162
#> 146 2003-02-01 cigarettes  Cigarettes     515.420777
#> 147 2003-03-01 cigarettes  Cigarettes     572.654891
#> 148 2003-04-01 cigarettes  Cigarettes     633.304872
#> 149 2003-05-01 cigarettes  Cigarettes    1429.694669
#> 150 2003-06-01 cigarettes  Cigarettes     130.032979
#> 151 2003-07-01 cigarettes  Cigarettes     870.391710
#> 152 2003-08-01 cigarettes  Cigarettes     280.585310
#> 153 2003-09-01 cigarettes  Cigarettes     569.026403
#> 154 2003-10-01 cigarettes  Cigarettes     628.052730
#> 155 2003-11-01 cigarettes  Cigarettes     720.690107
#> 156 2003-12-01 cigarettes  Cigarettes     480.947337
#> 157 2004-01-01 cigarettes  Cigarettes     761.666508
#> 158 2004-02-01 cigarettes  Cigarettes     523.158118
#> 159 2004-03-01 cigarettes  Cigarettes     606.929965
#> 160 2004-04-01 cigarettes  Cigarettes    1091.626327
#> 161 2004-05-01 cigarettes  Cigarettes     240.835547
#> 162 2004-06-01 cigarettes  Cigarettes     626.011415
#> 163 2004-07-01 cigarettes  Cigarettes    1056.465810
#> 164 2004-08-01 cigarettes  Cigarettes     318.633136
#> 165 2004-09-01 cigarettes  Cigarettes     605.465890
#> 166 2004-10-01 cigarettes  Cigarettes     649.767945
#> 167 2004-11-01 cigarettes  Cigarettes     635.241581
#> 168 2004-12-01 cigarettes  Cigarettes     512.195993
#> 169 2005-01-01 cigarettes  Cigarettes     797.097463
#> 170 2005-02-01 cigarettes  Cigarettes     726.801324
#> 171 2005-03-01 cigarettes  Cigarettes     370.881338
#> 172 2005-04-01 cigarettes  Cigarettes    1069.384795
#> 173 2005-05-01 cigarettes  Cigarettes     225.088866
#> 174 2005-06-01 cigarettes  Cigarettes     616.770550
#> 175 2005-07-01 cigarettes  Cigarettes     688.196495
#> 176 2005-08-01 cigarettes  Cigarettes     601.172558
#> 177 2005-09-01 cigarettes  Cigarettes     640.341257
#> 178 2005-10-01 cigarettes  Cigarettes     693.939829
#> 179 2005-11-01 cigarettes  Cigarettes     876.053806
#> 180 2005-12-01 cigarettes  Cigarettes     291.192448
#> 181 2006-01-01 cigarettes  Cigarettes     754.573136
#> 182 2006-02-01 cigarettes  Cigarettes     471.425295
#> 183 2006-03-01 cigarettes  Cigarettes     544.497996
#> 184 2006-04-01 cigarettes  Cigarettes    1525.222887
#> 185 2006-05-01 cigarettes  Cigarettes      46.576593
#> 186 2006-06-01 cigarettes  Cigarettes     810.535511
#> 187 2006-07-01 cigarettes  Cigarettes     287.141988
#> 188 2006-08-01 cigarettes  Cigarettes     541.668292
#> 189 2006-09-01 cigarettes  Cigarettes     676.691017
#> 190 2006-10-01 cigarettes  Cigarettes     666.338650
#> 191 2006-11-01 cigarettes  Cigarettes     664.400620
#> 192 2006-12-01 cigarettes  Cigarettes     514.578196
#> 193 2007-01-01 cigarettes  Cigarettes     811.689306
#> 194 2007-02-01 cigarettes  Cigarettes     753.453013
#> 195 2007-03-01 cigarettes  Cigarettes     333.172356
#> 196 2007-04-01 cigarettes  Cigarettes    1034.492412
#> 197 2007-05-01 cigarettes  Cigarettes     276.425342
#> 198 2007-06-01 cigarettes  Cigarettes     629.288776
#> 199 2007-07-01 cigarettes  Cigarettes     665.897878
#> 200 2007-08-01 cigarettes  Cigarettes     558.748018
#> 201 2007-09-01 cigarettes  Cigarettes     650.388111
#> 202 2007-10-01 cigarettes  Cigarettes     658.371982
#> 203 2007-11-01 cigarettes  Cigarettes     616.132338
#> 204 2007-12-01 cigarettes  Cigarettes     520.041764
#> 205 2008-01-01 cigarettes  Cigarettes     632.830150
#> 206 2008-02-01 cigarettes  Cigarettes     860.362835
#> 207 2008-03-01 cigarettes  Cigarettes     445.560895
#> 208 2008-04-01 cigarettes  Cigarettes     923.973940
#> 209 2008-05-01 cigarettes  Cigarettes     264.591482
#> 210 2008-06-01 cigarettes  Cigarettes     592.881431
#> 211 2008-07-01 cigarettes  Cigarettes     630.526753
#> 212 2008-08-01 cigarettes  Cigarettes     671.545382
#> 213 2008-09-01 cigarettes  Cigarettes     634.119763
#> 214 2008-10-01 cigarettes  Cigarettes     702.844642
#> 215 2008-11-01 cigarettes  Cigarettes     653.429997
#> 216 2008-12-01 cigarettes  Cigarettes     571.971258
#> 217 2009-01-01 cigarettes  Cigarettes     649.786801
#> 218 2009-02-01 cigarettes  Cigarettes     774.457146
#> 219 2009-03-01 cigarettes  Cigarettes     531.229940
#> 220 2009-04-01 cigarettes  Cigarettes     623.118289
#> 221 2009-05-01 cigarettes  Cigarettes    1309.244522
#> 222 2009-06-01 cigarettes  Cigarettes     181.935467
#> 223 2009-07-01 cigarettes  Cigarettes     525.599331
#> 224 2009-08-01 cigarettes  Cigarettes     707.899517
#> 225 2009-09-01 cigarettes  Cigarettes     665.268759
#> 226 2009-10-01 cigarettes  Cigarettes     773.823437
#> 227 2009-11-01 cigarettes  Cigarettes     658.408204
#> 228 2009-12-01 cigarettes  Cigarettes     649.800580
#> 229 2010-01-01 cigarettes  Cigarettes     907.578477
#> 230 2010-02-01 cigarettes  Cigarettes     677.142460
#> 231 2010-03-01 cigarettes  Cigarettes     379.863867
#> 232 2010-04-01 cigarettes  Cigarettes    1196.310826
#> 233 2010-05-01 cigarettes  Cigarettes     214.437116
#> 234 2010-06-01 cigarettes  Cigarettes     596.759023
#> 235 2010-07-01 cigarettes  Cigarettes    1169.931374
#> 236 2010-08-01 cigarettes  Cigarettes     353.781972
#> 237 2010-09-01 cigarettes  Cigarettes     666.544482
#> 238 2010-10-01 cigarettes  Cigarettes     954.462274
#> 239 2010-11-01 cigarettes  Cigarettes     526.433850
#> 240 2010-12-01 cigarettes  Cigarettes     609.237783
#> 241 2011-01-01 cigarettes  Cigarettes     924.507611
#> 242 2011-02-01 cigarettes  Cigarettes     744.093317
#> 243 2011-03-01 cigarettes  Cigarettes     369.032793
#> 244 2011-04-01 cigarettes  Cigarettes    1353.745014
#> 245 2011-05-01 cigarettes  Cigarettes     144.687307
#> 246 2011-06-01 cigarettes  Cigarettes     591.464261
#> 247 2011-07-01 cigarettes  Cigarettes     723.630295
#> 248 2011-08-01 cigarettes  Cigarettes     725.844043
#> 249 2011-09-01 cigarettes  Cigarettes     787.833204
#> 250 2011-10-01 cigarettes  Cigarettes     843.829546
#> 251 2011-11-01 cigarettes  Cigarettes     951.488183
#> 252 2011-12-01 cigarettes  Cigarettes     395.934310
#> 253 2012-01-01 cigarettes  Cigarettes     761.382162
#> 254 2012-02-01 cigarettes  Cigarettes     591.669844
#> 255 2012-03-01 cigarettes  Cigarettes     671.468380
#> 256 2012-04-01 cigarettes  Cigarettes    1619.196126
#> 257 2012-05-01 cigarettes  Cigarettes     104.172442
#> 258 2012-06-01 cigarettes  Cigarettes     526.842512
#> 259 2012-07-01 cigarettes  Cigarettes     681.508557
#> 260 2012-08-01 cigarettes  Cigarettes     962.804464
#> 261 2012-09-01 cigarettes  Cigarettes     582.187324
#> 262 2012-10-01 cigarettes  Cigarettes     873.573204
#> 263 2012-11-01 cigarettes  Cigarettes     681.253085
#> 264 2012-12-01 cigarettes  Cigarettes     534.501011
#> 265 2013-01-01 cigarettes  Cigarettes     938.159925
#> 266 2013-02-01 cigarettes  Cigarettes     492.377921
#> 267 2013-03-01 cigarettes  Cigarettes     562.124462
#> 268 2013-04-01 cigarettes  Cigarettes    1510.095422
#> 269 2013-05-01 cigarettes  Cigarettes     174.606891
#> 270 2013-06-01 cigarettes  Cigarettes     481.441116
#> 271 2013-07-01 cigarettes  Cigarettes     642.051586
#> 272 2013-08-01 cigarettes  Cigarettes     774.062098
#> 273 2013-09-01 cigarettes  Cigarettes     718.936719
#> 274 2013-10-01 cigarettes  Cigarettes     853.210136
#> 275 2013-11-01 cigarettes  Cigarettes     760.245322
#> 276 2013-12-01 cigarettes  Cigarettes     440.559960
#> 277 2014-01-01 cigarettes  Cigarettes     883.379639
#> 278 2014-02-01 cigarettes  Cigarettes     541.031096
#> 279 2014-03-01 cigarettes  Cigarettes     551.307028
#> 280 2014-04-01 cigarettes  Cigarettes    1513.505136
#> 281 2014-05-01 cigarettes  Cigarettes     204.306104
#> 282 2014-06-01 cigarettes  Cigarettes     509.696107
#> 283 2014-07-01 cigarettes  Cigarettes     577.606992
#> 284 2014-08-01 cigarettes  Cigarettes     827.608100
#> 285 2014-09-01 cigarettes  Cigarettes     553.882322
#> 286 2014-10-01 cigarettes  Cigarettes     822.178448
#> 287 2014-11-01 cigarettes  Cigarettes     742.504287
#> 288 2014-12-01 cigarettes  Cigarettes     498.264567
#> 289 2015-01-01 cigarettes  Cigarettes     862.065685
#> 290 2015-02-01 cigarettes  Cigarettes     521.435024
#> 291 2015-03-01 cigarettes  Cigarettes     666.101811
#> 292 2015-04-01 cigarettes  Cigarettes    1261.428605
#> 293 2015-05-01 cigarettes  Cigarettes     203.500711
#> 294 2015-06-01 cigarettes  Cigarettes     491.963376
#> 295 2015-07-01 cigarettes  Cigarettes     660.001859
#> 296 2015-08-01 cigarettes  Cigarettes    1072.372208
#> 297 2015-09-01 cigarettes  Cigarettes     400.842578
#> 298 2015-10-01 cigarettes  Cigarettes     740.563950
#> 299 2015-11-01 cigarettes  Cigarettes     738.954992
#> 300 2015-12-01 cigarettes  Cigarettes     412.655977
#> 301 2016-01-01 cigarettes  Cigarettes     783.097899
#> 302 2016-02-01 cigarettes  Cigarettes     548.194803
#> 303 2016-03-01 cigarettes  Cigarettes     919.039967
#> 304 2016-04-01 cigarettes  Cigarettes     892.653806
#> 305 2016-05-01 cigarettes  Cigarettes     233.349244
#> 306 2016-06-01 cigarettes  Cigarettes     537.778960
#> 307 2016-07-01 cigarettes  Cigarettes     623.097522
#> 308 2016-08-01 cigarettes  Cigarettes     654.371157
#> 309 2016-09-01 cigarettes  Cigarettes     721.398154
#> 310 2016-10-01 cigarettes  Cigarettes     727.386126
#> 311 2016-11-01 cigarettes  Cigarettes     623.862726
#> 312 2016-12-01 cigarettes  Cigarettes     529.311524
#> 313 2017-01-01 cigarettes  Cigarettes     764.292469
#> 314 2017-02-01 cigarettes  Cigarettes     617.395125
#> 315 2017-03-01 cigarettes  Cigarettes     659.831761
#> 316 2017-04-01 cigarettes  Cigarettes     696.278855
#> 317 2017-05-01 cigarettes  Cigarettes     413.292013
#> 318 2017-06-01 cigarettes  Cigarettes     639.446495
#> 319 2017-07-01 cigarettes  Cigarettes     687.769298
#> 320 2017-08-01 cigarettes  Cigarettes     637.078384
#> 321 2017-09-01 cigarettes  Cigarettes     722.395934
#> 322 2017-10-01 cigarettes  Cigarettes     632.814717
#> 323 2017-11-01 cigarettes  Cigarettes     538.110483
#> 324 2017-12-01 cigarettes  Cigarettes     997.919557
#> 325 2018-01-01 cigarettes  Cigarettes     453.319288
#> 326 2018-02-01 cigarettes  Cigarettes     434.315744
#> 327 2018-03-01 cigarettes  Cigarettes     566.266636
#> 328 2018-04-01 cigarettes  Cigarettes     652.092771
#> 329 2018-05-01 cigarettes  Cigarettes     848.112784
#> 330 2018-06-01 cigarettes  Cigarettes     519.637075
#> 331 2018-07-01 cigarettes  Cigarettes     671.712875
#> 332 2018-08-01 cigarettes  Cigarettes     612.614181
#> 333 2018-09-01 cigarettes  Cigarettes     772.415966
#> 334 2018-10-01 cigarettes  Cigarettes     591.776734
#> 335 2018-11-01 cigarettes  Cigarettes     990.764052
#> 336 2018-12-01 cigarettes  Cigarettes     226.438060
#> 337 2019-01-01 cigarettes  Cigarettes     578.883880
#> 338 2019-02-01 cigarettes  Cigarettes     533.790080
#> 339 2019-03-01 cigarettes  Cigarettes     749.596851
#> 340 2019-04-01 cigarettes  Cigarettes     511.586612
#> 341 2019-05-01 cigarettes  Cigarettes     522.732465
#> 342 2019-06-01 cigarettes  Cigarettes     626.782322
#> 343 2019-07-01 cigarettes  Cigarettes     598.697332
#> 344 2019-08-01 cigarettes  Cigarettes     717.249169
#> 345 2019-09-01 cigarettes  Cigarettes     767.217963
#> 346 2019-10-01 cigarettes  Cigarettes     540.526710
#> 347 2019-11-01 cigarettes  Cigarettes     504.989903
#> 348 2019-12-01 cigarettes  Cigarettes     470.944406
#> 349 2020-01-01 cigarettes  Cigarettes     867.997752
#> 350 2020-02-01 cigarettes  Cigarettes     378.778732
#> 351 2020-03-01 cigarettes  Cigarettes     643.024636
#> 352 2020-04-01 cigarettes  Cigarettes    1228.302326
#> 353 2020-05-01 cigarettes  Cigarettes     182.617374
#> 354 2020-06-01 cigarettes  Cigarettes     385.508376
#> 355 2020-07-01 cigarettes  Cigarettes     657.470910
#> 356 2020-08-01 cigarettes  Cigarettes     680.085955
#> 357 2020-09-01 cigarettes  Cigarettes     825.427253
#> 358 2020-10-01 cigarettes  Cigarettes     634.413447
#> 359 2020-11-01 cigarettes  Cigarettes     667.623978
#> 360 2020-12-01 cigarettes  Cigarettes     516.693018
#> 361 2021-01-01 cigarettes  Cigarettes     759.497861
#> 362 2021-02-01 cigarettes  Cigarettes     436.211619
#> 363 2021-03-01 cigarettes  Cigarettes     644.040763
#> 364 2021-04-01 cigarettes  Cigarettes     961.462918
#> 365 2021-05-01 cigarettes  Cigarettes     363.516200
#> 366 2021-06-01 cigarettes  Cigarettes     466.739880
#> 367 2021-07-01 cigarettes  Cigarettes     902.397277
#> 368 2021-08-01 cigarettes  Cigarettes     550.213433
#> 369 2021-09-01 cigarettes  Cigarettes     916.231027
#> 370 2021-10-01 cigarettes  Cigarettes     560.637170
#> 371 2021-11-01 cigarettes  Cigarettes     676.429605
#> 372 2021-12-01 cigarettes  Cigarettes     544.214519
#> 373 2022-01-01 cigarettes  Cigarettes     670.575754
#> 374 2022-02-01 cigarettes  Cigarettes     508.170467
#> 375 2022-03-01 cigarettes  Cigarettes     583.019910
#> 376 2022-04-01 cigarettes  Cigarettes    1060.736352
#> 377 2022-05-01 cigarettes  Cigarettes     420.467091
#> 378 2022-06-01 cigarettes  Cigarettes     477.224499
#> 379 2022-07-01 cigarettes  Cigarettes     675.107806
#> 380 2022-08-01 cigarettes  Cigarettes     590.675633
#> 381 2022-09-01 cigarettes  Cigarettes     945.338117
#> 382 2022-10-01 cigarettes  Cigarettes     490.096360
#> 383 2022-11-01 cigarettes  Cigarettes     544.792760
#> 384 2022-12-01 cigarettes  Cigarettes     769.011667
#> 385 2023-01-01 cigarettes  Cigarettes     556.970566
#> 386 2023-02-01 cigarettes  Cigarettes     444.326303
#> 387 2023-03-01 cigarettes  Cigarettes     593.514146
#> 388 2023-04-01 cigarettes  Cigarettes     474.560373
#> 389 2023-05-01 cigarettes  Cigarettes     366.961609
#> 390 2023-06-01 cigarettes  Cigarettes     432.411375
#> 391 2023-07-01 cigarettes  Cigarettes     676.670933
#> 392 2023-08-01 cigarettes  Cigarettes     675.345924
#> 393 2023-09-01 cigarettes  Cigarettes     710.231245
#> 394 2023-10-01 cigarettes  Cigarettes     532.035958
#> 395 2023-11-01 cigarettes  Cigarettes     492.756373
#> 396 2023-12-01 cigarettes  Cigarettes     535.125830
#> 397 2024-01-01 cigarettes  Cigarettes     694.375052
#> 398 2024-02-01 cigarettes  Cigarettes     478.389602
#> 399 2024-03-01 cigarettes  Cigarettes     466.002514
#> 400 2024-04-01 cigarettes  Cigarettes     617.149591
#> 401 2024-05-01 cigarettes  Cigarettes     352.324350
#> 402 2024-06-01 cigarettes  Cigarettes     447.415385
#> 403 2024-07-01 cigarettes  Cigarettes     578.520047
#> 404 2024-08-01 cigarettes  Cigarettes     620.554773
#> 405 2024-09-01 cigarettes  Cigarettes     590.889011
#> 406 2024-10-01 cigarettes  Cigarettes     471.003392
#> 407 2024-11-01 cigarettes  Cigarettes     526.459116
#> 408 2024-12-01 cigarettes  Cigarettes     386.128084
#> 409 2025-01-01 cigarettes  Cigarettes     459.077197
#> 410 2025-02-01 cigarettes  Cigarettes     548.686643
#> 411 2025-03-01 cigarettes  Cigarettes     315.631607
#> 412 2025-04-01 cigarettes  Cigarettes     621.779562
#> 413 2025-05-01 cigarettes  Cigarettes     440.795137
#> 414 2025-06-01 cigarettes  Cigarettes     493.379465
#> 415 2025-07-01 cigarettes  Cigarettes     590.218282
#> 416 2025-08-01 cigarettes  Cigarettes     477.059103
#> 417 2025-09-01 cigarettes  Cigarettes     564.460573
#> 418 2025-10-01 cigarettes  Cigarettes     442.521576
#> 419 2025-11-01 cigarettes  Cigarettes     436.693779
#> 420 2025-12-01 cigarettes  Cigarettes     468.690760
#> 421 2026-01-01 cigarettes  Cigarettes     335.875472
options(op)
# }
```
