# Getting UK tax data with hmrc

The `hmrc` package provides tidy access to statistical data published by
HM Revenue and Customs (HMRC) on GOV.UK. All functions resolve download
URLs at runtime via the GOV.UK Content API and cache files locally
between sessions. Every result is returned as an `hmrc_tbl`, a subclass
of `data.frame` carrying provenance metadata (source URL, fetch time,
vintage, cell methods) for reproducible fiscal research.

``` r
library(hmrc)
```

## Discovery

[`hmrc_search()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_search.md)
searches the dataset catalogue by keyword.
[`hmrc_publications()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_publications.md)
returns a tidy index of implemented and planned datasets.

``` r
# Anything in the catalogue mentioning capital gains
hmrc_search("capital gains")

# Only annual datasets already implemented
hmrc_search(implemented = TRUE, frequency = "annual")
```

## Monthly tax receipts

[`hmrc_tax_receipts()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_receipts.md)
downloads the monthly HMRC Tax Receipts and National Insurance
Contributions bulletin, covering 41 tax heads from April 2008 to the
most recent published month.

``` r
# All 41 tax heads
receipts <- hmrc_tax_receipts()
head(receipts)
#>         date   tax_head          description receipts_gbp_m
#>   2016-04-01 income_tax Income Tax (PAYE...          17423
#>   2016-05-01 income_tax Income Tax (PAYE...          11847
```

Use
[`hmrc_list_tax_heads()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_list_tax_heads.md)
to see all available identifiers without downloading data:

``` r
hmrc_list_tax_heads()
```

Filter to specific heads and date ranges:

``` r
big_three <- hmrc_tax_receipts(
  tax   = c("income_tax", "vat", "nics_total"),
  start = "2020-01"
)
```

Inspect the provenance metadata on any result:

``` r
hmrc_meta(big_three)
#> $dataset
#> [1] "tax_receipts_monthly"
#> $source_url
#> [1] "https://www.gov.uk/government/statistics/hmrc-tax-and-nics-receipts-for-the-uk"
#> $cell_methods
#> [1] "cash"
#> $frequency
#> [1] "monthly"
#> $fetched_at
#> [1] "2026-04-26 09:00:00 UTC"
```

``` r
library(ggplot2)

ggplot(big_three, aes(x = date, y = receipts_gbp_m / 1000, colour = description)) +
  geom_line(linewidth = 0.8) +
  scale_y_continuous(labels = scales::label_comma(suffix = "bn")) +
  labs(
    title   = "UK monthly tax receipts",
    x       = NULL,
    y       = "GBP billions",
    colour  = NULL,
    caption = "Source: HMRC Tax Receipts and NICs bulletin"
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "bottom")
```

## VAT

[`hmrc_vat()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_vat.md)
covers monthly VAT receipts from April 1973, broken into payments,
repayments, import VAT, and home VAT.

``` r
# Net VAT: total minus repayments
vat <- hmrc_vat(measure = c("total", "repayments"), start = "2015-01")

# Repayments are recorded as negative (money flowing out of HMRC)
head(vat[vat$measure == "repayments", c("date", "receipts_gbp_m")])
```

## Fuel duties

[`hmrc_fuel_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_fuel_duties.md)
covers monthly hydrocarbon oil duty receipts from January 1990, broken
down into petrol, diesel, other, and total.

``` r
fuel <- hmrc_fuel_duties(fuel = "total", start = "2010-01")

# Annual totals
fuel$year <- format(fuel$date, "%Y")
aggregate(receipts_gbp_m ~ year, data = fuel, FUN = sum)
```

## Tobacco duties

[`hmrc_tobacco_duties()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tobacco_duties.md)
covers monthly tobacco duty receipts from January 1991, by product:
cigarettes, cigars, hand-rolling tobacco, other, and total.

``` r
tobacco <- hmrc_tobacco_duties(product = c("cigarettes", "hand_rolling"),
                               start   = "2015-01")
```

## Corporation Tax

[`hmrc_corporation_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_corporation_tax.md)
returns annual Corporation Tax receipts broken down by levy type:
onshore CT, offshore CT, Bank Levy, Bank Surcharge, Residential Property
Developer Tax (RPDT), Energy Profits Levy (EPL), and Electricity
Generators Levy (EGL). Covers 2019-20 to the most recent financial year.

``` r
ct <- hmrc_corporation_tax()
ct[ct$type == "total_ct", c("tax_year", "receipts_gbp_m")]
```

