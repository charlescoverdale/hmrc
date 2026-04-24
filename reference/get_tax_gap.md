# Download HMRC tax gap estimates

Downloads and tidies the HMRC Measuring the Tax Gap publication, which
estimates the difference between the tax theoretically owed and the tax
actually collected, broken down by tax type and taxpayer group.
Published annually in June, covering the most recent financial year.

## Usage

``` r
get_tax_gap(tax = NULL, cache = TRUE)
```

## Source

<https://www.gov.uk/government/statistics/measuring-tax-gaps>

## Arguments

- tax:

  Character vector or `NULL` (default = all taxes). Filter by tax type,
  e.g. `"Income Tax"`, `"VAT"`, `"Corporation Tax"`. Use
  `unique(get_tax_gap()$tax)` to see all available values.

- cache:

  Logical. Use cached file if available (default `TRUE`).

## Value

A data frame with columns:

- tax_year:

  Character. Financial year of the estimate, e.g. `"2023-24"`.

- tax:

  Character. Tax type.

- taxpayer_type:

  Character. Taxpayer group (e.g. `"Individuals"`,
  `"Small businesses"`).

- component:

  Character. Behaviour component (e.g. `"Evasion"`, `"Error"`,
  `"Avoidance"`).

- gap_pct:

  Numeric. Tax gap as a percentage of the theoretical tax liability.
  `NA` where not disclosed.

- gap_gbp_bn:

  Numeric. Absolute tax gap in billions of pounds.

- uncertainty:

  Character. HMRC uncertainty rating for the estimate (e.g. `"Low"`,
  `"Medium"`, `"High"`).

## Details

The tax gap publication is cross-sectional: each edition covers a single
financial year. This function returns data for the most recent edition
available on GOV.UK. Historical estimates back to 2005-06 are available
in a separate HMRC publication (Measuring the Tax Gap: Time Series).

## See also

Other data access:
[`clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/clear_cache.md),
[`list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/list_tax_heads.md)

## Examples

