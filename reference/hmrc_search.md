# Search the HMRC dataset catalogue

Fuzzy keyword search across publication name, description, tags, and
dataset identifier. Returns a tidy table of matching rows so users can
discover what the package exposes (and what is on the roadmap).

## Usage

``` r
hmrc_search(query = NULL, implemented = NULL, frequency = NULL)
```

## Arguments

- query:

  Character. Keyword or regex pattern. Case-insensitive. Matches
  anywhere in `dataset`, `publication`, `description`, or `tags`. If
  `NULL` or empty, the full catalogue is returned.

- implemented:

  Logical or `NULL`. If `TRUE`, only rows with a working `function_name`
  are returned. If `FALSE`, only roadmap rows. `NULL` (default) returns
  both.

- frequency:

  Optional character vector to filter by frequency (e.g. `"monthly"`,
  `"annual"`).

## Value

A data frame, sorted with implemented datasets first.

## See also

Other infrastructure:
[`hmrc_cache_info()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_cache_info.md),
[`hmrc_clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_clear_cache.md),
[`hmrc_list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_list_tax_heads.md),
[`hmrc_meta()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_meta.md),
[`hmrc_publications()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_publications.md)

## Examples

``` r
# Everything mentioning VAT
hmrc_search("vat")
#>                dataset                                    publication
#> 1           patent_box                  Patent Box reliefs statistics
#> 2 tax_receipts_monthly  HMRC tax receipts and NICs (monthly bulletin)
#> 3          vat_monthly VAT annual statistics (monthly receipts table)
#>       function_name frequency   start
#> 1   hmrc_patent_box    annual 2003-04
#> 2 hmrc_tax_receipts   monthly 2008-04
#> 3          hmrc_vat   monthly 1973-04
#>                                                                                                      description
#> 1                                                          Annual Patent Box election counts and relief claimed.
#> 2 Monthly cash receipts for 41 tax heads (Income Tax, NICs, VAT, Corporation Tax, duties, etc.) from April 2008.
#> 3               Monthly VAT receipts split into payments, repayments, import VAT, and home VAT, from April 1973.

# Only annual publications already implemented
hmrc_search(implemented = TRUE, frequency = "annual")
#>                           dataset
#> 1        capital_gains_tax_annual
#> 2          corporation_tax_annual
#> 3     creative_industries_reliefs
#> 4 income_tax_liabilities_by_range
#> 5          inheritance_tax_annual
#> 6                      patent_box
#> 7               rd_credits_annual
#> 8               stamp_duty_annual
#> 9                  tax_gap_annual
#>                                          publication            function_name
#> 1                       Capital Gains Tax statistics       hmrc_capital_gains
#> 2                         Corporation Tax statistics     hmrc_corporation_tax
#> 3          Creative Industries tax relief statistics hmrc_creative_industries
#> 4 Income Tax liabilities by income range (Table 2.5)    hmrc_income_tax_stats
#> 5           Inheritance Tax liabilities and receipts     hmrc_inheritance_tax
#> 6                      Patent Box reliefs statistics          hmrc_patent_box
#> 7    Research and Development Tax Credits Statistics          hmrc_rd_credits
#> 8                            UK Stamp Tax statistics          hmrc_stamp_duty
#> 9                                 Measuring Tax Gaps             hmrc_tax_gap
#>   frequency   start
#> 1    annual 1995-96
#> 2    annual 1999-00
#> 3    annual 1990-91
#> 4    annual 1990-91
#> 5    annual 2004-05
#> 6    annual 2003-04
#> 7    annual 2000-01
#> 8    annual 2003-04
#> 9    annual 2005-06
#>                                                                                                                   description
#> 1                                                            Annual Capital Gains Tax taxpayers, gains, and asset breakdowns.
#> 2                                     Annual Corporation Tax receipts and liabilities by levy type, sector, and company size.
#> 3                           Annual film, HETV, animation, children's TV, video games, theatre, orchestra, and museum reliefs.
#> 4                   Annual number of Income Tax payers, total income, liability and average rate by income range (Table 2.5).
#> 5                                     Annual Inheritance Tax liabilities and receipts; estate counts; tax due by estate band.
#> 6                                                                       Annual Patent Box election counts and relief claimed.
#> 7                                     Annual R&D tax credit claims and cost for SME R&D Relief and RDEC schemes from 2000-01.
#> 8                               Annual Stamp Duty Land Tax, Stamp Duty Reserve Tax, and stamp duty on documents from 2003-04.
#> 9 Annual estimate of the difference between tax owed and tax collected, by tax type, taxpayer group, and behaviour component.

# Roadmap items mentioning capital gains
hmrc_search("capital gains", implemented = FALSE)
#> [1] dataset       publication   function_name frequency     start        
#> [6] description  
#> <0 rows> (or 0-length row.names)
```
