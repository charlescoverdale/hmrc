# Clear the local HMRC data cache

Deletes locally cached data files downloaded by the package. By default
all cached files are removed; pass `max_age_days` to remove only files
older than that.

## Usage

``` r
hmrc_clear_cache(max_age_days = NULL)
```

## Arguments

- max_age_days:

  Numeric or `NULL`. If `NULL` (default), every cached file is removed.
  If a number, only files modified more than that many days ago are
  removed.

## Value

Invisibly returns the number of files deleted.

## See also

Other infrastructure:
[`hmrc_cache_info()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_cache_info.md),
[`hmrc_list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_list_tax_heads.md),
[`hmrc_meta()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_meta.md),
[`hmrc_publications()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_publications.md),
[`hmrc_search()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_search.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
hmrc_clear_cache()
#> Deleted 6 cached files.
hmrc_clear_cache(max_age_days = 30)
#> No files older than 30 days found.
options(op)
# }
```
