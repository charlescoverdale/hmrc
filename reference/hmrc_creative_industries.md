# Download HMRC Creative Industries tax relief statistics

Downloads and tidies Table 1 (annual time series) of the HMRC Creative
Industries Statistics for each of the eight creative-industries reliefs:
Film, High-end TV, Animation, Children's TV, Video Games, Theatre,
Orchestra, and Museums and Galleries Exhibition. Published annually each
August.

## Usage

``` r
hmrc_creative_industries(sector = NULL, tax_year = NULL, cache = TRUE)
```

## Source

<https://www.gov.uk/government/collections/creative-industries-statistics>

## Arguments

- sector:

  Character vector or `NULL` (default = all sectors). Valid values:
  `"film"`, `"high_end_tv"`, `"animation"`, `"childrens_tv"`,
  `"video_games"`, `"theatre"`, `"orchestra"`, `"museum"`.

- tax_year:

  Character vector or `NULL` (default = all years).

- cache:

  Logical. Use cached file if available (default `TRUE`).

## Value

An `hmrc_tbl` with columns:

- sector:

  Character. Creative-industries sector identifier.

- tax_year:

  Character. Tax year, e.g. `"2023-24"`.

- companies:

  Numeric. Number of companies (where reported).

- claims:

  Numeric. Number of claims (where reported).

- productions:

  Numeric. Number of productions (films, games, etc., where reported).

- relief_gbp_m:

  Numeric. Amount of relief paid, GBP million.

- status:

  Character. HMRC revision status (e.g. `"Unchanged"`, `"Provisional"`).

## Details

Creative Industries reliefs are paid on an accruals basis. The latest
tax year in each sector's table is provisional and uplifted by HMRC for
claims not yet received; status is recorded in the `status` column.
Sector tables differ slightly in their column set (films track
`productions`, video games track `productions`, theatre tracks
`claims`/`productions`, museums track exhibitions, etc.); columns absent
from a sector's table are returned as `NA`.

## See also

Other data fetchers:
[`hmrc_capital_gains()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_capital_gains.md),
[`hmrc_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_corporation_tax.md),
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
hmrc_creative_industries(sector = "film")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✖ Resolving download URL from GOV.UK Content API [715ms]
#> 
#> ℹ Resolving download URL from GOV.UK Content API
#> ✖ Resolving download URL from GOV.UK Content API [400ms]
#> 
#> ℹ Resolving download URL from GOV.UK Content API
#> ✖ Resolving download URL from GOV.UK Content API [192ms]
#> 
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [419ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [637ms]
#> 
#> ℹ Parsing data
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> ✔ Parsing data [495ms]
#> 
#> # Creative Industries tax relief statistics (Table 1)
#> # Source: https://www.gov.uk/government/statistics/creative-industries-statistics-august-2025
#> # Fetched 2026-04-26 13:01:51 UTC | Vintage: latest | Cells: counts/cash | Freq: annual | 18 rows x 7 cols
#> 
#>    sector tax_year companies claims productions relief_gbp_m
#> 1    film  2006-07        55     60          55           65
#> 2    film  2007-08       180    215         175          123
#> 3    film  2008-09       245    285         245          139
#> 4    film  2009-10       290    340         285          178
#> 5    film  2010-11       315    370         320          212
#> 6    film  2011-12       320    375         330          240
#> 7    film  2012-13       330    390         350          200
#> 8    film  2013-14       405    480         425          264
#> 9    film  2014-15       470    560         495          307
#> 10   film  2015-16       535    600         590          412
#> 11   film  2016-17       595    660         665          532
#> 12   film  2017-18       675    780         755          530
#> 13   film  2018-19       745    830         865          584
#> 14   film  2019-20       830    950         955          627
#> 15   film  2020-21       675    760         800          418
#> 16   film  2021-22       720    815         870          520
#> 17   film  2022-23       785    880         955          553
#> 18   film  2023-24       830    960         980          534
#>                  status
#> 1             Unchanged
#> 2             Unchanged
#> 3             Unchanged
#> 4             Unchanged
#> 5             Unchanged
#> 6             Unchanged
#> 7             Unchanged
#> 8             Unchanged
#> 9             Unchanged
#> 10            Unchanged
#> 11            Unchanged
#> 12            Unchanged
#> 13            Unchanged
#> 14            Unchanged
#> 15              Revised
#> 16              Revised
#> 17 Provisional, revised
#> 18          Provisional
hmrc_creative_industries(tax_year = "2023-24")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✖ Resolving download URL from GOV.UK Content API [41ms]
#> 
#> ℹ Resolving download URL from GOV.UK Content API
#> ✖ Resolving download URL from GOV.UK Content API [41ms]
#> 
#> ℹ Resolving download URL from GOV.UK Content API
#> ✖ Resolving download URL from GOV.UK Content API [41ms]
#> 
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [19ms]
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
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> New names:
#> • `` -> `...1`
#> • `` -> `...2`
#> • `` -> `...3`
#> • `` -> `...4`
#> • `` -> `...5`
#> • `` -> `...6`
#> ✔ Parsing data [496ms]
#> 
#> # Creative Industries tax relief statistics (Table 1)
#> # Source: https://www.gov.uk/government/statistics/creative-industries-statistics-august-2025
#> # Fetched 2026-04-26 13:01:52 UTC | Vintage: latest | Cells: counts/cash | Freq: annual | 8 rows x 7 cols
#> 
#>         sector tax_year companies claims productions relief_gbp_m      status
#> 1    animation  2023-24       105    120          NA           33 Provisional
#> 2 childrens_tv  2023-24        80     90          NA           56 Provisional
#> 3         film  2023-24       830    960         980          534 Provisional
#> 4  high_end_tv  2023-24       570    685          NA         1110 Provisional
#> 5       museum  2023-24       270    270        2155           28 Provisional
#> 6    orchestra  2023-24       250    260         745           50 Provisional
#> 7      theatre  2023-24      1320   1380        4205          261 Provisional
#> 8  video_games  2023-24       495    560        1140          327 Provisional
options(op)
# }
```
