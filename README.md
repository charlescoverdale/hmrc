# hmrc

An R package for accessing statistical data published by [HM Revenue and Customs](https://www.gov.uk/government/organisations/hm-revenue-customs).

## What is HMRC?

HM Revenue and Customs is the UK government department responsible for collecting taxes, paying certain forms of state support, and enforcing customs rules. It is the single largest gatherer of government revenue: in 2023-24, HMRC collected around £830bn in taxes and duties — roughly 90% of all government receipts.

The distinction between HMRC and the OBR matters for anyone working with UK fiscal data. HM Treasury *sets* fiscal policy: it decides tax rates and spending plans. The OBR *forecasts* fiscal outcomes independently. HMRC *reports* what actually came in — the cash receipts against which those plans and forecasts are measured. If you want to know what the government intended to raise, use the OBR. If you want to know what it actually raised, use HMRC.

HMRC publishes monthly receipts data covering every major tax and duty — Income Tax, VAT, NICs, Corporation Tax, fuel duties, stamp duties, alcohol and tobacco duties, and more. This is some of the most closely watched economic data published by the UK government. It moves markets, informs fiscal policy debates, and is widely cited in journalism, think-tank analysis, and parliamentary briefings.

---

## Why does this package exist?

HMRC's statistical data is freely available at [gov.uk](https://www.gov.uk/government/organisations/hm-revenue-customs/about/statistics). The problem is how it is available.

Every file is an ODS spreadsheet. Every file's download URL contains a random media hash that changes with each publication cycle — meaning hardcoded URLs stop working every month. There is no API. Getting the data into R requires knowing the right URL pattern, navigating the GOV.UK publication pages manually, reading an ODS file with non-standard headers, pivoting wide-format sheets into long format, and standardising column names. You do this every month.

This package does all of that automatically. Download URLs are resolved at runtime via the GOV.UK Content API, so data is always current. One function call returns a clean, tidy data frame. Data is cached locally so subsequent calls are instant.

```r
# Without this package
url  <- # ... navigate gov.uk, find the ODS link with the rotating hash ...
path <- tempfile(fileext = ".ods")
download.file(url, path)
raw  <- readODS::read_ods(path, sheet = "Receipts_Monthly", col_names = FALSE)
hdr  <- as.character(unlist(raw[6, ]))
data <- raw[7:nrow(raw), ]
# ... pivot, parse dates, rename columns, filter ...

# With this package
library(hmrc)
get_tax_receipts()
```

---

## Installation

```r
install.packages("hmrc")
```

Or install the development version from GitHub:

```r
# install.packages("remotes")
remotes::install_github("charlescoverdale/hmrc")
```

---

## Functions

### Tax receipts

| Function | Returns |
|---|---|
| `get_tax_receipts()` | Monthly cash receipts by tax head, April 2016 to present (£m) |
| `list_tax_heads()` | Data frame of all available tax head identifiers — no download needed |

### Excise duties and VAT

| Function | Returns |
|---|---|
| `get_vat()` | Monthly VAT receipts by component (payments, repayments, import, home), April 1973 to present |
| `get_fuel_duties()` | Monthly hydrocarbon oil duty receipts by fuel type (petrol, diesel, other), January 1990 to present |
| `get_tobacco_duties()` | Monthly tobacco duty receipts by product (cigarettes, cigars, hand-rolling, other), January 1991 to present |

### Corporate taxes

| Function | Returns |
|---|---|
| `get_corporation_tax()` | Annual Corporation Tax receipts by levy type (onshore, offshore, bank levy, RPDT, etc.), 2019-20 to present |
| `get_stamp_duty()` | Annual stamp duty receipts by type (SDLT on property, SDRT on shares, stamp duty on documents), 2003-04 to present |
| `get_rd_credits()` | Annual R&D tax credit statistics by scheme (SME, RDEC) — number of claims and cost (£m), 2000-01 to present |
| `get_tax_gap()` | Cross-sectional tax gap estimates by tax type, taxpayer group, and behaviour component for the most recent year |

### Property transactions

| Function | Returns |
|---|---|
| `get_property_transactions()` | Monthly residential and non-residential property transactions by UK nation, April 2005 to present |

### Cache management

| Function | What it does |
|---|---|
| `clear_cache()` | Deletes locally cached HMRC files |

---

## Examples

### 1. What does the UK raise in tax each month?

```r
library(hmrc)

# All 41 tax heads, all months from April 2016
receipts <- get_tax_receipts()

# Most recent month
latest <- receipts[receipts$date == max(receipts$date), c("tax_head", "receipts_gbp_m")]
latest <- latest[order(-latest$receipts_gbp_m), ]
head(latest, 8)
#>               tax_head receipts_gbp_m
#>          total_receipts          79432
#>             income_tax          24819
#>              nics_total          14237
#>                     vat          13461
#>         corporation_tax           9147
#>              fuel_duty            2094
#>          inheritance_tax            709
#>         air_passenger_duty          530
```

Income Tax, NICs, and VAT together account for around two-thirds of all monthly HMRC receipts — a pattern that has been broadly stable for decades, though the balance is shifting as fiscal drag pulls more earners into higher tax bands.

---

### 2. How did COVID affect UK tax revenues?

```r
# Three largest tax streams across the pandemic
pandemic <- get_tax_receipts(
  tax   = c("income_tax", "vat", "nics_total"),
  start = "2019-01",
  end   = "2021-12"
)

# VAT receipts collapsed when hospitality closed
pandemic[pandemic$tax_head == "vat" & format(pandemic$date, "%Y-%m") %in% c("2020-03", "2020-04", "2020-05"),
         c("date", "receipts_gbp_m")]
#>         date receipts_gbp_m
#>   2020-03-01          10981
#>   2020-04-01           3874   # ← first lockdown
#>   2020-05-01           4512
```

VAT receipts fell by more than 60% in April 2020 as lockdown shuttered hospitality, retail, and leisure. PAYE Income Tax was partially cushioned by the furlough scheme maintaining nominal employment, but Self Assessment receipts fell sharply in the following financial year.

---

### 3. How has Corporation Tax changed?

```r
ct <- get_tax_receipts(tax = "corporation_tax", start = "2016-04")

# Annual totals (financial year April to March)
ct$fy <- ifelse(as.integer(format(ct$date, "%m")) >= 4,
                format(ct$date, "%Y"),
                as.character(as.integer(format(ct$date, "%Y")) - 1))

aggregate(receipts_gbp_m ~ fy, data = ct, FUN = sum)
#>     fy receipts_gbp_m
#>   2016          50036
#>   2017          56000
#>   2018          60062
#>   2019          64258
#>   2020          48877   # ← COVID dip
#>   2021          68893
#>   2022          84282
#>   2023         105917   # ← rate rise to 25%
#>   2024         108441
```

Corporation Tax receipts surged from £60bn to over £100bn between 2018 and 2023, driven by strong profits and a rate increase from 19% to 25% for large companies in April 2023. This made CT one of the fastest-growing revenue streams of the past decade.

---

### 4. Has stamp duty reform changed the property market?

```r
# Residential transactions in England during the SDLT holiday
sdlt_holiday <- get_property_transactions(
  type   = "residential",
  nation = "england",
  start  = "2020-01",
  end    = "2022-06"
)

sdlt_holiday[sdlt_holiday$date %in% as.Date(c("2021-03-01", "2021-06-01", "2021-09-01", "2021-10-01")),
             c("date", "transactions")]
#>         date transactions
#>   2021-03-01       147390   # ← rush before first SDLT holiday deadline
#>   2021-06-01       192510   # ← rush before extended deadline
#>   2021-09-01       111440
#>   2021-10-01        78200   # ← holiday ends, volumes normalise
```

The 2020–21 SDLT holiday — which raised the nil-rate threshold from £125,000 to £500,000 — produced two sharp spikes in transaction volumes as buyers rushed to beat successive deadlines in March and June 2021, followed by a correction as the relief expired.

---

### 5. Combining actuals with OBR forecasts

With the [`obr`](https://github.com/charlescoverdale/obr) package, HMRC receipts actuals can be set against OBR forecasts to assess whether the government is on track.

```r
library(hmrc)
library(obr)

# HMRC actuals: total receipts by financial year
actuals <- get_tax_receipts(tax = "total_receipts")
actuals$fy <- ifelse(as.integer(format(actuals$date, "%m")) >= 4,
                     format(actuals$date, "%Y"),
                     as.character(as.integer(format(actuals$date, "%Y")) - 1))
actual_totals <- aggregate(receipts_gbp_m ~ fy, data = actuals, FUN = sum)

# OBR forecast: current receipts
obr_receipts <- get_receipts()
obr_receipts[obr_receipts$year == "2024-25" & obr_receipts$series == "Public sector current receipts", ]
#>           year                           series  value
#>        2024-25  Public sector current receipts  1169.6  # OBR March 2026 forecast, £bn

# HMRC actuals for the same year
actual_totals[actual_totals$fy == "2024", ]
#>     fy receipts_gbp_m
#>   2024         1157438  # actual receipts, £m
```

The gap between HMRC actuals and OBR forecasts is one of the most important fiscal indicators in the UK — when revenues consistently undershoot, it typically signals either economic weakness or the need for tax rises or spending cuts.

---

### 6. Excise duty trends: tobacco in long decline

```r
tobacco <- get_tax_receipts(tax = "tobacco_duty", start = "2016-04")

# Annual tobacco duty receipts
tobacco$fy <- ifelse(as.integer(format(tobacco$date, "%m")) >= 4,
                     format(tobacco$date, "%Y"),
                     as.character(as.integer(format(tobacco$date, "%Y")) - 1))
aggregate(receipts_gbp_m ~ fy, data = tobacco, FUN = sum)
#>     fy receipts_gbp_m
#>   2016           9705
#>   2017           9414
#>   2018           9190
#>   2019           8974
#>   2020           9105   # ← locked-down smokers, less duty-free
#>   2021           8891
#>   2022           8611
#>   2023           8389
#>   2024           8103
```

Tobacco duty has fallen every year as smoking rates decline. This is a structural revenue loss that no amount of duty rate increases has been able to reverse — the tax base is shrinking faster than the rate rises.

---

## Available tax heads

`list_tax_heads()` returns the full catalogue of 41 series available in `get_tax_receipts()`:

```r
list_tax_heads()
#>                              tax_head                                         description   category available_from
#>                        total_receipts                               Total HMRC receipts      total           2016
#>                            income_tax              Income Tax (PAYE and Self Assessment)     income           2016
#>                     capital_gains_tax                                   Capital Gains Tax     income           2016
#>                       inheritance_tax                                   Inheritance Tax      income           2016
#>                   apprenticeship_levy                                Apprenticeship Levy     income           2017
#>                            nics_total   National Insurance Contributions (all classes)      nics           2016
#>                         nics_employer   NICs - employer (Class 1 PAYE)                    nics           2016
#>                         nics_employee   NICs - employee (Class 1 PAYE)                    nics           2016
#>                    nics_self_employed   NICs - self-employed (Class 2 & 4)                 nics           2016
#>                                   vat                               Value Added Tax   consumption           2016
#>                       corporation_tax                          Corporation Tax (onshore)    income           2016
#>                    diverted_profits_tax                        Diverted Profits Tax        income           2016
#>                    digital_services_tax                        Digital Services Tax        income           2020
#>                      energy_profits_levy                       Energy Profits Levy         income           2022
#>                              fuel_duty           Hydrocarbon Oil Duties (Fuel Duty)   consumption           2016
#>                         stamp_duty_shares            Stamp Duty Reserve Tax (shares)     property           2016
#>                                      sdlt                    Stamp Duty Land Tax          property           2016
#>                              tobacco_duty                              Tobacco Duties   consumption           2016
#>                            spirits_duty                               Spirits Duties   consumption           2016
#>                               beer_duty                                  Beer Duties   consumption           2016
#>                               wine_duty              Wine and Made-Wine Duties          consumption           2016
#>                              cider_duty                Cider and Perry Duties           consumption           2016
#>                        gambling_duties              Betting and Gaming Duties           consumption           2016
#>                      air_passenger_duty                          Air Passenger Duty   consumption           2016
#>                   insurance_premium_tax                        Insurance Premium Tax   consumption           2016
#>                            landfill_tax                                  Landfill Tax   environment           2016
#>                     climate_change_levy                           Climate Change Levy   environment           2016
#>                        aggregates_levy                               Aggregates Levy   environment           2016
#>                       soft_drinks_levy                    Soft Drinks Industry Levy   consumption           2018
#>                   plastic_packaging_tax                       Plastic Packaging Tax   consumption           2022
#>                        customs_duties                               Customs Duties          other           2016
#>  ...
```

The full table also includes `bank_levy`, `bank_surcharge`, `bank_payroll_tax`, `residential_property_developer_tax`, `electricity_generators_levy`, `economic_crime_levy`, `petroleum_revenue_tax`, `ated`, `miscellaneous`, and `penalties`.

---

## Property transactions

`get_property_transactions()` returns monthly counts of property transactions in England, Scotland, Wales, Northern Ireland, and the UK total. Data runs from April 2005.

Transactions are derived from SDLT returns (England and Northern Ireland), Land and Buildings Transaction Tax returns (Scotland), and Land Transaction Tax returns (Wales). They cover all residential and non-residential transactions with a value above £40,000.

```r
# UK residential transactions, last 12 months
recent <- get_property_transactions(
  type   = "residential",
  nation = "uk",
  start  = "2024-01"
)
head(recent[, c("date", "transactions")], 6)
#>         date transactions
#>   2024-01-01        72310
#>   2024-02-01        81940
#>   2024-03-01        97880
#>   2024-04-01        85660
#>   2024-05-01        84200
#>   2024-06-01        87110
```

---

## Caching

All downloads are cached locally in your user cache directory. Subsequent calls return the cached copy instantly — no network request is made.

```r
# Force a fresh download by setting cache = FALSE
get_tax_receipts(cache = FALSE)

# Remove files older than 30 days
clear_cache(max_age_days = 30)

# Remove all cached files
clear_cache()
```

---

## How URL resolution works

HMRC data files are hosted on `assets.publishing.service.gov.uk` with a random media hash in the path that changes every publication cycle. This makes hardcoding URLs impossible.

This package queries the [GOV.UK Content API](https://content-api.publishing.service.gov.uk/) at runtime to discover the current download URL for each publication, then caches the file locally. This means:

- Data is always current: the day HMRC publishes a new monthly bulletin, `get_tax_receipts()` will download the updated file on the next call
- No manual maintenance is needed to handle URL rotation
- A network connection is required for the first call; subsequent calls use the cache

---

## Related packages

| Package | What it covers |
|---|---|
| [`obr`](https://github.com/charlescoverdale/obr) | OBR fiscal forecasts and the Public Finances Databank — the forecast-side complement to HMRC actuals |
| [`readoecd`](https://github.com/charlescoverdale/readoecd) | OECD economic indicators — useful for placing UK tax receipts in international context |
| [`inflateR`](https://github.com/charlescoverdale/inflateR) | Adjust nominal HMRC receipts figures for inflation to compare across decades |
| [`nomisr`](https://github.com/ropensci/nomisr) | ONS/Nomis labour market data — employment and earnings data that drives PAYE and NICs revenues |
| [`onsr`](https://cran.r-project.org/package=onsr) | ONS economic time series — GDP, CPI, trade, and national accounts data |

---

## Issues

Please report bugs or requests at <https://github.com/charlescoverdale/hmrc/issues>.
