## data-raw/catalogue.R — rebuild data/catalogue.rda
##
## Catalogue of HMRC datasets known to the package. Each row is a single
## dataset (one bulletin, one set of related tables). Column meaning:
##
##   dataset       short identifier (used in hmrc_search, hmrc_publications)
##   publication   human-readable name of the GOV.UK publication
##   function_name R function exposing this dataset, NA_character_ if planned
##   frequency     monthly / quarterly / annual / triennial / point_in_time
##   start         first period in the published series (YYYY-MM or YYYY-YY)
##   publisher     HMRC, ONS/HMRC (joint), HMT, etc.
##   slug          GOV.UK statistics page slug (NA if not on gov.uk)
##   url           URL of the publication page
##   description   one-line description of the data
##   tags          space-separated keywords used by hmrc_search()

catalogue <- data.frame(
  stringsAsFactors = FALSE,
  dataset = c(
    "tax_receipts_monthly",
    "vat_monthly",
    "fuel_duties_monthly",
    "tobacco_duties_monthly",
    "corporation_tax_annual",
    "stamp_duty_annual",
    "property_transactions_monthly",
    "income_tax_liabilities_by_range",
    "rd_credits_annual",
    "tax_gap_annual",
    "tax_heads_lookup",
    # Phase 2 planned (not yet implemented; included so search and
    # publications() show what is on the roadmap)
    "paye_rti_regional",
    "spi_aggregated",
    "income_tax_liabilities_projections",
    "capital_gains_tax_annual",
    "inheritance_tax_annual",
    "self_assessment_annual",
    # Phase 3 planned
    "creative_industries_reliefs",
    "eis_seis_vct",
    "patent_box",
    "pension_flexibility_quarterly",
    "savings_stats_annual",
    "tax_reliefs_catalogue"
  ),
  publication = c(
    "HMRC tax receipts and NICs (monthly bulletin)",
    "VAT annual statistics (monthly receipts table)",
    "Hydrocarbon Oils Bulletin (fuel duties)",
    "Tobacco Bulletin",
    "Corporation Tax statistics",
    "UK Stamp Tax statistics",
    "Monthly UK property transactions",
    "Income Tax liabilities by income range (Table 2.5)",
    "Research and Development Tax Credits Statistics",
    "Measuring Tax Gaps",
    "Tax head reference table",
    "Earnings and employment from PAYE Real Time Information (ONS bulletin)",
    "Personal Incomes Statistics (Survey of Personal Incomes)",
    "Income Tax Liabilities Statistics (forward projections)",
    "Capital Gains Tax statistics",
    "Inheritance Tax liabilities and receipts",
    "Self Assessment statistics",
    "Creative Industries tax relief statistics",
    "EIS, SEIS and VCT statistics",
    "Patent Box reliefs statistics",
    "Flexible payments from pensions (quarterly)",
    "Annual Savings Statistics",
    "Tax Relief Statistics catalogue"
  ),
  function_name = c(
    "hmrc_tax_receipts",
    "hmrc_vat",
    "hmrc_fuel_duties",
    "hmrc_tobacco_duties",
    "hmrc_corporation_tax",
    "hmrc_stamp_duty",
    "hmrc_property_transactions",
    "hmrc_income_tax_stats",
    "hmrc_rd_credits",
    "hmrc_tax_gap",
    "hmrc_list_tax_heads",
    NA_character_,                  # paye_rti_regional
    NA_character_,                  # spi_aggregated
    NA_character_,                  # income_tax_liabilities_projections
    "hmrc_capital_gains",           # capital_gains_tax_annual
    "hmrc_inheritance_tax",         # inheritance_tax_annual
    NA_character_,                  # self_assessment_annual
    "hmrc_creative_industries",     # creative_industries_reliefs
    NA_character_,                  # eis_seis_vct
    "hmrc_patent_box",              # patent_box
    NA_character_,                  # pension_flexibility_quarterly
    NA_character_,                  # savings_stats_annual
    NA_character_                   # tax_reliefs_catalogue
  ),
  frequency = c(
    "monthly",
    "monthly",
    "monthly",
    "monthly",
    "annual",
    "annual",
    "monthly",
    "annual",
    "annual",
    "annual",
    "static",
    "monthly",
    "annual",
    "annual",
    "annual",
    "annual",
    "annual",
    "annual",
    "annual",
    "annual",
    "quarterly",
    "annual",
    "biannual"
  ),
  start = c(
    "2008-04",
    "1973-04",
    "1990-01",
    "1991-01",
    "1999-00",
    "2003-04",
    "2005-04",
    "1990-91",
    "2000-01",
    "2005-06",
    NA_character_,
    "2014-07",
    "1962-63",
    "1990-91",
    "1995-96",
    "2004-05",
    "1990-91",
    "1990-91",
    "1993-94",
    "2003-04",
    "2015-04",
    "1999-00",
    NA_character_
  ),
  publisher = c(
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "hmrc package",
    "ONS/HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC",
    "HMRC"
  ),
  slug = c(
    "hmrc-tax-and-nics-receipts-for-the-uk",
    "value-added-tax-vat-annual-statistics",
    "hydrocarbon-oils-bulletin",
    "tobacco-bulletin",
    "corporation-tax-statistics-{year}",
    "uk-stamp-tax-statistics",
    "monthly-property-transactions-completed-in-the-uk-with-value-40000-or-above",
    "income-tax-liabilities-by-income-range",
    "corporate-tax-research-and-development-tax-credit",
    "measuring-tax-gaps-tables",
    NA_character_,
    NA_character_,
    "personal-incomes-statistics",
    "income-tax-statistics-and-distributions",
    "capital-gains-tax-statistics",
    "inheritance-tax-liabilities-statistics",
    "self-assessment-statistics",
    "creative-industries-statistics",
    "enterprise-investment-scheme-seed-enterprise-investment-scheme-and-social-investment-tax-relief",
    "patent-box-reliefs-statistics",
    "flexible-payments-from-pensions",
    "annual-savings-statistics",
    "tax-relief-statistics"
  ),
  url = c(
    "https://www.gov.uk/government/statistics/hmrc-tax-and-nics-receipts-for-the-uk",
    "https://www.gov.uk/government/statistics/value-added-tax-vat-annual-statistics",
    "https://www.gov.uk/government/statistics/hydrocarbon-oils-bulletin",
    "https://www.gov.uk/government/statistics/tobacco-bulletin",
    "https://www.gov.uk/government/collections/analyses-of-corporation-tax-receipts-and-liabilities",
    "https://www.gov.uk/government/statistics/uk-stamp-tax-statistics",
    "https://www.gov.uk/government/statistics/monthly-property-transactions-completed-in-the-uk-with-value-40000-or-above",
    "https://www.gov.uk/government/statistics/income-tax-liabilities-by-income-range",
    "https://www.gov.uk/government/statistics/corporate-tax-research-and-development-tax-credit",
    "https://www.gov.uk/government/statistics/measuring-tax-gaps",
    NA_character_,
    "https://www.ons.gov.uk/employmentandlabourmarket/peopleinwork/earningsandworkinghours/bulletins/earningsandemploymentfrompayasyouearnrealtimeinformationuk/latest",
    "https://www.gov.uk/government/collections/personal-incomes-statistics",
    "https://www.gov.uk/government/collections/income-tax-statistics-and-distributions",
    "https://www.gov.uk/government/organisations/hm-revenue-customs/series/capital-gains-tax-statistics",
    "https://www.gov.uk/government/statistics/inheritance-tax-liabilities-statistics",
    "https://www.gov.uk/government/collections/self-assessment-statistics",
    "https://www.gov.uk/government/collections/creative-industries-statistics",
    "https://www.gov.uk/government/collections/enterprise-investment-scheme-statistics",
    "https://www.gov.uk/government/statistics/patent-box-reliefs-statistics",
    "https://www.gov.uk/government/statistics/flexible-payments-from-pensions",
    "https://www.gov.uk/government/collections/annual-savings-statistics",
    "https://www.gov.uk/government/collections/tax-relief-statistics"
  ),
  description = c(
    "Monthly cash receipts for 41 tax heads (Income Tax, NICs, VAT, Corporation Tax, duties, etc.) from April 2008.",
    "Monthly VAT receipts split into payments, repayments, import VAT, and home VAT, from April 1973.",
    "Monthly hydrocarbon oil duty receipts by fuel type (petrol, diesel, other) from January 1990.",
    "Monthly tobacco duty receipts by product (cigarettes, cigars, hand-rolling, other) from January 1991.",
    "Annual Corporation Tax receipts and liabilities by levy type, sector, and company size.",
    "Annual Stamp Duty Land Tax, Stamp Duty Reserve Tax, and stamp duty on documents from 2003-04.",
    "Monthly residential and non-residential property transactions for England, Scotland, Wales, NI, and UK total, from April 2005.",
    "Annual number of Income Tax payers, total income, liability and average rate by income range (Table 2.5).",
    "Annual R&D tax credit claims and cost for SME R&D Relief and RDEC schemes from 2000-01.",
    "Annual estimate of the difference between tax owed and tax collected, by tax type, taxpayer group, and behaviour component.",
    "Static reference table mapping tax head identifiers used in hmrc_tax_receipts() to descriptions.",
    "Monthly PAYE Real Time Information regional pay and headcount, by NUTS 1/2/3, local authority, age, sex, industry.",
    "Aggregated Survey of Personal Incomes tables 3.1-3.17: income, region, age, sex, source.",
    "Forward-looking Income Tax liabilities projections including the current tax year (Tables 2.1-2.7).",
    "Annual Capital Gains Tax taxpayers, gains, and asset breakdowns.",
    "Annual Inheritance Tax liabilities and receipts; estate counts; tax due by estate band.",
    "Annual Self Assessment statistics: returns submitted, taxpayer counts by region / age / sex.",
    "Annual film, HETV, animation, children's TV, video games, theatre, orchestra, and museum reliefs.",
    "Annual Enterprise Investment Scheme, Seed EIS, and Venture Capital Trusts subscriptions and reliefs.",
    "Annual Patent Box election counts and relief claimed.",
    "Quarterly flexible drawdown statistics: withdrawal counts, values, and tax overpayment refunds.",
    "Annual ISA, Help to Save, Lifetime ISA and Child Trust Fund statistics.",
    "Half-yearly catalogue of ~380 UK tax reliefs with cost estimates."
  ),
  tags = c(
    "receipts nics monthly",
    "vat receipts monthly indirect",
    "fuel duty hydrocarbon oils petrol diesel monthly",
    "tobacco duty monthly cigarettes cigars",
    "corporation tax companies annual",
    "stamp duty sdlt sdrt property shares annual",
    "property transactions sdlt monthly",
    "income tax distribution range spi annual",
    "rd research development credits sme rdec annual",
    "tax gap evasion avoidance annual",
    "metadata reference",
    "paye rti regional pay employment monthly labour",
    "spi survey personal incomes income tax distribution",
    "income tax liabilities projections forward annual",
    "capital gains cgt annual disposals assets",
    "inheritance iht estate annual",
    "self assessment sa annual",
    "creative industries film tv games theatre orchestra annual",
    "eis seis vct venture capital annual",
    "patent box innovation annual",
    "pensions flexibility drawdown quarterly",
    "isa savings lisa annual",
    "tax reliefs catalogue annual"
  )
)

stopifnot(!any(duplicated(catalogue$dataset)))

usethis::use_data(catalogue, overwrite = TRUE)
