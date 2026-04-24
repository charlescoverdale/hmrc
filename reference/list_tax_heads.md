# List available tax heads in the HMRC Tax Receipts bulletin

Returns a data frame describing all tax and duty heads available in
[`get_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/get_tax_receipts.md).
No network connection is required; the data is bundled with the package.

## Usage

``` r
list_tax_heads()
```

## Value

A data frame with columns:

- tax_head:

  Character. The identifier used in the `tax` argument of
  [`get_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/get_tax_receipts.md).

- description:

  Character. Plain-English description of the series.

- category:

  Character. Broad grouping: `"income"`, `"expenditure"`,
  `"consumption"`, `"property"`, `"environment"`, `"nics"`, or
  `"total"`.

- available_from:

  Character. Earliest year of monthly data (approximate).

## See also

Other data access:
[`clear_cache()`](https://charlescoverdale.github.io/hmrc/reference/clear_cache.md),
[`get_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/get_tax_gap.md)

## Examples

``` r
list_tax_heads()
#>                              tax_head
#> 1                      total_receipts
#> 2                          income_tax
#> 3                   capital_gains_tax
#> 4                     inheritance_tax
#> 5                 apprenticeship_levy
#> 6                          nics_total
#> 7                       nics_employer
#> 8                       nics_employee
#> 9                  nics_self_employed
#> 10                                vat
#> 11                    corporation_tax
#> 12                          bank_levy
#> 13                     bank_surcharge
#> 14                   bank_payroll_tax
#> 15               diverted_profits_tax
#> 16               digital_services_tax
#> 17 residential_property_developer_tax
#> 18                energy_profits_levy
#> 19        electricity_generators_levy
#> 20                economic_crime_levy
#> 21              petroleum_revenue_tax
#> 22                          fuel_duty
#> 23                  stamp_duty_shares
#> 24                               sdlt
#> 25                               ated
#> 26                       tobacco_duty
#> 27                       spirits_duty
#> 28                          beer_duty
#> 29                          wine_duty
#> 30                         cider_duty
#> 31                    gambling_duties
#> 32                 air_passenger_duty
#> 33              insurance_premium_tax
#> 34                       landfill_tax
#> 35                climate_change_levy
#> 36                    aggregates_levy
#> 37                   soft_drinks_levy
#> 38              plastic_packaging_tax
#> 39                     customs_duties
#> 40                      miscellaneous
#> 41                          penalties
#>                                                       description    category
#> 1                                             Total HMRC receipts       total
#> 2                           Income Tax (PAYE and Self Assessment)      income
#> 3                                               Capital Gains Tax      income
#> 4                                                 Inheritance Tax      income
#> 5                                             Apprenticeship Levy      income
#> 6                  National Insurance Contributions (all classes)        nics
#> 7      National Insurance Contributions - employer (Class 1 PAYE)        nics
#> 8      National Insurance Contributions - employee (Class 1 PAYE)        nics
#> 9  National Insurance Contributions - self-employed (Class 2 & 4)        nics
#> 10                                                Value Added Tax consumption
#> 11                                      Corporation Tax (onshore)      income
#> 12                                                      Bank Levy      income
#> 13                                                 Bank Surcharge      income
#> 14                                               Bank Payroll Tax      income
#> 15                                           Diverted Profits Tax      income
#> 16                                           Digital Services Tax      income
#> 17                             Residential Property Developer Tax      income
#> 18                                            Energy Profits Levy      income
#> 19                                    Electricity Generators Levy      income
#> 20                                            Economic Crime Levy      income
#> 21                                          Petroleum Revenue Tax      income
#> 22                             Hydrocarbon Oil Duties (Fuel Duty) consumption
#> 23                                Stamp Duty Reserve Tax (shares)    property
#> 24                                            Stamp Duty Land Tax    property
#> 25                              Annual Tax on Enveloped Dwellings    property
#> 26                                                 Tobacco Duties consumption
#> 27                                                 Spirits Duties consumption
#> 28                                                    Beer Duties consumption
#> 29                                      Wine and Made-Wine Duties consumption
#> 30                                         Cider and Perry Duties consumption
#> 31                                      Betting and Gaming Duties consumption
#> 32                                             Air Passenger Duty consumption
#> 33                                          Insurance Premium Tax consumption
#> 34                                                   Landfill Tax environment
#> 35                                            Climate Change Levy environment
#> 36                                                Aggregates Levy environment
#> 37                                      Soft Drinks Industry Levy consumption
#> 38                                          Plastic Packaging Tax consumption
#> 39                                                 Customs Duties       other
#> 40                                         Miscellaneous receipts       other
#> 41                                         Penalties and interest       other
#>    available_from
#> 1            2016
#> 2            2016
#> 3            2016
#> 4            2016
#> 5            2017
#> 6            2016
#> 7            2016
#> 8            2016
#> 9            2016
#> 10           2016
#> 11           2016
#> 12           2016
#> 13           2016
#> 14           2010
#> 15           2016
#> 16           2020
#> 17           2022
#> 18           2022
#> 19           2023
#> 20           2023
#> 21           2016
#> 22           2016
#> 23           2016
#> 24           2016
#> 25           2016
#> 26           2016
#> 27           2016
#> 28           2016
#> 29           2016
#> 30           2016
#> 31           2016
#> 32           2016
#> 33           2016
#> 34           2016
#> 35           2016
#> 36           2016
#> 37           2018
#> 38           2022
#> 39           2016
#> 40           2016
#> 41           2016
```
