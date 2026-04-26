# Tax head lookup table

A data frame describing all tax and duty series available in
[`hmrc_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_receipts.md).

## Usage

``` r
tax_heads
```

## Format

A data frame with 41 rows and 4 columns:

- tax_head:

  Character. Identifier used in the `tax` argument of
  [`hmrc_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_receipts.md).

- description:

  Character. Plain-English description.

- category:

  Character. Broad grouping: `"income"`, `"nics"`, `"consumption"`,
  `"property"`, `"environment"`, `"expenditure"`, `"other"`, or
  `"total"`.

- available_from:

  Character. Approximate start year of monthly data.

## Source

Derived from the HMRC Tax Receipts and NICs bulletin.
<https://www.gov.uk/government/statistics/hmrc-tax-and-nics-receipts-for-the-uk>
