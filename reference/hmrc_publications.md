# Index of HMRC publications known to the package

Tidy roster of HMRC publications, marking which are exposed via an
`hmrc_*` function and which are on the development roadmap. Useful for
planning analyses, citing the package, and tracking coverage over time.

## Usage

``` r
hmrc_publications(status = c("all", "implemented", "planned"))
```

## Arguments

- status:

  One of `"all"` (default), `"implemented"`, or `"planned"`.

## Value

A data frame with one row per publication and a `status` column
(`"implemented"` or `"planned"`).

## See also

Other infrastructure:
[`hmrc_cache_info()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_cache_info.md),
[`hmrc_clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_clear_cache.md),
[`hmrc_list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_list_tax_heads.md),
[`hmrc_meta()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_meta.md),
[`hmrc_search()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_search.md)

## Examples

``` r
# Everything in the catalogue
hmrc_publications()
#>         status                            dataset
#> 1  implemented           capital_gains_tax_annual
#> 2  implemented             corporation_tax_annual
#> 3  implemented        creative_industries_reliefs
#> 4  implemented               tax_receipts_monthly
#> 5  implemented                fuel_duties_monthly
#> 6  implemented    income_tax_liabilities_by_range
#> 7  implemented             inheritance_tax_annual
#> 8  implemented                     tax_gap_annual
#> 9  implemented      property_transactions_monthly
#> 10 implemented                         patent_box
#> 11 implemented                  rd_credits_annual
#> 12 implemented                   tax_heads_lookup
#> 13 implemented             tobacco_duties_monthly
#> 14 implemented                  stamp_duty_annual
#> 15 implemented                        vat_monthly
#> 16     planned               savings_stats_annual
#> 17     planned                       eis_seis_vct
#> 18     planned                  paye_rti_regional
#> 19     planned      pension_flexibility_quarterly
#> 20     planned income_tax_liabilities_projections
#> 21     planned                     spi_aggregated
#> 22     planned             self_assessment_annual
#> 23     planned              tax_reliefs_catalogue
#>                                                               publication
#> 1                                            Capital Gains Tax statistics
#> 2                                              Corporation Tax statistics
#> 3                               Creative Industries tax relief statistics
#> 4                           HMRC tax receipts and NICs (monthly bulletin)
#> 5                                 Hydrocarbon Oils Bulletin (fuel duties)
#> 6                      Income Tax liabilities by income range (Table 2.5)
#> 7                                Inheritance Tax liabilities and receipts
#> 8                                                      Measuring Tax Gaps
#> 9                                        Monthly UK property transactions
#> 10                                          Patent Box reliefs statistics
#> 11                        Research and Development Tax Credits Statistics
#> 12                                               Tax head reference table
#> 13                                                       Tobacco Bulletin
#> 14                                                UK Stamp Tax statistics
#> 15                         VAT annual statistics (monthly receipts table)
#> 16                                              Annual Savings Statistics
#> 17                                           EIS, SEIS and VCT statistics
#> 18 Earnings and employment from PAYE Real Time Information (ONS bulletin)
#> 19                            Flexible payments from pensions (quarterly)
#> 20                Income Tax Liabilities Statistics (forward projections)
#> 21               Personal Incomes Statistics (Survey of Personal Incomes)
#> 22                                             Self Assessment statistics
#> 23                                        Tax Relief Statistics catalogue
#>                 function_name frequency   start    publisher
#> 1          hmrc_capital_gains    annual 1995-96         HMRC
#> 2        hmrc_corporation_tax    annual 1999-00         HMRC
#> 3    hmrc_creative_industries    annual 1990-91         HMRC
#> 4           hmrc_tax_receipts   monthly 2008-04         HMRC
#> 5            hmrc_fuel_duties   monthly 1990-01         HMRC
#> 6       hmrc_income_tax_stats    annual 1990-91         HMRC
#> 7        hmrc_inheritance_tax    annual 2004-05         HMRC
#> 8                hmrc_tax_gap    annual 2005-06         HMRC
#> 9  hmrc_property_transactions   monthly 2005-04         HMRC
#> 10            hmrc_patent_box    annual 2003-04         HMRC
#> 11            hmrc_rd_credits    annual 2000-01         HMRC
#> 12        hmrc_list_tax_heads    static    <NA> hmrc package
#> 13        hmrc_tobacco_duties   monthly 1991-01         HMRC
#> 14            hmrc_stamp_duty    annual 2003-04         HMRC
#> 15                   hmrc_vat   monthly 1973-04         HMRC
#> 16                       <NA>    annual 1999-00         HMRC
#> 17                       <NA>    annual 1993-94         HMRC
#> 18                       <NA>   monthly 2014-07     ONS/HMRC
#> 19                       <NA> quarterly 2015-04         HMRC
#> 20                       <NA>    annual 1990-91         HMRC
#> 21                       <NA>    annual 1962-63         HMRC
#> 22                       <NA>    annual 1990-91         HMRC
#> 23                       <NA>  biannual    <NA>         HMRC
#>                                                                                                                                                                  url
#> 1                                                                 https://www.gov.uk/government/organisations/hm-revenue-customs/series/capital-gains-tax-statistics
#> 2                                                                     https://www.gov.uk/government/collections/analyses-of-corporation-tax-receipts-and-liabilities
#> 3                                                                                           https://www.gov.uk/government/collections/creative-industries-statistics
#> 4                                                                                     https://www.gov.uk/government/statistics/hmrc-tax-and-nics-receipts-for-the-uk
#> 5                                                                                                 https://www.gov.uk/government/statistics/hydrocarbon-oils-bulletin
#> 6                                                                                    https://www.gov.uk/government/statistics/income-tax-liabilities-by-income-range
#> 7                                                                                    https://www.gov.uk/government/statistics/inheritance-tax-liabilities-statistics
#> 8                                                                                                        https://www.gov.uk/government/statistics/measuring-tax-gaps
#> 9                                               https://www.gov.uk/government/statistics/monthly-property-transactions-completed-in-the-uk-with-value-40000-or-above
#> 10                                                                                            https://www.gov.uk/government/statistics/patent-box-reliefs-statistics
#> 11                                                                        https://www.gov.uk/government/statistics/corporate-tax-research-and-development-tax-credit
#> 12                                                                                                                                                              <NA>
#> 13                                                                                                         https://www.gov.uk/government/statistics/tobacco-bulletin
#> 14                                                                                                  https://www.gov.uk/government/statistics/uk-stamp-tax-statistics
#> 15                                                                                    https://www.gov.uk/government/statistics/value-added-tax-vat-annual-statistics
#> 16                                                                                               https://www.gov.uk/government/collections/annual-savings-statistics
#> 17                                                                                 https://www.gov.uk/government/collections/enterprise-investment-scheme-statistics
#> 18 https://www.ons.gov.uk/employmentandlabourmarket/peopleinwork/earningsandworkinghours/bulletins/earningsandemploymentfrompayasyouearnrealtimeinformationuk/latest
#> 19                                                                                          https://www.gov.uk/government/statistics/flexible-payments-from-pensions
#> 20                                                                                 https://www.gov.uk/government/collections/income-tax-statistics-and-distributions
#> 21                                                                                             https://www.gov.uk/government/collections/personal-incomes-statistics
#> 22                                                                                              https://www.gov.uk/government/collections/self-assessment-statistics
#> 23                                                                                                   https://www.gov.uk/government/collections/tax-relief-statistics
#>                                                                                                                       description
#> 1                                                                Annual Capital Gains Tax taxpayers, gains, and asset breakdowns.
#> 2                                         Annual Corporation Tax receipts and liabilities by levy type, sector, and company size.
#> 3                               Annual film, HETV, animation, children's TV, video games, theatre, orchestra, and museum reliefs.
#> 4                  Monthly cash receipts for 41 tax heads (Income Tax, NICs, VAT, Corporation Tax, duties, etc.) from April 2008.
#> 5                                   Monthly hydrocarbon oil duty receipts by fuel type (petrol, diesel, other) from January 1990.
#> 6                       Annual number of Income Tax payers, total income, liability and average rate by income range (Table 2.5).
#> 7                                         Annual Inheritance Tax liabilities and receipts; estate counts; tax due by estate band.
#> 8     Annual estimate of the difference between tax owed and tax collected, by tax type, taxpayer group, and behaviour component.
#> 9  Monthly residential and non-residential property transactions for England, Scotland, Wales, NI, and UK total, from April 2005.
#> 10                                                                          Annual Patent Box election counts and relief claimed.
#> 11                                        Annual R&D tax credit claims and cost for SME R&D Relief and RDEC schemes from 2000-01.
#> 12                               Static reference table mapping tax head identifiers used in hmrc_tax_receipts() to descriptions.
#> 13                          Monthly tobacco duty receipts by product (cigarettes, cigars, hand-rolling, other) from January 1991.
#> 14                                  Annual Stamp Duty Land Tax, Stamp Duty Reserve Tax, and stamp duty on documents from 2003-04.
#> 15                               Monthly VAT receipts split into payments, repayments, import VAT, and home VAT, from April 1973.
#> 16                                                        Annual ISA, Help to Save, Lifetime ISA and Child Trust Fund statistics.
#> 17                           Annual Enterprise Investment Scheme, Seed EIS, and Venture Capital Trusts subscriptions and reliefs.
#> 18             Monthly PAYE Real Time Information regional pay and headcount, by NUTS 1/2/3, local authority, age, sex, industry.
#> 19                                Quarterly flexible drawdown statistics: withdrawal counts, values, and tax overpayment refunds.
#> 20                            Forward-looking Income Tax liabilities projections including the current tax year (Tables 2.1-2.7).
#> 21                                       Aggregated Survey of Personal Incomes tables 3.1-3.17: income, region, age, sex, source.
#> 22                                   Annual Self Assessment statistics: returns submitted, taxpayer counts by region / age / sex.
#> 23                                                              Half-yearly catalogue of ~380 UK tax reliefs with cost estimates.

# Only roadmap items
hmrc_publications("planned")
#>    status                            dataset
#> 1 planned               savings_stats_annual
#> 2 planned                       eis_seis_vct
#> 3 planned                  paye_rti_regional
#> 4 planned      pension_flexibility_quarterly
#> 5 planned income_tax_liabilities_projections
#> 6 planned                     spi_aggregated
#> 7 planned             self_assessment_annual
#> 8 planned              tax_reliefs_catalogue
#>                                                              publication
#> 1                                              Annual Savings Statistics
#> 2                                           EIS, SEIS and VCT statistics
#> 3 Earnings and employment from PAYE Real Time Information (ONS bulletin)
#> 4                            Flexible payments from pensions (quarterly)
#> 5                Income Tax Liabilities Statistics (forward projections)
#> 6               Personal Incomes Statistics (Survey of Personal Incomes)
#> 7                                             Self Assessment statistics
#> 8                                        Tax Relief Statistics catalogue
#>   function_name frequency   start publisher
#> 1          <NA>    annual 1999-00      HMRC
#> 2          <NA>    annual 1993-94      HMRC
#> 3          <NA>   monthly 2014-07  ONS/HMRC
#> 4          <NA> quarterly 2015-04      HMRC
#> 5          <NA>    annual 1990-91      HMRC
#> 6          <NA>    annual 1962-63      HMRC
#> 7          <NA>    annual 1990-91      HMRC
#> 8          <NA>  biannual    <NA>      HMRC
#>                                                                                                                                                                 url
#> 1                                                                                               https://www.gov.uk/government/collections/annual-savings-statistics
#> 2                                                                                 https://www.gov.uk/government/collections/enterprise-investment-scheme-statistics
#> 3 https://www.ons.gov.uk/employmentandlabourmarket/peopleinwork/earningsandworkinghours/bulletins/earningsandemploymentfrompayasyouearnrealtimeinformationuk/latest
#> 4                                                                                          https://www.gov.uk/government/statistics/flexible-payments-from-pensions
#> 5                                                                                 https://www.gov.uk/government/collections/income-tax-statistics-and-distributions
#> 6                                                                                             https://www.gov.uk/government/collections/personal-incomes-statistics
#> 7                                                                                              https://www.gov.uk/government/collections/self-assessment-statistics
#> 8                                                                                                   https://www.gov.uk/government/collections/tax-relief-statistics
#>                                                                                                          description
#> 1                                            Annual ISA, Help to Save, Lifetime ISA and Child Trust Fund statistics.
#> 2               Annual Enterprise Investment Scheme, Seed EIS, and Venture Capital Trusts subscriptions and reliefs.
#> 3 Monthly PAYE Real Time Information regional pay and headcount, by NUTS 1/2/3, local authority, age, sex, industry.
#> 4                    Quarterly flexible drawdown statistics: withdrawal counts, values, and tax overpayment refunds.
#> 5                Forward-looking Income Tax liabilities projections including the current tax year (Tables 2.1-2.7).
#> 6                           Aggregated Survey of Personal Incomes tables 3.1-3.17: income, region, age, sex, source.
#> 7                       Annual Self Assessment statistics: returns submitted, taxpayer counts by region / age / sex.
#> 8                                                  Half-yearly catalogue of ~380 UK tax reliefs with cost estimates.
```
