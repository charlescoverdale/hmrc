# Provenance metadata of an `hmrc_tbl`

Returns the provenance list attached to a result from any `hmrc_*` data
fetcher: source URL, fetch time, vintage, cell methods, and so on.
Useful for citation, audit trails, and reproducibility.

## Usage

``` r
hmrc_meta(x)
```

## Arguments

- x:

  An object returned by an `hmrc_*` data function.

## Value

A named list, or `NULL` if `x` has no metadata.

## See also

Other infrastructure:
[`hmrc_cache_info()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_cache_info.md),
[`hmrc_clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_clear_cache.md),
[`hmrc_list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_list_tax_heads.md),
[`hmrc_publications()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_publications.md),
[`hmrc_search()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_search.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
tr <- hmrc_tax_receipts(tax = "vat", start = "2024-01")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [895ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [784ms]
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
#> • `` -> `...18`
#> • `` -> `...19`
#> • `` -> `...20`
#> • `` -> `...21`
#> • `` -> `...22`
#> • `` -> `...23`
#> • `` -> `...24`
#> • `` -> `...25`
#> • `` -> `...26`
#> • `` -> `...27`
#> • `` -> `...28`
#> • `` -> `...29`
#> • `` -> `...30`
#> • `` -> `...31`
#> • `` -> `...32`
#> • `` -> `...33`
#> • `` -> `...34`
#> • `` -> `...35`
#> • `` -> `...36`
#> • `` -> `...37`
#> • `` -> `...38`
#> • `` -> `...39`
#> • `` -> `...40`
#> • `` -> `...41`
#> • `` -> `...42`
#> • `` -> `...43`
#> • `` -> `...44`
#> • `` -> `...45`
#> • `` -> `...46`
#> • `` -> `...47`
#> ✔ Parsing data [364ms]
#> 
hmrc_meta(tr)
#> $dataset
#> [1] "tax_receipts_monthly"
#> 
#> $hmrc_publication
#> [1] "HMRC tax receipts and NICs (monthly bulletin)"
#> 
#> $source_url
#> [1] "https://www.gov.uk/government/statistics/hmrc-tax-and-nics-receipts-for-the-uk"
#> 
#> $attachment_url
#> [1] "https://assets.publishing.service.gov.uk/media/69e1e5f161d2e8e9b9e42ead/NS_Table.ods"
#> 
#> $slug
#> [1] "hmrc-tax-and-nics-receipts-for-the-uk"
#> 
#> $cell_methods
#> [1] "cash"
#> 
#> $frequency
#> [1] "monthly"
#> 
#> $vintage_date
#> [1] NA
#> 
#> $fetched_at
#> [1] "2026-04-26 13:15:50 UTC"
#> 
#> $package_version
#> [1] "0.4.0"
#> 
options(op)
# }
```