``` r
# \donttest{
op <- options(hmrc.cache_dir = tempdir())
# Full tax gap breakdown
get_tax_gap()
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [419ms]
#> 
#> ℹ Downloading data file
#> ✔ Downloading data file [11ms]
#> 
#> ℹ Parsing data
#> ✔ Parsing data [43ms]
#> 
#>    tax_year                                 tax
#> 1   2023-24                     Corporation Tax
#> 2   2023-24                     Corporation Tax
#> 3   2023-24                     Corporation Tax
#> 4   2023-24                     Corporation Tax
#> 5   2023-24                         Excise duty
#> 6   2023-24                         Excise duty
#> 7   2023-24                         Excise duty
#> 8   2023-24                         Excise duty
#> 9   2023-24                         Excise duty
#> 10  2023-24                         Excise duty
#> 11  2023-24                         Excise duty
#> 12  2023-24                         Excise duty
#> 13  2023-24 Income Tax, NICs, Capital Gains Tax
#> 14  2023-24 Income Tax, NICs, Capital Gains Tax
#> 15  2023-24 Income Tax, NICs, Capital Gains Tax
#> 16  2023-24 Income Tax, NICs, Capital Gains Tax
#> 17  2023-24 Income Tax, NICs, Capital Gains Tax
#> 18  2023-24 Income Tax, NICs, Capital Gains Tax
#> 19  2023-24 Income Tax, NICs, Capital Gains Tax
#> 20  2023-24 Income Tax, NICs, Capital Gains Tax
#> 21  2023-24 Income Tax, NICs, Capital Gains Tax
#> 22  2023-24 Income Tax, NICs, Capital Gains Tax
#> 23  2023-24 Income Tax, NICs, Capital Gains Tax
#> 24  2023-24 Income Tax, NICs, Capital Gains Tax
#> 25  2023-24 Income Tax, NICs, Capital Gains Tax
#> 26  2023-24                         Other taxes
#> 27  2023-24                         Other taxes
#> 28  2023-24                         Other taxes
#> 29  2023-24                         Other taxes
#> 30  2023-24                         Other taxes
#> 31  2023-24                         Other taxes
#> 32  2023-24                         Other taxes
#> 33  2023-24                       Total tax gap
#> 34  2023-24                                 VAT
#>                                taxpayer_type
#> 1                            Corporation Tax
#> 2                            Corporation Tax
#> 3                            Corporation Tax
#> 4                      Total Corporation Tax
#> 5                               Alcohol duty
#> 6                               Alcohol duty
#> 7                      Hydrocarbon oils duty
#> 8                        Other excise duties
#> 9                               Tobacco duty
#> 10                              Tobacco duty
#> 11                         Total excise duty
#> 12                        Total tobacco duty
#> 13                            Hidden economy
#> 14                            Hidden economy
#> 15                                      PAYE
#> 16                                      PAYE
#> 17                                      PAYE
#> 18                           Self Assessment
#> 19                           Self Assessment
#> 20                           Self Assessment
#> 21 Total Income Tax, NICs, Capital Gains Tax
#> 22                                Total PAYE
#> 23                     Total Self Assessment
#> 24                           Total avoidance
#> 25                      Total hidden economy
#> 26                           Inheritance Tax
#> 27                              Landfill Tax
#> 28            Other taxes, levies and duties
#> 29                               Stamp taxes
#> 30                               Stamp taxes
#> 31                         Total other taxes
#> 32                         Total stamp taxes
#> 33                             Total tax gap
#> 34                                 Total VAT
#>                                    component gap_pct gap_gbp_bn uncertainty
#> 1                           Large businesses     4.2        2.3      Medium
#> 2                       Mid-sized businesses     6.0        1.5      Medium
#> 3                           Small businesses    40.1       14.7      Medium
#> 4                      Total Corporation Tax    15.8       18.6        <NA>
#> 5                                  Beer duty    16.0        0.7        High
#> 6                             Spirits duties     1.4        0.1        High
#> 7                      Hydrocarbon oils duty     0.2        0.1      Medium
#> 8                        Other excise duties     9.5        0.9   Very high
#> 9                             Cigarette duty    10.5        0.8        High
#> 10                 Hand-rolling tobacco duty    22.9        0.6        High
#> 11                         Total excise duty     5.8        3.1        <NA>
#> 12                        Total tobacco duty    13.8        1.4        <NA>
#> 13                                    Ghosts      NA        0.6   Very high
#> 14                              Moonlighters      NA        0.9        High
#> 15                          Large businesses     1.1        2.0   Very high
#> 16                      Mid-sized businesses     0.8        1.0      Medium
#> 17                          Small businesses     0.9        0.9      Medium
#> 18                        Business taxpayers    22.7        5.8      Medium
#> 19                        Large partnerships     8.3        1.4   Very high
#> 20                    Non-business taxpayers     5.6        1.6      Medium
#> 21 Total Income Tax, NICs, Capital Gains Tax     3.0       14.4        <NA>
#> 22                                Total PAYE     1.0        3.9        <NA>
#> 23                     Total Self Assessment    12.5        8.7        <NA>
#> 24                           Total avoidance      NA        0.2        High
#> 25                      Total hidden economy      NA        1.5        <NA>
#> 26                           Inheritance Tax     3.9        0.3        High
#> 27                              Landfill Tax    22.6        0.1        High
#> 28            Other taxes, levies and duties     5.3        1.1   Very high
#> 29                       Stamp Duty Land Tax     2.3        0.3        High
#> 30                    Stamp Duty Reserve Tax     1.0        0.1   Very high
#> 31                         Total other taxes     4.2        1.9        <NA>
#> 32                         Total stamp taxes     2.0        0.3        <NA>
#> 33                             Total tax gap     5.3       46.8        <NA>
#> 34                                 Total VAT     5.0        8.9      Medium

# VAT gap only
get_tax_gap(tax = "VAT")
#> ℹ Resolving download URL from GOV.UK Content API
#> ✔ Resolving download URL from GOV.UK Content API [11ms]
#> 
#> ℹ Using cached file
#> ✔ Using cached file [4ms]
#> 
#> ℹ Parsing data
#> ✔ Parsing data [39ms]
#> 
#>    tax_year tax taxpayer_type component gap_pct gap_gbp_bn uncertainty
#> 34  2023-24 VAT     Total VAT Total VAT       5        8.9      Medium
options(op)
# }
```
