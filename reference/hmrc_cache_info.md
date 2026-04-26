# Inspect the local HMRC cache

Returns a tidy table of files currently held in the package cache, with
size and age. Useful for understanding what is stored locally and
deciding when to clear stale files via
[`hmrc_clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_clear_cache.md).

## Usage

``` r
hmrc_cache_info()
```

## Value

A data frame with columns `file`, `extension`, `size_bytes`, `size_mb`,
`modified` (POSIXct), `age_days`, `path`. The data frame is empty (zero
rows) if the cache directory does not exist or is empty. The cache
directory itself is attached as the attribute `"cache_dir"`.

## See also

Other infrastructure:
[`hmrc_clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_clear_cache.md),
[`hmrc_list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_list_tax_heads.md),
[`hmrc_meta()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_meta.md),
[`hmrc_publications()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_publications.md),
[`hmrc_search()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_search.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
info <- hmrc_cache_info()
attr(info, "cache_dir")
#> [1] "/tmp/RtmpjLulSI"
options(op)
# }
```
