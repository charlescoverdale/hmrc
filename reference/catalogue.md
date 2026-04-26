# HMRC dataset catalogue

A data frame describing every HMRC dataset known to the package,
including those exposed by an `hmrc_*` function and those on the
development roadmap (where `function_name` is `NA`). Use
[`hmrc_search()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_search.md)
for keyword search and
[`hmrc_publications()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_publications.md)
for a tidy index.

## Usage

``` r
catalogue
```

## Format

A data frame with columns:

- dataset:

  Character. Short identifier.

- publication:

  Character. GOV.UK publication name.

- function_name:

  Character. Exporting function (or `NA`).

- frequency:

  Character. `monthly`, `quarterly`, `annual`, etc.

- start:

  Character. First period of the published series.

- publisher:

  Character. Usually `"HMRC"`.

- slug:

  Character. GOV.UK statistics slug.

- url:

  Character. URL of the publication landing page.

- description:

  Character. One-line description.

- tags:

  Character. Space-separated keywords searched by
  [`hmrc_search()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_search.md).
