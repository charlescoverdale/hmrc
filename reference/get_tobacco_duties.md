# Download HMRC tobacco duty receipts

Downloads and tidies the HMRC Tobacco Bulletin, which reports monthly
tobacco products duty receipts by product type. Data runs from January
1991 to the most recent published month, updated twice per year
(February and August).

## Usage

``` r
get_tobacco_duties(product = NULL, start = NULL, end = NULL, cache = TRUE)
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

A data frame with columns:

- date:

  `Date`. First day of the reference month.

- product:

  Character. Product type identifier.

- description:

  Character. Plain-English product label.

- receipts_gbp_m:

  Numeric. Duty receipts in millions of pounds.

## See also

Other duties:
[`get_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/get_fuel_duties.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
# All products since 2015
get_tobacco_duties(start = "2015-01")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [122ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [424ms]
#> 
#> ℹ Parsing data
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> ✔ Parsing data [109ms]
#> 
#>            date      product            description receipts_gbp_m
#> 289  2015-01-01   cigarettes             Cigarettes    862.0656853
#> 290  2015-02-01   cigarettes             Cigarettes    521.4350242
#> 291  2015-03-01   cigarettes             Cigarettes    666.1018111
#> 292  2015-04-01   cigarettes             Cigarettes   1261.4286049
#> 293  2015-05-01   cigarettes             Cigarettes    203.5007113
#> 294  2015-06-01   cigarettes             Cigarettes    491.9633763
#> 295  2015-07-01   cigarettes             Cigarettes    660.0018586
#> 296  2015-08-01   cigarettes             Cigarettes   1072.3722080
#> 297  2015-09-01   cigarettes             Cigarettes    400.8425784
#> 298  2015-10-01   cigarettes             Cigarettes    740.5639497
#> 299  2015-11-01   cigarettes             Cigarettes    738.9549925
#> 300  2015-12-01   cigarettes             Cigarettes    412.6559766
#> 301  2016-01-01   cigarettes             Cigarettes    783.0978989
#> 302  2016-02-01   cigarettes             Cigarettes    548.1948031
#> 303  2016-03-01   cigarettes             Cigarettes    919.0399674
#> 304  2016-04-01   cigarettes             Cigarettes    892.6538058
#> 305  2016-05-01   cigarettes             Cigarettes    233.3492436
#> 306  2016-06-01   cigarettes             Cigarettes    537.7789601
#> 307  2016-07-01   cigarettes             Cigarettes    623.0975222
#> 308  2016-08-01   cigarettes             Cigarettes    654.3711575
#> 309  2016-09-01   cigarettes             Cigarettes    721.3981539
#> 310  2016-10-01   cigarettes             Cigarettes    727.3861262
#> 311  2016-11-01   cigarettes             Cigarettes    623.8627261
#> 312  2016-12-01   cigarettes             Cigarettes    529.3115238
#> 313  2017-01-01   cigarettes             Cigarettes    764.2924688
#> 314  2017-02-01   cigarettes             Cigarettes    617.3951252
#> 315  2017-03-01   cigarettes             Cigarettes    659.8317612
#> 316  2017-04-01   cigarettes             Cigarettes    696.2788547
#> 317  2017-05-01   cigarettes             Cigarettes    413.2920131
#> 318  2017-06-01   cigarettes             Cigarettes    639.4464948
#> 319  2017-07-01   cigarettes             Cigarettes    687.7692975
#> 320  2017-08-01   cigarettes             Cigarettes    637.0783845
#> 321  2017-09-01   cigarettes             Cigarettes    722.3959343
#> 322  2017-10-01   cigarettes             Cigarettes    632.8147165
#> 323  2017-11-01   cigarettes             Cigarettes    538.1104826
#> 324  2017-12-01   cigarettes             Cigarettes    997.9195567
#> 325  2018-01-01   cigarettes             Cigarettes    453.3192877
#> 326  2018-02-01   cigarettes             Cigarettes    434.3157435
#> 327  2018-03-01   cigarettes             Cigarettes    566.2666363
#> 328  2018-04-01   cigarettes             Cigarettes    652.0927709
#> 329  2018-05-01   cigarettes             Cigarettes    848.1127845
#> 330  2018-06-01   cigarettes             Cigarettes    519.6370747
#> 331  2018-07-01   cigarettes             Cigarettes    671.7128750
#> 332  2018-08-01   cigarettes             Cigarettes    612.6141810
#> 333  2018-09-01   cigarettes             Cigarettes    772.4159656
#> 334  2018-10-01   cigarettes             Cigarettes    591.7767336
#> 335  2018-11-01   cigarettes             Cigarettes    990.7640516
#> 336  2018-12-01   cigarettes             Cigarettes    226.4380604
#> 337  2019-01-01   cigarettes             Cigarettes    578.8838797
#> 338  2019-02-01   cigarettes             Cigarettes    533.7900804
#> 339  2019-03-01   cigarettes             Cigarettes    749.5968509
#> 340  2019-04-01   cigarettes             Cigarettes    511.5866120
#> 341  2019-05-01   cigarettes             Cigarettes    522.7324652
#> 342  2019-06-01   cigarettes             Cigarettes    626.7823225
#> 343  2019-07-01   cigarettes             Cigarettes    598.6973317
#> 344  2019-08-01   cigarettes             Cigarettes    717.2491691
#> 345  2019-09-01   cigarettes             Cigarettes    767.2179633
#> 346  2019-10-01   cigarettes             Cigarettes    540.5267096
#> 347  2019-11-01   cigarettes             Cigarettes    504.9899030
#> 348  2019-12-01   cigarettes             Cigarettes    470.9444060
#> 349  2020-01-01   cigarettes             Cigarettes    867.9977522
#> 350  2020-02-01   cigarettes             Cigarettes    378.7787325
#> 351  2020-03-01   cigarettes             Cigarettes    643.0246358
#> 352  2020-04-01   cigarettes             Cigarettes   1228.3023259
#> 353  2020-05-01   cigarettes             Cigarettes    182.6173742
#> 354  2020-06-01   cigarettes             Cigarettes    385.5083757
#> 355  2020-07-01   cigarettes             Cigarettes    657.4709098
#> 356  2020-08-01   cigarettes             Cigarettes    680.0859550
#> 357  2020-09-01   cigarettes             Cigarettes    825.4272529
#> 358  2020-10-01   cigarettes             Cigarettes    634.4134470
#> 359  2020-11-01   cigarettes             Cigarettes    667.6239778
#> 360  2020-12-01   cigarettes             Cigarettes    516.6930184
#> 361  2021-01-01   cigarettes             Cigarettes    759.4978606
#> 362  2021-02-01   cigarettes             Cigarettes    436.2116186
#> 363  2021-03-01   cigarettes             Cigarettes    644.0407626
#> 364  2021-04-01   cigarettes             Cigarettes    961.4629177
#> 365  2021-05-01   cigarettes             Cigarettes    363.5162003
#> 366  2021-06-01   cigarettes             Cigarettes    466.7398800
#> 367  2021-07-01   cigarettes             Cigarettes    902.3972769
#> 368  2021-08-01   cigarettes             Cigarettes    550.2134326
#> 369  2021-09-01   cigarettes             Cigarettes    916.2310273
#> 370  2021-10-01   cigarettes             Cigarettes    560.6371702
#> 371  2021-11-01   cigarettes             Cigarettes    676.4296053
#> 372  2021-12-01   cigarettes             Cigarettes    544.2145185
#> 373  2022-01-01   cigarettes             Cigarettes    670.5757539
#> 374  2022-02-01   cigarettes             Cigarettes    508.1704671
#> 375  2022-03-01   cigarettes             Cigarettes    583.0199101
#> 376  2022-04-01   cigarettes             Cigarettes   1060.7363518
#> 377  2022-05-01   cigarettes             Cigarettes    420.4670914
#> 378  2022-06-01   cigarettes             Cigarettes    477.2244988
#> 379  2022-07-01   cigarettes             Cigarettes    675.1078061
#> 380  2022-08-01   cigarettes             Cigarettes    590.6756335
#> 381  2022-09-01   cigarettes             Cigarettes    945.3381168
#> 382  2022-10-01   cigarettes             Cigarettes    490.0963599
#> 383  2022-11-01   cigarettes             Cigarettes    544.7927600
#> 384  2022-12-01   cigarettes             Cigarettes    769.0116667
#> 385  2023-01-01   cigarettes             Cigarettes    556.9705659
#> 386  2023-02-01   cigarettes             Cigarettes    444.3263030
#> 387  2023-03-01   cigarettes             Cigarettes    593.5141464
#> 388  2023-04-01   cigarettes             Cigarettes    474.5603726
#> 389  2023-05-01   cigarettes             Cigarettes    366.9616092
#> 390  2023-06-01   cigarettes             Cigarettes    432.4113751
#> 391  2023-07-01   cigarettes             Cigarettes    676.6709333
#> 392  2023-08-01   cigarettes             Cigarettes    675.3459240
#> 393  2023-09-01   cigarettes             Cigarettes    710.2312447
#> 394  2023-10-01   cigarettes             Cigarettes    532.0359583
#> 395  2023-11-01   cigarettes             Cigarettes    492.7563734
#> 396  2023-12-01   cigarettes             Cigarettes    535.1258298
#> 397  2024-01-01   cigarettes             Cigarettes    694.3750517
#> 398  2024-02-01   cigarettes             Cigarettes    478.3896020
#> 399  2024-03-01   cigarettes             Cigarettes    466.0025136
#> 400  2024-04-01   cigarettes             Cigarettes    617.1495907
#> 401  2024-05-01   cigarettes             Cigarettes    352.3243500
#> 402  2024-06-01   cigarettes             Cigarettes    447.4153851
#> 403  2024-07-01   cigarettes             Cigarettes    578.5200471
#> 404  2024-08-01   cigarettes             Cigarettes    620.5547732
#> 405  2024-09-01   cigarettes             Cigarettes    590.8890108
#> 406  2024-10-01   cigarettes             Cigarettes    471.0033925
#> 407  2024-11-01   cigarettes             Cigarettes    526.4591163
#> 408  2024-12-01   cigarettes             Cigarettes    386.1280838
#> 409  2025-01-01   cigarettes             Cigarettes    459.0771967
#> 410  2025-02-01   cigarettes             Cigarettes    548.6866433
#> 411  2025-03-01   cigarettes             Cigarettes    315.6316069
#> 412  2025-04-01   cigarettes             Cigarettes    621.7795624
#> 413  2025-05-01   cigarettes             Cigarettes    440.7951370
#> 414  2025-06-01   cigarettes             Cigarettes    493.3794652
#> 415  2025-07-01   cigarettes             Cigarettes    590.2182821
#> 416  2025-08-01   cigarettes             Cigarettes    477.0591035
#> 417  2025-09-01   cigarettes             Cigarettes    564.4605731
#> 418  2025-10-01   cigarettes             Cigarettes    442.5215765
#> 419  2025-11-01   cigarettes             Cigarettes    436.6937788
#> 420  2025-12-01   cigarettes             Cigarettes    468.6907599
#> 421  2026-01-01   cigarettes             Cigarettes    335.8754719
#> 710  2015-01-01       cigars                 Cigars      7.8785909
#> 711  2015-02-01       cigars                 Cigars      6.0995474
#> 712  2015-03-01       cigars                 Cigars      6.6080731
#> 713  2015-04-01       cigars                 Cigars     12.3833481
#> 714  2015-05-01       cigars                 Cigars      2.6802062
#> 715  2015-06-01       cigars                 Cigars      7.0539740
#> 716  2015-07-01       cigars                 Cigars      4.8254371
#> 717  2015-08-01       cigars                 Cigars      6.1394868
#> 718  2015-09-01       cigars                 Cigars      5.7634705
#> 719  2015-10-01       cigars                 Cigars      5.9899610
#> 720  2015-11-01       cigars                 Cigars      6.2830437
#> 721  2015-12-01       cigars                 Cigars      6.5766839
#> 722  2016-01-01       cigars                 Cigars      6.1763243
#> 723  2016-02-01       cigars                 Cigars     10.2111931
#> 724  2016-03-01       cigars                 Cigars     11.8752729
#> 725  2016-04-01       cigars                 Cigars      4.5781139
#> 726  2016-05-01       cigars                 Cigars      2.7996422
#> 727  2016-06-01       cigars                 Cigars      3.4341334
#> 728  2016-07-01       cigars                 Cigars      4.7275736
#> 729  2016-08-01       cigars                 Cigars      5.5424121
#> 730  2016-09-01       cigars                 Cigars      5.7633660
#> 731  2016-10-01       cigars                 Cigars      6.2869217
#> 732  2016-11-01       cigars                 Cigars      6.0595061
#> 733  2016-12-01       cigars                 Cigars      5.3939746
#> 734  2017-01-01       cigars                 Cigars      7.6770048
#> 735  2017-02-01       cigars                 Cigars      4.9160551
#> 736  2017-03-01       cigars                 Cigars     14.1032452
#> 737  2017-04-01       cigars                 Cigars      7.7861891
#> 738  2017-05-01       cigars                 Cigars      2.7018153
#> 739  2017-06-01       cigars                 Cigars      3.3544994
#> 740  2017-07-01       cigars                 Cigars      4.3555160
#> 741  2017-08-01       cigars                 Cigars      4.6053771
#> 742  2017-09-01       cigars                 Cigars      5.9472645
#> 743  2017-10-01       cigars                 Cigars      6.2966490
#> 744  2017-11-01       cigars                 Cigars      6.3669846
#> 745  2017-12-01       cigars                 Cigars      7.5651806
#> 746  2018-01-01       cigars                 Cigars      4.9490104
#> 747  2018-02-01       cigars                 Cigars      5.2220374
#> 748  2018-03-01       cigars                 Cigars      4.6591081
#> 749  2018-04-01       cigars                 Cigars      6.5361911
#> 750  2018-05-01       cigars                 Cigars      6.2114491
#> 751  2018-06-01       cigars                 Cigars      6.1485152
#> 752  2018-07-01       cigars                 Cigars      6.9705156
#> 753  2018-08-01       cigars                 Cigars      5.8258765
#> 754  2018-09-01       cigars                 Cigars      7.4780885
#> 755  2018-10-01       cigars                 Cigars      6.3333131
#> 756  2018-11-01       cigars                 Cigars     10.6723182
#> 757  2018-12-01       cigars                 Cigars      3.4819085
#> 758  2019-01-01       cigars                 Cigars      4.8296319
#> 759  2019-02-01       cigars                 Cigars      5.0980561
#> 760  2019-03-01       cigars                 Cigars      4.7287181
#> 761  2019-04-01       cigars                 Cigars      6.3740216
#> 762  2019-05-01       cigars                 Cigars      6.3391325
#> 763  2019-06-01       cigars                 Cigars      6.0085321
#> 764  2019-07-01       cigars                 Cigars      6.5257744
#> 765  2019-08-01       cigars                 Cigars      5.8861968
#> 766  2019-09-01       cigars                 Cigars      7.1916735
#> 767  2019-10-01       cigars                 Cigars      6.3243657
#> 768  2019-11-01       cigars                 Cigars     10.2636497
#> 769  2019-12-01       cigars                 Cigars      3.5575226
#> 770  2020-01-01       cigars                 Cigars      7.4836829
#> 771  2020-02-01       cigars                 Cigars      5.0198839
#> 772  2020-03-01       cigars                 Cigars     21.8125447
#> 773  2020-04-01       cigars                 Cigars      7.2748921
#> 774  2020-05-01       cigars                 Cigars      2.4833984
#> 775  2020-06-01       cigars                 Cigars      3.0538119
#> 776  2020-07-01       cigars                 Cigars      7.0370045
#> 777  2020-08-01       cigars                 Cigars      9.9812844
#> 778  2020-09-01       cigars                 Cigars      8.4631731
#> 779  2020-10-01       cigars                 Cigars     10.3652211
#> 780  2020-11-01       cigars                 Cigars     21.7722781
#> 781  2020-12-01       cigars                 Cigars      9.9517230
#> 782  2021-01-01       cigars                 Cigars      5.6615662
#> 783  2021-02-01       cigars                 Cigars      9.4361194
#> 784  2021-03-01       cigars                 Cigars     13.8645109
#> 785  2021-04-01       cigars                 Cigars      8.3584520
#> 786  2021-05-01       cigars                 Cigars      8.6625619
#> 787  2021-06-01       cigars                 Cigars      9.8141209
#> 788  2021-07-01       cigars                 Cigars     14.3247546
#> 789  2021-08-01       cigars                 Cigars     10.5439602
#> 790  2021-09-01       cigars                 Cigars     11.4432522
#> 791  2021-10-01       cigars                 Cigars     11.3392715
#> 792  2021-11-01       cigars                 Cigars     16.7196147
#> 793  2021-12-01       cigars                 Cigars      8.7546888
#> 794  2022-01-01       cigars                 Cigars      8.7893287
#> 795  2022-02-01       cigars                 Cigars     10.2044731
#> 796  2022-03-01       cigars                 Cigars      9.5588572
#> 797  2022-04-01       cigars                 Cigars     12.6353597
#> 798  2022-05-01       cigars                 Cigars      9.8400353
#> 799  2022-06-01       cigars                 Cigars     13.8525626
#> 800  2022-07-01       cigars                 Cigars     12.7797552
#> 801  2022-08-01       cigars                 Cigars     10.8700397
#> 802  2022-09-01       cigars                 Cigars     17.8447571
#> 803  2022-10-01       cigars                 Cigars     10.5239315
#> 804  2022-11-01       cigars                 Cigars     10.4152324
#> 805  2022-12-01       cigars                 Cigars     15.5269147
#> 806  2023-01-01       cigars                 Cigars      7.9546769
#> 807  2023-02-01       cigars                 Cigars      9.2384860
#> 808  2023-03-01       cigars                 Cigars     17.7407059
#> 809  2023-04-01       cigars                 Cigars     10.5078787
#> 810  2023-05-01       cigars                 Cigars      9.3448069
#> 811  2023-06-01       cigars                 Cigars     10.3510227
#> 812  2023-07-01       cigars                 Cigars     11.0208665
#> 813  2023-08-01       cigars                 Cigars     10.8573460
#> 814  2023-09-01       cigars                 Cigars     15.3199871
#> 815  2023-10-01       cigars                 Cigars     11.4582702
#> 816  2023-11-01       cigars                 Cigars     13.3550191
#> 817  2023-12-01       cigars                 Cigars     18.6395099
#> 818  2024-01-01       cigars                 Cigars     11.5026006
#> 819  2024-02-01       cigars                 Cigars      8.0313110
#> 820  2024-03-01       cigars                 Cigars     19.1789108
#> 821  2024-04-01       cigars                 Cigars     13.4894600
#> 822  2024-05-01       cigars                 Cigars      9.2057234
#> 823  2024-06-01       cigars                 Cigars     12.1925787
#> 824  2024-07-01       cigars                 Cigars     13.2947335
#> 825  2024-08-01       cigars                 Cigars     15.0546176
#> 826  2024-09-01       cigars                 Cigars     15.4521396
#> 827  2024-10-01       cigars                 Cigars     17.0958868
#> 828  2024-11-01       cigars                 Cigars     25.9116419
#> 829  2024-12-01       cigars                 Cigars      5.0877754
#> 830  2025-01-01       cigars                 Cigars      7.4385300
#> 831  2025-02-01       cigars                 Cigars     12.8868034
#> 832  2025-03-01       cigars                 Cigars      9.6822073
#> 833  2025-04-01       cigars                 Cigars     15.2554551
#> 834  2025-05-01       cigars                 Cigars     12.8659986
#> 835  2025-06-01       cigars                 Cigars     13.2729790
#> 836  2025-07-01       cigars                 Cigars     14.1007624
#> 837  2025-08-01       cigars                 Cigars     15.8153227
#> 838  2025-09-01       cigars                 Cigars     10.1627098
#> 839  2025-10-01       cigars                 Cigars     12.9406948
#> 840  2025-11-01       cigars                 Cigars     13.2971913
#> 841  2025-12-01       cigars                 Cigars     16.5024589
#> 842  2026-01-01       cigars                 Cigars     11.0520167
#> 1131 2015-01-01 hand_rolling   Hand-rolling tobacco    122.0301667
#> 1132 2015-02-01 hand_rolling   Hand-rolling tobacco     70.2147767
#> 1133 2015-03-01 hand_rolling   Hand-rolling tobacco    103.1573954
#> 1134 2015-04-01 hand_rolling   Hand-rolling tobacco    176.0453336
#> 1135 2015-05-01 hand_rolling   Hand-rolling tobacco     29.4794772
#> 1136 2015-06-01 hand_rolling   Hand-rolling tobacco     71.4885642
#> 1137 2015-07-01 hand_rolling   Hand-rolling tobacco     89.7972134
#> 1138 2015-08-01 hand_rolling   Hand-rolling tobacco    136.6238862
#> 1139 2015-09-01 hand_rolling   Hand-rolling tobacco     59.1260464
#> 1140 2015-10-01 hand_rolling   Hand-rolling tobacco     97.1496217
#> 1141 2015-11-01 hand_rolling   Hand-rolling tobacco     92.4931120
#> 1142 2015-12-01 hand_rolling   Hand-rolling tobacco     86.7548505
#> 1143 2016-01-01 hand_rolling   Hand-rolling tobacco    123.9744591
#> 1144 2016-02-01 hand_rolling   Hand-rolling tobacco     73.9334358
#> 1145 2016-03-01 hand_rolling   Hand-rolling tobacco    106.1628494
#> 1146 2016-04-01 hand_rolling   Hand-rolling tobacco    174.2860928
#> 1147 2016-05-01 hand_rolling   Hand-rolling tobacco     31.6358959
#> 1148 2016-06-01 hand_rolling   Hand-rolling tobacco     81.8102189
#> 1149 2016-07-01 hand_rolling   Hand-rolling tobacco     96.4959662
#> 1150 2016-08-01 hand_rolling   Hand-rolling tobacco     98.1324832
#> 1151 2016-09-01 hand_rolling   Hand-rolling tobacco    114.1907427
#> 1152 2016-10-01 hand_rolling   Hand-rolling tobacco    121.8397691
#> 1153 2016-11-01 hand_rolling   Hand-rolling tobacco     85.7824967
#> 1154 2016-12-01 hand_rolling   Hand-rolling tobacco     96.0523473
#> 1155 2017-01-01 hand_rolling   Hand-rolling tobacco    135.7634789
#> 1156 2017-02-01 hand_rolling   Hand-rolling tobacco     91.7002864
#> 1157 2017-03-01 hand_rolling   Hand-rolling tobacco    103.8056430
#> 1158 2017-04-01 hand_rolling   Hand-rolling tobacco    138.0187252
#> 1159 2017-05-01 hand_rolling   Hand-rolling tobacco     70.9833069
#> 1160 2017-06-01 hand_rolling   Hand-rolling tobacco    109.4120767
#> 1161 2017-07-01 hand_rolling   Hand-rolling tobacco    106.0372148
#> 1162 2017-08-01 hand_rolling   Hand-rolling tobacco    113.3950820
#> 1163 2017-09-01 hand_rolling   Hand-rolling tobacco    120.5843558
#> 1164 2017-10-01 hand_rolling   Hand-rolling tobacco    112.2743566
#> 1165 2017-11-01 hand_rolling   Hand-rolling tobacco    107.0665990
#> 1166 2017-12-01 hand_rolling   Hand-rolling tobacco    162.1712081
#> 1167 2018-01-01 hand_rolling   Hand-rolling tobacco     93.4805327
#> 1168 2018-02-01 hand_rolling   Hand-rolling tobacco     81.8722535
#> 1169 2018-03-01 hand_rolling   Hand-rolling tobacco    105.0293105
#> 1170 2018-04-01 hand_rolling   Hand-rolling tobacco    123.1655576
#> 1171 2018-05-01 hand_rolling   Hand-rolling tobacco    113.5850464
#> 1172 2018-06-01 hand_rolling   Hand-rolling tobacco    123.3926221
#> 1173 2018-07-01 hand_rolling   Hand-rolling tobacco    122.6281466
#> 1174 2018-08-01 hand_rolling   Hand-rolling tobacco    123.0568548
#> 1175 2018-09-01 hand_rolling   Hand-rolling tobacco    138.8142549
#> 1176 2018-10-01 hand_rolling   Hand-rolling tobacco    105.2423758
#> 1177 2018-11-01 hand_rolling   Hand-rolling tobacco    236.8745790
#> 1178 2018-12-01 hand_rolling   Hand-rolling tobacco     37.9719611
#> 1179 2019-01-01 hand_rolling   Hand-rolling tobacco    101.2322231
#> 1180 2019-02-01 hand_rolling   Hand-rolling tobacco    107.4184450
#> 1181 2019-03-01 hand_rolling   Hand-rolling tobacco    110.6975244
#> 1182 2019-04-01 hand_rolling   Hand-rolling tobacco    127.6403628
#> 1183 2019-05-01 hand_rolling   Hand-rolling tobacco    117.1069224
#> 1184 2019-06-01 hand_rolling   Hand-rolling tobacco    132.6318513
#> 1185 2019-07-01 hand_rolling   Hand-rolling tobacco    117.0505924
#> 1186 2019-08-01 hand_rolling   Hand-rolling tobacco    162.7711343
#> 1187 2019-09-01 hand_rolling   Hand-rolling tobacco    137.9836199
#> 1188 2019-10-01 hand_rolling   Hand-rolling tobacco    117.8014458
#> 1189 2019-11-01 hand_rolling   Hand-rolling tobacco    118.8148912
#> 1190 2019-12-01 hand_rolling   Hand-rolling tobacco    113.1924149
#> 1191 2020-01-01 hand_rolling   Hand-rolling tobacco    168.6487820
#> 1192 2020-02-01 hand_rolling   Hand-rolling tobacco     88.6235208
#> 1193 2020-03-01 hand_rolling   Hand-rolling tobacco    131.8876261
#> 1194 2020-04-01 hand_rolling   Hand-rolling tobacco    300.4117752
#> 1195 2020-05-01 hand_rolling   Hand-rolling tobacco     43.3836651
#> 1196 2020-06-01 hand_rolling   Hand-rolling tobacco    149.3840521
#> 1197 2020-07-01 hand_rolling   Hand-rolling tobacco    204.0285634
#> 1198 2020-08-01 hand_rolling   Hand-rolling tobacco    193.9733826
#> 1199 2020-09-01 hand_rolling   Hand-rolling tobacco    215.6618899
#> 1200 2020-10-01 hand_rolling   Hand-rolling tobacco    178.7310653
#> 1201 2020-11-01 hand_rolling   Hand-rolling tobacco    187.0926319
#> 1202 2020-12-01 hand_rolling   Hand-rolling tobacco    168.4230217
#> 1203 2021-01-01 hand_rolling   Hand-rolling tobacco    209.4668890
#> 1204 2021-02-01 hand_rolling   Hand-rolling tobacco    140.2638306
#> 1205 2021-03-01 hand_rolling   Hand-rolling tobacco    196.7040269
#> 1206 2021-04-01 hand_rolling   Hand-rolling tobacco    390.6899445
#> 1207 2021-05-01 hand_rolling   Hand-rolling tobacco     76.1664530
#> 1208 2021-06-01 hand_rolling   Hand-rolling tobacco    132.4389150
#> 1209 2021-07-01 hand_rolling   Hand-rolling tobacco    288.8361152
#> 1210 2021-08-01 hand_rolling   Hand-rolling tobacco    141.0466609
#> 1211 2021-09-01 hand_rolling   Hand-rolling tobacco    241.2572578
#> 1212 2021-10-01 hand_rolling   Hand-rolling tobacco    176.5260403
#> 1213 2021-11-01 hand_rolling   Hand-rolling tobacco    208.2775529
#> 1214 2021-12-01 hand_rolling   Hand-rolling tobacco    182.9615980
#> 1215 2022-01-01 hand_rolling   Hand-rolling tobacco    194.3418490
#> 1216 2022-02-01 hand_rolling   Hand-rolling tobacco    173.5330505
#> 1217 2022-03-01 hand_rolling   Hand-rolling tobacco    183.7153012
#> 1218 2022-04-01 hand_rolling   Hand-rolling tobacco    197.0796221
#> 1219 2022-05-01 hand_rolling   Hand-rolling tobacco    178.5808392
#> 1220 2022-06-01 hand_rolling   Hand-rolling tobacco    199.0894105
#> 1221 2022-07-01 hand_rolling   Hand-rolling tobacco    208.4021916
#> 1222 2022-08-01 hand_rolling   Hand-rolling tobacco    164.3517029
#> 1223 2022-09-01 hand_rolling   Hand-rolling tobacco    252.6255901
#> 1224 2022-10-01 hand_rolling   Hand-rolling tobacco    170.5864677
#> 1225 2022-11-01 hand_rolling   Hand-rolling tobacco    153.0880451
#> 1226 2022-12-01 hand_rolling   Hand-rolling tobacco    196.5403008
#> 1227 2023-01-01 hand_rolling   Hand-rolling tobacco    177.9851042
#> 1228 2023-02-01 hand_rolling   Hand-rolling tobacco    123.1023264
#> 1229 2023-03-01 hand_rolling   Hand-rolling tobacco    177.1498932
#> 1230 2023-04-01 hand_rolling   Hand-rolling tobacco    160.9565526
#> 1231 2023-05-01 hand_rolling   Hand-rolling tobacco    125.9619350
#> 1232 2023-06-01 hand_rolling   Hand-rolling tobacco    111.5346769
#> 1233 2023-07-01 hand_rolling   Hand-rolling tobacco    235.6816855
#> 1234 2023-08-01 hand_rolling   Hand-rolling tobacco    173.3552709
#> 1235 2023-09-01 hand_rolling   Hand-rolling tobacco    193.6994620
#> 1236 2023-10-01 hand_rolling   Hand-rolling tobacco    169.9411621
#> 1237 2023-11-01 hand_rolling   Hand-rolling tobacco    161.0165494
#> 1238 2023-12-01 hand_rolling   Hand-rolling tobacco    193.1400786
#> 1239 2024-01-01 hand_rolling   Hand-rolling tobacco    187.4501973
#> 1240 2024-02-01 hand_rolling   Hand-rolling tobacco    165.7176774
#> 1241 2024-03-01 hand_rolling   Hand-rolling tobacco    192.5754780
#> 1242 2024-04-01 hand_rolling   Hand-rolling tobacco    179.2439454
#> 1243 2024-05-01 hand_rolling   Hand-rolling tobacco     89.0109191
#> 1244 2024-06-01 hand_rolling   Hand-rolling tobacco    152.4112880
#> 1245 2024-07-01 hand_rolling   Hand-rolling tobacco    183.1329905
#> 1246 2024-08-01 hand_rolling   Hand-rolling tobacco    154.2518923
#> 1247 2024-09-01 hand_rolling   Hand-rolling tobacco    181.7424001
#> 1248 2024-10-01 hand_rolling   Hand-rolling tobacco    158.2726747
#> 1249 2024-11-01 hand_rolling   Hand-rolling tobacco    192.5928049
#> 1250 2024-12-01 hand_rolling   Hand-rolling tobacco     97.6221860
#> 1251 2025-01-01 hand_rolling   Hand-rolling tobacco    138.8409910
#> 1252 2025-02-01 hand_rolling   Hand-rolling tobacco     97.6448176
#> 1253 2025-03-01 hand_rolling   Hand-rolling tobacco    146.2914300
#> 1254 2025-04-01 hand_rolling   Hand-rolling tobacco    153.4342203
#> 1255 2025-05-01 hand_rolling   Hand-rolling tobacco    143.5695377
#> 1256 2025-06-01 hand_rolling   Hand-rolling tobacco    152.1575715
#> 1257 2025-07-01 hand_rolling   Hand-rolling tobacco    166.0410085
#> 1258 2025-08-01 hand_rolling   Hand-rolling tobacco    145.4248128
#> 1259 2025-09-01 hand_rolling   Hand-rolling tobacco    156.0241955
#> 1260 2025-10-01 hand_rolling   Hand-rolling tobacco    173.4347556
#> 1261 2025-11-01 hand_rolling   Hand-rolling tobacco    134.6506852
#> 1262 2025-12-01 hand_rolling   Hand-rolling tobacco    151.6263272
#> 1263 2026-01-01 hand_rolling   Hand-rolling tobacco     77.7320907
#> 1552 2015-01-01        other Other tobacco products      2.2918184
#> 1553 2015-02-01        other Other tobacco products      1.7755021
#> 1554 2015-03-01        other Other tobacco products      1.7896208
#> 1555 2015-04-01        other Other tobacco products      3.5229986
#> 1556 2015-05-01        other Other tobacco products      0.8843264
#> 1557 2015-06-01        other Other tobacco products      1.9042837
#> 1558 2015-07-01        other Other tobacco products      1.8870176
#> 1559 2015-08-01        other Other tobacco products      2.3494885
#> 1560 2015-09-01        other Other tobacco products      1.5441285
#> 1561 2015-10-01        other Other tobacco products      2.1304638
#> 1562 2015-11-01        other Other tobacco products      2.0829046
#> 1563 2015-12-01        other Other tobacco products      1.8410737
#> 1564 2016-01-01        other Other tobacco products      1.9581350
#> 1565 2016-02-01        other Other tobacco products      1.3911087
#> 1566 2016-03-01        other Other tobacco products      1.8840601
#> 1567 2016-04-01        other Other tobacco products      2.3312421
#> 1568 2016-05-01        other Other tobacco products      1.3350193
#> 1569 2016-06-01        other Other tobacco products      1.8454990
#> 1570 2016-07-01        other Other tobacco products      1.8146539
#> 1571 2016-08-01        other Other tobacco products      1.7108295
#> 1572 2016-09-01        other Other tobacco products      1.8225638
#> 1573 2016-10-01        other Other tobacco products      1.9589907
#> 1574 2016-11-01        other Other tobacco products      1.6356483
#> 1575 2016-12-01        other Other tobacco products      1.8342830
#> 1576 2017-01-01        other Other tobacco products      1.8390259
#> 1577 2017-02-01        other Other tobacco products      1.5227796
#> 1578 2017-03-01        other Other tobacco products      1.8492404
#> 1579 2017-04-01        other Other tobacco products      2.4772985
#> 1580 2017-05-01        other Other tobacco products      1.2374263
#> 1581 2017-06-01        other Other tobacco products      2.3182959
#> 1582 2017-07-01        other Other tobacco products      2.1920183
#> 1583 2017-08-01        other Other tobacco products      1.6222234
#> 1584 2017-09-01        other Other tobacco products      2.2396162
#> 1585 2017-10-01        other Other tobacco products      1.6772381
#> 1586 2017-11-01        other Other tobacco products      1.9221466
#> 1587 2017-12-01        other Other tobacco products      2.0570372
#> 1588 2018-01-01        other Other tobacco products      1.9424981
#> 1589 2018-02-01        other Other tobacco products      2.3569797
#> 1590 2018-03-01        other Other tobacco products      1.4679768
#> 1591 2018-04-01        other Other tobacco products      1.8351510
#> 1592 2018-05-01        other Other tobacco products      2.0163026
#> 1593 2018-06-01        other Other tobacco products      1.9064344
#> 1594 2018-07-01        other Other tobacco products      2.0366468
#> 1595 2018-08-01        other Other tobacco products      2.0163029
#> 1596 2018-09-01        other Other tobacco products      2.1590906
#> 1597 2018-10-01        other Other tobacco products      1.9643518
#> 1598 2018-11-01        other Other tobacco products      3.5036174
#> 1599 2018-12-01        other Other tobacco products      1.4952458
#> 1600 2019-01-01        other Other tobacco products      1.4130114
#> 1601 2019-02-01        other Other tobacco products      2.1334775
#> 1602 2019-03-01        other Other tobacco products      1.4109452
#> 1603 2019-04-01        other Other tobacco products      1.7924672
#> 1604 2019-05-01        other Other tobacco products      1.9147071
#> 1605 2019-06-01        other Other tobacco products      1.7830738
#> 1606 2019-07-01        other Other tobacco products      1.8887799
#> 1607 2019-08-01        other Other tobacco products      3.4321345
#> 1608 2019-09-01        other Other tobacco products      2.0108005
#> 1609 2019-10-01        other Other tobacco products      3.9622993
#> 1610 2019-11-01        other Other tobacco products      3.2862884
#> 1611 2019-12-01        other Other tobacco products      2.4067769
#> 1612 2020-01-01        other Other tobacco products     -4.9209034
#> 1613 2020-02-01        other Other tobacco products      1.0212822
#> 1614 2020-03-01        other Other tobacco products      7.8913511
#> 1615 2020-04-01        other Other tobacco products      1.8461570
#> 1616 2020-05-01        other Other tobacco products      1.8488334
#> 1617 2020-06-01        other Other tobacco products      2.7058716
#> 1618 2020-07-01        other Other tobacco products      1.8798972
#> 1619 2020-08-01        other Other tobacco products      3.8565892
#> 1620 2020-09-01        other Other tobacco products      3.3385432
#> 1621 2020-10-01        other Other tobacco products      3.7774370
#> 1622 2020-11-01        other Other tobacco products      8.4052371
#> 1623 2020-12-01        other Other tobacco products      3.6121221
#> 1624 2021-01-01        other Other tobacco products      6.1944850
#> 1625 2021-02-01        other Other tobacco products      1.9459439
#> 1626 2021-03-01        other Other tobacco products      9.8560213
#> 1627 2021-04-01        other Other tobacco products      1.6174955
#> 1628 2021-05-01        other Other tobacco products      2.1482351
#> 1629 2021-06-01        other Other tobacco products      2.7459408
#> 1630 2021-07-01        other Other tobacco products      5.3797254
#> 1631 2021-08-01        other Other tobacco products      7.2578946
#> 1632 2021-09-01        other Other tobacco products      2.4953393
#> 1633 2021-10-01        other Other tobacco products      9.7642426
#> 1634 2021-11-01        other Other tobacco products     13.3375419
#> 1635 2021-12-01        other Other tobacco products      1.6714589
#> 1636 2022-01-01        other Other tobacco products      2.4877359
#> 1637 2022-02-01        other Other tobacco products      2.5973437
#> 1638 2022-03-01        other Other tobacco products      4.0972992
#> 1639 2022-04-01        other Other tobacco products      5.2653594
#> 1640 2022-05-01        other Other tobacco products      4.2957680
#> 1641 2022-06-01        other Other tobacco products      5.2237431
#> 1642 2022-07-01        other Other tobacco products      4.2044786
#> 1643 2022-08-01        other Other tobacco products      7.4187080
#> 1644 2022-09-01        other Other tobacco products      4.9619111
#> 1645 2022-10-01        other Other tobacco products      6.0968408
#> 1646 2022-11-01        other Other tobacco products      4.2894477
#> 1647 2022-12-01        other Other tobacco products      7.0857182
#> 1648 2023-01-01        other Other tobacco products      4.6343505
#> 1649 2023-02-01        other Other tobacco products      4.1603715
#> 1650 2023-03-01        other Other tobacco products     29.8793646
#> 1651 2023-04-01        other Other tobacco products      1.9659387
#> 1652 2023-05-01        other Other tobacco products      0.8561964
#> 1653 2023-06-01        other Other tobacco products      0.9896870
#> 1654 2023-07-01        other Other tobacco products     -0.5021930
#> 1655 2023-08-01        other Other tobacco products      5.4759198
#> 1656 2023-09-01        other Other tobacco products      7.7580899
#> 1657 2023-10-01        other Other tobacco products      1.9291094
#> 1658 2023-11-01        other Other tobacco products      4.2104912
#> 1659 2023-12-01        other Other tobacco products      4.4154458
#> 1660 2024-01-01        other Other tobacco products      7.5454681
#> 1661 2024-02-01        other Other tobacco products      4.5202980
#> 1662 2024-03-01        other Other tobacco products      9.5302935
#> 1663 2024-04-01        other Other tobacco products      4.3231617
#> 1664 2024-05-01        other Other tobacco products      8.1428893
#> 1665 2024-06-01        other Other tobacco products      6.9557430
#> 1666 2024-07-01        other Other tobacco products      8.5199092
#> 1667 2024-08-01        other Other tobacco products      6.7073407
#> 1668 2024-09-01        other Other tobacco products      9.4626986
#> 1669 2024-10-01        other Other tobacco products      7.0369896
#> 1670 2024-11-01        other Other tobacco products     10.1804637
#> 1671 2024-12-01        other Other tobacco products      4.3214352
#> 1672 2025-01-01        other Other tobacco products      4.6690242
#> 1673 2025-02-01        other Other tobacco products      8.4628303
#> 1674 2025-03-01        other Other tobacco products      6.0567504
#> 1675 2025-04-01        other Other tobacco products      5.9232057
#> 1676 2025-05-01        other Other tobacco products      1.4852499
#> 1677 2025-06-01        other Other tobacco products      9.8740363
#> 1678 2025-07-01        other Other tobacco products      2.3946005
#> 1679 2025-08-01        other Other tobacco products      7.3645322
#> 1680 2025-09-01        other Other tobacco products      0.8668692
#> 1681 2025-10-01        other Other tobacco products     15.2515731
#> 1682 2025-11-01        other Other tobacco products      8.0714275
#> 1683 2025-12-01        other Other tobacco products     10.1288298
#> 1684 2026-01-01        other Other tobacco products      6.1896886
#> 1973 2015-01-01        total Total tobacco products    994.2662612
#> 1974 2015-02-01        total Total tobacco products    599.5248503
#> 1975 2015-03-01        total Total tobacco products    777.6569003
#> 1976 2015-04-01        total Total tobacco products   1453.3802851
#> 1977 2015-05-01        total Total tobacco products    236.5447210
#> 1978 2015-06-01        total Total tobacco products    572.4101982
#> 1979 2015-07-01        total Total tobacco products    756.5115268
#> 1980 2015-08-01        total Total tobacco products   1217.4850694
#> 1981 2015-09-01        total Total tobacco products    467.2762238
#> 1982 2015-10-01        total Total tobacco products    845.8339962
#> 1983 2015-11-01        total Total tobacco products    839.8140527
#> 1984 2015-12-01        total Total tobacco products    507.8285848
#> 1985 2016-01-01        total Total tobacco products    915.2068174
#> 1986 2016-02-01        total Total tobacco products    633.7305407
#> 1987 2016-03-01        total Total tobacco products   1038.9621499
#> 1988 2016-04-01        total Total tobacco products   1073.8492546
#> 1989 2016-05-01        total Total tobacco products    269.1198010
#> 1990 2016-06-01        total Total tobacco products    624.8688114
#> 1991 2016-07-01        total Total tobacco products    726.1357159
#> 1992 2016-08-01        total Total tobacco products    759.7568824
#> 1993 2016-09-01        total Total tobacco products    843.1748264
#> 1994 2016-10-01        total Total tobacco products    857.4718078
#> 1995 2016-11-01        total Total tobacco products    717.3403772
#> 1996 2016-12-01        total Total tobacco products    632.5921287
#> 1997 2017-01-01        total Total tobacco products    909.5719784
#> 1998 2017-02-01        total Total tobacco products    715.5342463
#> 1999 2017-03-01        total Total tobacco products    779.5898898
#> 2000 2017-04-01        total Total tobacco products    844.5610675
#> 2001 2017-05-01        total Total tobacco products    488.2145617
#> 2002 2017-06-01        total Total tobacco products    754.5313667
#> 2003 2017-07-01        total Total tobacco products    800.3540466
#> 2004 2017-08-01        total Total tobacco products    756.7010670
#> 2005 2017-09-01        total Total tobacco products    851.1671707
#> 2006 2017-10-01        total Total tobacco products    753.0629603
#> 2007 2017-11-01        total Total tobacco products    653.4662127
#> 2008 2017-12-01        total Total tobacco products   1169.7129827
#> 2009 2018-01-01        total Total tobacco products    553.6913289
#> 2010 2018-02-01        total Total tobacco products    523.7670142
#> 2011 2018-03-01        total Total tobacco products    677.4230316
#> 2012 2018-04-01        total Total tobacco products    783.6296706
#> 2013 2018-05-01        total Total tobacco products    969.9255827
#> 2014 2018-06-01        total Total tobacco products    651.0846465
#> 2015 2018-07-01        total Total tobacco products    803.3481839
#> 2016 2018-08-01        total Total tobacco products    743.5132152
#> 2017 2018-09-01        total Total tobacco products    920.8673995
#> 2018 2018-10-01        total Total tobacco products    705.3167743
#> 2019 2018-11-01        total Total tobacco products   1241.8145662
#> 2020 2018-12-01        total Total tobacco products    269.3871759
#> 2021 2019-01-01        total Total tobacco products    686.3587460
#> 2022 2019-02-01        total Total tobacco products    648.4400590
#> 2023 2019-03-01        total Total tobacco products    866.4340386
#> 2024 2019-04-01        total Total tobacco products    647.3934636
#> 2025 2019-05-01        total Total tobacco products    648.0932271
#> 2026 2019-06-01        total Total tobacco products    767.2057796
#> 2027 2019-07-01        total Total tobacco products    724.1624784
#> 2028 2019-08-01        total Total tobacco products    889.3386347
#> 2029 2019-09-01        total Total tobacco products    914.4040573
#> 2030 2019-10-01        total Total tobacco products    668.6148205
#> 2031 2019-11-01        total Total tobacco products    637.3547322
#> 2032 2019-12-01        total Total tobacco products    590.1011204
#> 2033 2020-01-01        total Total tobacco products   1039.2093137
#> 2034 2020-02-01        total Total tobacco products    473.4434194
#> 2035 2020-03-01        total Total tobacco products    804.6161576
#> 2036 2020-04-01        total Total tobacco products   1537.8351501
#> 2037 2020-05-01        total Total tobacco products    230.3332711
#> 2038 2020-06-01        total Total tobacco products    540.6521113
#> 2039 2020-07-01        total Total tobacco products    870.4163749
#> 2040 2020-08-01        total Total tobacco products    887.8972111
#> 2041 2020-09-01        total Total tobacco products   1052.8908591
#> 2042 2020-10-01        total Total tobacco products    827.2871704
#> 2043 2020-11-01        total Total tobacco products    884.8941248
#> 2044 2020-12-01        total Total tobacco products    698.6798852
#> 2045 2021-01-01        total Total tobacco products    980.8208007
#> 2046 2021-02-01        total Total tobacco products    587.8575124
#> 2047 2021-03-01        total Total tobacco products    864.4653216
#> 2048 2021-04-01        total Total tobacco products   1362.1288097
#> 2049 2021-05-01        total Total tobacco products    450.4934503
#> 2050 2021-06-01        total Total tobacco products    611.7388567
#> 2051 2021-07-01        total Total tobacco products   1210.9378721
#> 2052 2021-08-01        total Total tobacco products    709.0619483
#> 2053 2021-09-01        total Total tobacco products   1171.4268766
#> 2054 2021-10-01        total Total tobacco products    758.2667247
#> 2055 2021-11-01        total Total tobacco products    914.7643148
#> 2056 2021-12-01        total Total tobacco products    737.6022643
#> 2057 2022-01-01        total Total tobacco products    876.1946676
#> 2058 2022-02-01        total Total tobacco products    694.5053343
#> 2059 2022-03-01        total Total tobacco products    780.3913678
#> 2060 2022-04-01        total Total tobacco products   1275.7166931
#> 2061 2022-05-01        total Total tobacco products    613.1837339
#> 2062 2022-06-01        total Total tobacco products    695.3902150
#> 2063 2022-07-01        total Total tobacco products    900.4942315
#> 2064 2022-08-01        total Total tobacco products    773.3160841
#> 2065 2022-09-01        total Total tobacco products   1220.7703751
#> 2066 2022-10-01        total Total tobacco products    677.3035999
#> 2067 2022-11-01        total Total tobacco products    712.5854851
#> 2068 2022-12-01        total Total tobacco products    988.1646004
#> 2069 2023-01-01        total Total tobacco products    747.5446976
#> 2070 2023-02-01        total Total tobacco products    580.8274869
#> 2071 2023-03-01        total Total tobacco products    818.2841101
#> 2072 2023-04-01        total Total tobacco products    647.9907427
#> 2073 2023-05-01        total Total tobacco products    503.1245474
#> 2074 2023-06-01        total Total tobacco products    555.2867617
#> 2075 2023-07-01        total Total tobacco products    922.8712924
#> 2076 2023-08-01        total Total tobacco products    865.0344607
#> 2077 2023-09-01        total Total tobacco products    927.0087837
#> 2078 2023-10-01        total Total tobacco products    715.3645001
#> 2079 2023-11-01        total Total tobacco products    671.3384331
#> 2080 2023-12-01        total Total tobacco products    751.3208641
#> 2081 2024-01-01        total Total tobacco products    900.8733177
#> 2082 2024-02-01        total Total tobacco products    656.6588884
#> 2083 2024-03-01        total Total tobacco products    687.2871959
#> 2084 2024-04-01        total Total tobacco products    814.2061577
#> 2085 2024-05-01        total Total tobacco products    458.6838817
#> 2086 2024-06-01        total Total tobacco products    618.9749947
#> 2087 2024-07-01        total Total tobacco products    783.4676803
#> 2088 2024-08-01        total Total tobacco products    796.5686238
#> 2089 2024-09-01        total Total tobacco products    797.5462491
#> 2090 2024-10-01        total Total tobacco products    653.4089436
#> 2091 2024-11-01        total Total tobacco products    755.1440268
#> 2092 2024-12-01        total Total tobacco products    493.1594804
#> 2093 2025-01-01        total Total tobacco products    610.0257419
#> 2094 2025-02-01        total Total tobacco products    667.6810945
#> 2095 2025-03-01        total Total tobacco products    477.6619946
#> 2096 2025-04-01        total Total tobacco products    796.3924435
#> 2097 2025-05-01        total Total tobacco products    598.7159232
#> 2098 2025-06-01        total Total tobacco products    668.6840521
#> 2099 2025-07-01        total Total tobacco products    772.7546535
#> 2100 2025-08-01        total Total tobacco products    645.6637712
#> 2101 2025-09-01        total Total tobacco products    731.5143476
#> 2102 2025-10-01        total Total tobacco products    644.1485999
#> 2103 2025-11-01        total Total tobacco products    592.7130828
#> 2104 2025-12-01        total Total tobacco products    646.9483757
#> 2105 2026-01-01        total Total tobacco products    430.8492678

# Cigarettes only
get_tobacco_duties(product = "cigarettes")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [12ms]
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
#> ✔ Parsing data [70ms]
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
