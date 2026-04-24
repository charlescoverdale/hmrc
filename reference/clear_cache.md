# Clear the local HMRC data cache

Deletes locally cached data files downloaded by the hmrc package. By
default, all cached files are removed. Use `max_age_days` to remove only
files older than a given number of days.

## Usage

``` r
clear_cache(max_age_days = NULL)
```

## Arguments

- max_age_days:

  Numeric or `NULL`. If `NULL` (default), all cached files are removed.
  If a number, only files last modified more than that many days ago are
  removed.

## Value

Invisibly returns the number of files deleted.

## See also

Other data access:
[`get_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/get_tax_gap.md),
[`list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/list_tax_heads.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
# Remove all cached files
clear_cache()
#> Deleted 3 cached files.

# Remove files older than 30 days
clear_cache(max_age_days = 30)
#> No files older than 30 days found.
options(op)
# }
```