## Stamp duty

[`hmrc_stamp_duty()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_stamp_duty.md)
returns annual stamp duty receipts by type from 2003-04: SDLT on
property, SDLT on new leases, SDRT on shares, and stamp duty on
documents.

``` r
sd <- hmrc_stamp_duty(type = "sdlt_total")
tail(sd[, c("tax_year", "receipts_gbp_m")], 5)
```

## R&D tax credits

[`hmrc_rd_credits()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_rd_credits.md)
returns annual statistics on R&D tax credit claims and their cost by
scheme (SME R&D Relief and RDEC) from 2000-01.

``` r
# Cost of R&D credits: SME vs RDEC
rd <- hmrc_rd_credits(measure = "amount_gbp_m")
rd[rd$tax_year == "2023-24", c("scheme", "description", "value")]
```

## Capital Gains Tax

[`hmrc_capital_gains()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_capital_gains.md)
returns annual estimates of CGT taxpayers, gains, and tax liabilities
from 1987-88 (HMRC CGT Table 1).

``` r
# Total CGT receipts over time
cgt <- hmrc_capital_gains(measure = "tax_total_gbp_m")
tail(cgt[, c("tax_year", "value")], 6)
```

## Inheritance Tax

[`hmrc_inheritance_tax()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_inheritance_tax.md)
returns IHT estate counts, tax due, average tax, and effective tax rates
by net-estate band for the latest published year of death (HMRC IHT
Table 12.1a). The publication carries a roughly three-year
administrative lag.

``` r
iht <- hmrc_inheritance_tax()
iht[iht$measure == "number_taxed" & iht$estate_band != "Total",
    c("estate_band", "value")]
```

## Patent Box

[`hmrc_patent_box()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_patent_box.md)
returns the annual count of companies electing into the Patent Box and
total relief claimed (HMRC Patent Box Table 1) from 2013-14 onwards.

``` r
hmrc_patent_box()
```

## Creative Industries reliefs

[`hmrc_creative_industries()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_creative_industries.md)
returns annual reliefs across the eight creative industries reliefs
(film, high-end TV, animation, children’s TV, video games, theatre,
orchestra, museums and galleries).

``` r
# Film tax relief over time
hmrc_creative_industries(sector = "film")

# All eight sectors in the latest year
hmrc_creative_industries(tax_year = "2023-24")
```

## Tax gap

[`hmrc_tax_gap()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_tax_gap.md)
returns the most recent cross-sectional tax gap estimates, broken down
by tax type, taxpayer group, and behaviour component (evasion, error,
avoidance, etc.).

``` r
gap <- hmrc_tax_gap()

# Sort by absolute gap
gap[order(-gap$gap_gbp_bn),
    c("tax", "component", "gap_gbp_bn", "uncertainty")]
```

## Income Tax liabilities

[`hmrc_income_tax_stats()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_income_tax_stats.md)
returns annual Income Tax liabilities by income range (HMRC Table 2.5),
including taxpayer counts, total income, tax liabilities, and average
tax rates.

``` r
it <- hmrc_income_tax_stats(tax_year = "2023-24")
it[, c("income_range", "taxpayers_thousands", "tax_liability_gbp_m", "average_rate_pct")]
```

## Property transactions

[`hmrc_property_transactions()`](https://charlescoverdale.github.io/hmrc/reference/hmrc_property_transactions.md)
returns monthly counts of residential and non-residential property
transactions by UK nation from April 2005.

``` r
prop <- hmrc_property_transactions(
  type   = "residential",
  nation = "uk",
  start  = "2018-01"
)
```

``` r
ggplot(prop, aes(x = date, y = transactions / 1000)) +
  geom_line(colour = "#3B82F6", linewidth = 0.8) +
  scale_y_continuous(labels = scales::label_comma(suffix = "k")) +
  labs(
    title   = "UK residential property transactions",
    x       = NULL,
    y       = "Transactions (thousands)",
    caption = "Source: HMRC Monthly Property Transactions bulletin"
  ) +
  theme_minimal(base_size = 12)
```

## Caching

All downloads are cached locally in your user cache directory.
Subsequent calls return the cached file instantly with no network
request.

``` r
# Inspect the cache
hmrc_cache_info()

# Remove files older than 30 days
hmrc_clear_cache(max_age_days = 30)

# Remove everything and start fresh
hmrc_clear_cache()
```
