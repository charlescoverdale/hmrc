# hmrc — Research-Grade Improvement Plan

**Baseline**: v0.3.3 (CRAN, 12 exports, March 2026)
**Target end-state**: v1.0.0 — the default R wrapper for HMRC data used by HMT, IFS, Resolution Foundation, OBR, 10DS PolicyEngine team, and academic fiscal economists
**Author**: Charles Coverdale, London
**Date**: 2026-04-25

---

## 0. Verdict

`hmrc` v0.3.3 is a clean, production-ready CRAN package with smart URL resolution and good error handling. It is **not yet** at the level of `boe` (provenance S3, search, cache info, vintages) or `fred` (real-time / ALFRED-style as-of queries) within the same author's stack. It covers 10 of HMRC's ~42 published statistical assets and offers no vintage support, no S3 class, no search function, no citation file, no DOI.

To become the default Treasury / IFS / Resolution Foundation tool, the package needs **eight phases of work** spanning architecture, data breadth, vintages, Treasury-grade helpers, microdata bridges, documentation, and academic credibility.

The strategic positioning is: **the canonical R wrapper for HMRC administrative data feeds**, sitting upstream of the microsimulation tools (PolicyEngine UK, UKMOD) rather than competing with them.

---

## 1. Honest current-state assessment

### 1.1 Strengths

- Clean API: 11 `get_*` data fetchers + 1 utility, consistent arguments (`start`, `end`, `cache`).
- Robust httr2 pipeline: 3-attempt retry, throttle (5/10 req/s), 30s API timeout, 120s download timeout.
- Smart runtime URL resolution via gov.uk Content API: protects against URL bitrot from HMRC republication.
- URL-hash file caching with `tools::R_user_dir`, configurable via `options(hmrc.cache_dir = ...)`.
- Good roxygen depth: `@param`, `@return`, `@source`, `@examples`, `@family` tags on all exported functions.
- Clean vignette + pkgdown site at https://charlescoverdale.github.io/hmrc/.
- README is publication-grade: badges, motivation, comparison tables, related-package list.
- 12 testthat files, 575 LOC, properly skip on CRAN / offline.

### 1.2 Architectural gaps vs the author's own `boe` and `fred` packages

| Feature | hmrc v0.3.3 | boe v0.1.2.9000 | fred v0.2.0 |
|---------|-------------|------------------|-------------|
| Prefix consistency (`pkg_*`) | get_* | boe_* | fred_* |
| S3 class with provenance | none | `boe_tbl` | `fred_tbl` |
| `*_search()` for catalogue browsing | missing | yes | implied via docs |
| `*_cache_info()` | missing | yes | yes |
| Vintage / as-of queries | missing | yes (`vintage=`) | yes (`fred_as_of`) |
| First-release retrieval | missing | n/a | `fred_first_release` |
| CITATION / DOI | none | tbd | tbd |
| JOSS paper | none | planned | planned |

The package therefore sits *behind* the maintainer's own state-of-the-art. Closing this gap is non-negotiable for a Treasury-grade reputation.

### 1.3 Data-coverage gaps

Currently covers **10 of ~42** identifiable HMRC statistical publications. Critical missing items, ranked by user demand:

**Tier 1 (must add)**
- PAYE Real-Time Information regional pay and headcount (ONS bulletin from HMRC RTI feed) — used in every UK labour-market analysis.
- Income Tax liabilities forward projections (Tables 2.5, 2.6) — distinct from SPI; aligns with OBR EFO.
- Capital Gains Tax statistics — taxpayers, gains, asset type.
- Inheritance Tax liabilities and receipts statistics.
- Self-Assessment statistics — taxpayer counts, regional / demographic breakdowns.
- National Insurance contributions detailed breakdown by class.

**Tier 2 (high value)**
- Creative Industries tax reliefs (film, HETV, games, theatre, orchestra, museums).
- EIS / SEIS / VCT statistics.
- Patent Box reliefs.
- Pension flexibility (drawdown) quarterly statistics.
- R&D credits sector breakdowns (current function returns aggregates only).
- Annual savings statistics (ISA / CTF / LISA / Help to Save).
- Tax relief statistics catalogue (380 reliefs).

**Tier 3 (nice-to-have)**
- Charity reliefs, employee share schemes, taxable benefits in kind.
- Trusts statistics, non-domiciled taxpayers, ATED.
- Personal Wealth statistics (triennial, last refreshed 2014-16).

**Out of scope for now**
- Whole of Government Accounts (PDF-heavy, low automation value).
- HMRC Developer Hub OAuth APIs (operational filing services, not stats).
- HMRC Datalab access (in-person facility, not callable).

### 1.4 Academic-rigour gaps

- No `inst/CITATION` file.
- No CITATION.cff (structured metadata for GitHub citation widget).
- No Zenodo / archive DOI.
- No JOSS or R Journal paper.
- No vintage tracking — every pull returns latest, breaking reproducibility for backtesting models.
- No provenance metadata in returned objects (no `source_url`, `fetched_at`, `vintage_date`).
- Tax gap function is cross-section only, not a time series.
- Income-tax stats only from 2022-23 onwards (recent reform break, no long historical panel).

---

## 2. Strategic positioning

### 2.1 Target users (in order of priority)

1. **10 Downing Street Data Science (10DS)** — building PolicyEngine-based microsim. Need clean upstream feeds.
2. **HMT Government Analysis Function** — Reproducible Analytical Pipelines strategy 2022-2026 sanctions R/Python.
3. **IFS researchers** — currently scrape gov.uk by hand; produce charts in R/Stata.
4. **Resolution Foundation** — fiscal commentary; uses R/Python.
5. **OBR economists** — official forecasts; need HMRC-OBR-ONS reconciliation.
6. **Academic fiscal economists** — *Fiscal Studies*, *JPubE* authors. Reproducibility now mandated by *RFS* (October 2025) and increasingly by other journals.
7. **Tax practitioners** — Big 4 tax-policy teams; commercial; fewer but high-value.

### 2.2 Competitive map

- **PolicyEngine UK** (Python, 40+ stars, very active, embedded at 10DS since summer 2025): the dominant UK fiscal microsim. Wraps the *model*, not the upstream data.
- **OpenFisca-UK**: now folded into PolicyEngine.
- **UKMOD** (Essex CeMPA): EUROMOD-derived; only Python-via-`reticulate` connector demonstrated October 2025.
- **IFS TAXBEN**: internal-only, never released.
- **IPPR Tax-Benefit Model**: closed-source, licensed.
- **`taxstats` + `grattan` (Hugh Parsonage)**: the Australian gold-standard. ATO wrapper + fast tax calculator. Template to emulate.
- **`dwpstat`** (Odell, 2018): moribund Stat-Xplore wrapper. Acquisition / successor target.
- **`nomisr`** (rOpenSci): labour-market sibling, well maintained. Cross-reference, do not compete.
- **`pvdmeulen/uktrade`**: non-CRAN OData wrapper for uktradeinfo. Cross-reference, do not duplicate.
- **`obr`, `ons` (Coverdale)**: complementary not competing; together they form the Treasury stack.

### 2.3 White space (where `hmrc` can win)

1. **Admin-data feed canonical R wrapper.** Nobody currently wraps SPI tables, RTI regional pay, CGT, IHT, Creative Industries reliefs etc. in machine-readable form for R.
2. **Treasury Green Book CBA primitives.** No CRAN package implements 3.5%/3.0% kinked discounting, optimism-bias multipliers, or HMRC-OBR-ONS crosswalks. The 2026 Green Book discount-rate review concludes 2025-26; new edition due — first-mover advantage.
3. **Vintages for tax receipts.** Real-time / as-of queries are the difference between a curiosity and a research-grade tool. `fred` already shows the pattern in the same author's stack.
4. **Microdata bridge for SPI.** A `hmrc_spi()` reader that handles the Public Use Tape format the way `taxstats` handles ATO sample files.
5. **Successor to `dwpstat`.** Stat-Xplore endpoints ported under `hmrc::stx_*` (or spun out as `dwp` package; preference for the latter to keep `hmrc` focused).

### 2.4 Out-of-scope (deliberate boundaries)

- `hmrc` is **not a microsim engine**. It does not run policy simulations. PolicyEngine UK and UKMOD do that.
- `hmrc` is **not a tax calculator**. Use `policyengine_uk` (Python) or build a `hmrc_calculate()` only if user demand is overwhelming.
- `hmrc` is **not a forecasting model**. Use `obr` for forecast tables; `nowcast` for nowcasting.

---

## 3. Phased roadmap

### Phase 1 — Architecture refresh (target: v0.4.0, 4 weeks)

Goal: bring `hmrc` to feature parity with `boe` and `fred` infrastructure.

**1.1 Prefix migration**
- Rename all `get_*` functions to `hmrc_*` (matches `boe_*`, `fred_*`, `nc_*`, `dk_*`, `ik_*`, `yc_*`, `ct_*`, `ci_*` ecosystem).
- Keep `get_*` aliases as deprecated stubs with `lifecycle::deprecate_warn()` for one minor cycle (remove in v0.5.0).
- `clear_cache()` → `hmrc_clear_cache()`.

**1.2 `hmrc_tbl` S3 class**
- Subclass of `data.frame` with attributes:
  - `source_url`: gov.uk publication page
  - `attachment_url`: actual ODS/CSV file URL
  - `fetched_at`: POSIXct of API call
  - `hmrc_publication`: human-readable publication name
  - `last_revised`: HMRC last-revision date (from quality report if available)
  - `cell_methods`: e.g., `"cash"`, `"accruals"`, `"ESA10"`
  - `vintage_date`: NA for latest, or as-of date
- `print.hmrc_tbl()` shows a 3-line provenance header before the data:
  ```
  # HMRC tax receipts — monthly bulletin
  # Source: gov.uk/.../hmrc-tax-and-nics-receipts (fetched 2026-04-25 14:32 UTC)
  # Vintage: latest | Cells: cash | 41 tax heads x 120 months
  ```
- `as_tibble.hmrc_tbl()` and `as.data.frame.hmrc_tbl()` strip provenance cleanly for downstream tidyverse use.

**1.3 `hmrc_search()`**
- `hmrc_search(query, dataset = NULL, fuzzy = TRUE)`.
- Searches a built-in catalogue table (`hmrc:::catalogue`) of all known datasets / tax heads / measures.
- Returns a tibble with `dataset`, `series`, `frequency`, `start`, `end`, `function`, `description`.
- Mirrors `boe_search()` / `fred_series_search()`.

**1.4 `hmrc_cache_info()`**
- Returns a tibble: `file`, `dataset`, `cached_at`, `size_bytes`, `age_days`, `path`.
- Mirrors `boe_cache_info()`.

**1.5 `hmrc_publications()`**
- Returns a tibble of all 42 HMRC publications mapped to package functions (or `NA` for not-yet-implemented).
- Updates with each release.

**Deliverables**
- 4 new exports (`hmrc_search`, `hmrc_cache_info`, `hmrc_publications`, `hmrc_clear_cache`).
- 12 renamed exports with deprecation aliases (24 total names; will collapse to 16 by v0.5.0).
- New S3 class + 3 method exports (`print`, `as_tibble`, `as.data.frame`).
- 30+ new tests covering S3 attributes, search, cache info.

### Phase 2 — Core data depth (target: v0.5.0, 6 weeks)

**2.1 `hmrc_paye_rti()`** — *highest priority new function*
- Endpoint: ONS bulletin `earningsandemploymentfrompayasyouearnrealtimeinformationuk`.
- Granularity: monthly, by NUTS 1/2/3 + local authority + age + industry + sex.
- Returns `hmrc_tbl` with `period`, `geography_code`, `geography_name`, `measure` (median pay / payrolled employees), `value`.
- Caching: each table is a separate Excel; cache by month + geography level.

**2.2 `hmrc_income_tax_liabilities()`**
- Distinct from existing `get_income_tax_stats()`.
- Forward-looking projections (Tables 2.5, 2.6 from Income Tax Liabilities Statistics bulletin, June release).
- Returns liabilities by income range, projected to current tax year.

**2.3 `hmrc_spi()`**
- Aggregated SPI tables 3.1-3.17 (income range, region, age, sex, source).
- Time series back to 1990s.

**2.4 `hmrc_capital_gains()`**
- Annual CGT statistics: taxpayer counts, gains, asset type, individual vs corporate.
- Tax year 1995-96 onwards where available.

**2.5 `hmrc_inheritance_tax()`**
- Liabilities (annual, July release) + receipts (from monthly bulletin).
- Optional crosswalk to Personal Wealth statistics.

**2.6 `hmrc_self_assessment()`**
- SA taxpayer counts, returns submitted, by age / sex / region.

**2.7 Extensions to existing functions**
- `hmrc_corporation_tax(detail = c("receipts", "liabilities", "sector", "size"))`.
- `hmrc_vat(detail = c("receipts", "trader_population", "by_sic"))`.
- `hmrc_rd_credits(detail = c("aggregate", "by_sector", "by_size", "by_region"))`.

**Deliverables**: 6 new exports, 3 extended exports, 50+ new tests, vignette section per dataset.

### Phase 3 — Reliefs and behavioural data (target: v0.6.0, 4 weeks)

**3.1 `hmrc_creative_industries()`**
- Film, HETV, animation, children's TV, video games, theatre, orchestra, museums and galleries.
- Annual, August release.
- Highest demand from policy users post 2024 reforms.

**3.2 `hmrc_eis_seis_vct()`**
- Combined Enterprise Investment Scheme / Seed EIS / Venture Capital Trusts.
- Annual, May release.
- Subscriptions, regional, industrial breakdown.

**3.3 `hmrc_patent_box()`**
- Annual, September release.
- Companies elected, total relief.

**3.4 `hmrc_pension_flexibility()`**
- Quarterly drawdown statistics (April / July / October / January).
- Withdrawal counts, values, tax overpayment refunds.

**3.5 `hmrc_savings_stats()`**
- Annual savings statistics (ISA, CTF, LISA, Help to Save consolidated since 2021).

**3.6 `hmrc_tax_reliefs_catalogue()`**
- 380 reliefs costed; 270 published non-structural reliefs.
- Twice-yearly updates (December / January).
- Returns tidy tibble with `relief_name`, `tax`, `cost_gbp_m`, `year`, `category`.

**Deliverables**: 6 new exports, 30+ new tests.

### Phase 4 — Vintages and real-time data (target: v0.7.0, 6 weeks)

This is the **single most important academic-credibility step**. Vintages turn the package from a convenience tool into a research-grade infrastructure.

**4.1 Snapshot indexing**
- Build `hmrc_vintages_available(dataset)` using:
  - Internet Archive Wayback Machine API (`https://archive.org/wayback/available`) for gov.uk pages — gov.uk has consistent snapshots since 2014.
  - HMRC's own publication archive where available (each republished bulletin keeps prior versions).
  - Index stored as package data (`data/vintages.rda`), updated quarterly via GitHub Action.

**4.2 `hmrc_as_of(dataset, date, ...)`**
- Returns data as it appeared on `date` (closest snapshot).
- Mirrors `fred_as_of()`.
- Returns `hmrc_tbl` with `vintage_date` attribute set.

**4.3 `hmrc_first_release(dataset)`**
- Returns the first published version of each observation.
- Used for nowcast backtesting (no look-ahead bias).
- Mirrors `fred_first_release()`.

**4.4 `hmrc_revisions(dataset, series)`**
- Returns a "revision triangle": rows = reference period, columns = vintage, values = receipts.
- Diagonal is first-release; bottom row is latest.
- Useful for studying revision behaviour of HMRC monthly receipts.

**4.5 Caching for vintages**
- Cache key includes vintage hash so vintage pulls do not collide with latest pulls.

**Deliverables**: 4 new exports, vignette "Reproducible fiscal analysis with vintages", 40+ new tests, GitHub Action for quarterly vintage-index refresh.

### Phase 5 — Treasury-grade extensions (target: v0.8.0, 4 weeks)

These functions could equally live in a sibling `greenbook` package. Bundling them in `hmrc` makes it a one-stop-shop for HMT analysts. Decision: **bundle initially**, spin out only if scope creep emerges.

**5.1 `hmrc_green_book_discount(years, scheme = c("standard", "health", "social"), base_year)`**
- HMT Green Book 2022 (and 2026 update) discount rates.
- Standard 3.5% to year 30, 3.0% years 31-75, 2.5% years 76-125, 2.0% years 126-200, 1.5% years 201-300.
- Health scheme uses 1.5%. Social time preference rate variants.
- Returns discount factors as tibble.

**5.2 `hmrc_optimism_bias(category, capital_or_opex = "capital")`**
- HMT optimism bias multipliers by project class.
- Standard, non-standard buildings, civil engineering, equipment, IT, outsourcing.

**5.3 `hmrc_real_terms(values, base_year, deflator = c("gdp", "cpi", "rpi"))`**
- Re-base nominal cash to real terms.
- Uses ONS deflators (pulled via `ons` package or static data).

**5.4 `hmrc_distributional_weights(income_decile)`**
- Green Book Annex A2 income elasticity of marginal utility = 1.3 default.
- Returns weights tibble.

**5.5 `hmrc_crosswalk(from, to)`**
- HMRC tax head ↔ ONS PSF classification ↔ OBR EFO line items ↔ ESA10.
- Built-in static crosswalk table; updated annually.
- Critical for HMRC-to-OBR / HMRC-to-ONS reconciliation.

**5.6 `hmrc_psf_bridge()`**
- Bridges HMRC cash receipts to ONS accruals-based public sector finances.
- Implements the bridge HMRC publishes in its monthly commentary.

**Deliverables**: 6 new exports, vignette "Treasury Green Book CBA in R", 40+ new tests.

### Phase 6 — Microdata bridge (target: v0.9.0, 4 weeks)

**6.1 `hmrc_spi_microdata(file, year)`**
- Parser for Public Use Tape SPI files (UKDS Secure Lab format).
- User must provide own access; package handles ingest.

**6.2 `hmrc_datalab_metadata()`**
- Returns a tibble describing what is available in HMRC Datalab without requiring access.
- Useful for researchers planning applications.

**6.3 `hmrc_uktradeinfo(endpoint, ...)`**
- Thin OData wrapper for `api.uktradeinfo.com/OTS` and `/RTS`.
- Recommend `pvdmeulen/uktrade` as primary; this is convenience for users who already have `hmrc` loaded.

**Deliverables**: 3 new exports, microdata vignette, ~20 new tests.

### Phase 7 — Documentation overhaul (target: v0.9.x, ongoing)

**7.1 Six research-grade vignettes**
1. `getting-started.Rmd` (existing, refresh)
2. `reproducible-fiscal-analysis.Rmd` — vintages, revision triangles
3. `hmrc-obr-ons-bridge.Rmd` — crosswalks, PSF reconciliation
4. `tax-incidence-spi.Rmd` — microdata workflow
5. `green-book-cba.Rmd` — discount, optimism bias, distributional weights
6. `paye-rti-labour-market.Rmd` — showcase the killer feature

**7.2 Cookbook**
- 20 worked end-to-end examples mirroring real Resolution Foundation / IFS / OBR briefings.
- Each example is a Quarto `.qmd` in `inst/cookbook/`.

**7.3 pkgdown upgrades**
- Reference categories: data fetchers, vintages, Green Book helpers, microdata, utilities.
- Articles section showcases vignettes.
- "Cited by" section listing papers / reports using the package.

**7.4 README rewrite**
- Add "Why hmrc?" comparison vs PolicyEngine, UKMOD, hand-scraping.
- Add citation block: BibTeX, RIS, CITATION.cff link.
- Add "Used by" section (start with macrowithR; aim for IFS, RF mentions within 12 months).

### Phase 8 — Academic credibility (target: v1.0.0, parallel to Phases 4-7)

**8.1 CITATION.cff** at repo root.

**8.2 inst/CITATION** in R format:
```r
citEntry(
  entry = "Manual",
  title = "hmrc: Download and Tidy HMRC Statistical Data",
  author = personList(person("Charles", "Coverdale")),
  year = 2026,
  note = "R package version 1.0.0",
  doi = "10.5281/zenodo.XXXXXX",
  url = "https://CRAN.R-project.org/package=hmrc"
)
```

**8.3 Zenodo DOI**
- Connect GitHub repo to Zenodo.
- Tag v1.0.0 on GitHub → automatic Zenodo deposit + DOI.
- Update CITATION with DOI.

**8.4 JOSS paper submission**
- 4-6 page paper at `paper/paper.md` with `paper.bib`.
- Sections:
  1. Summary (3 paragraphs)
  2. Statement of need (10DS, IFS, RF, OBR, academic gap; reference RAP strategy + RFS code policy)
  3. Functionality summary (3 tables: data fetchers, Green Book helpers, vintages)
  4. Comparison to PolicyEngine UK, UKMOD, taxstats/grattan, dwpstat
  5. Reproducibility and vintages
  6. Acknowledgements
- Submit to JOSS (Journal of Open Source Software) — typically 3-6 month review.

**8.5 R Journal article** (separate, longer)
- Use the user's existing `r-article` skill.
- Full pedagogical paper with worked Resolution Foundation-style example.
- Submit to *The R Journal* — 6-12 month review.

**8.6 Outreach**
- Tangentially Economics blog post (use existing `blog` skill).
- Direct emails to: IFS R-friendly contacts, RF data team, OBR economists, 10DS PolicyEngine team, HMT GAD R community.
- Use existing `outreach-emails` skill: `/outreach-emails hmrc`.
- Conference talks: UK government R Day 2027, Royal Statistical Society economics section, Society for Economic Measurement.

---

## 4. Function inventory: target end-state

### v1.0.0 target: ~32 exports

**Existing (renamed)** — 11
- `hmrc_tax_receipts`, `hmrc_vat`, `hmrc_fuel_duties`, `hmrc_tobacco_duties`, `hmrc_corporation_tax`, `hmrc_stamp_duty`, `hmrc_property_transactions`, `hmrc_income_tax_stats`, `hmrc_rd_credits`, `hmrc_tax_gap`, `hmrc_list_tax_heads`

**Phase 1 — Architecture** — 4
- `hmrc_search`, `hmrc_cache_info`, `hmrc_publications`, `hmrc_clear_cache`

**Phase 2 — Core depth** — 6
- `hmrc_paye_rti`, `hmrc_income_tax_liabilities`, `hmrc_spi`, `hmrc_capital_gains`, `hmrc_inheritance_tax`, `hmrc_self_assessment`

**Phase 3 — Reliefs** — 6
- `hmrc_creative_industries`, `hmrc_eis_seis_vct`, `hmrc_patent_box`, `hmrc_pension_flexibility`, `hmrc_savings_stats`, `hmrc_tax_reliefs_catalogue`

**Phase 4 — Vintages** — 4
- `hmrc_as_of`, `hmrc_first_release`, `hmrc_revisions`, `hmrc_vintages_available`

**Phase 5 — Treasury** — 6
- `hmrc_green_book_discount`, `hmrc_optimism_bias`, `hmrc_real_terms`, `hmrc_distributional_weights`, `hmrc_crosswalk`, `hmrc_psf_bridge`

**Phase 6 — Microdata** — 3
- `hmrc_spi_microdata`, `hmrc_datalab_metadata`, `hmrc_uktradeinfo`

**S3 methods (re-exported)** — 3
- `print.hmrc_tbl`, `as_tibble.hmrc_tbl`, `as.data.frame.hmrc_tbl`

**Total**: 43 names; ~32 unique exports after deprecation cycle removes `get_*` aliases.

---

## 5. Code architecture changes

### 5.1 New internal module structure (`R/`)

```
R/
  hmrc-tbl.R              # S3 class, print, as_tibble, as.data.frame
  utils-govuk-api.R       # existing, unchanged
  utils-dates.R           # existing, unchanged
  utils-cache.R           # NEW — cache_info, key generation
  utils-vintage.R         # NEW — wayback / archive helpers
  catalogue.R             # NEW — built-in dataset catalogue + search
  hmrc_tax_receipts.R     # renamed
  ...
  hmrc_paye_rti.R         # NEW
  hmrc_capital_gains.R    # NEW
  ...
  green-book.R            # NEW — discount, optimism, deflators, weights
  crosswalk.R             # NEW — HMRC ↔ ONS ↔ OBR
  zzz.R                   # .onLoad hooks for option defaults
```

### 5.2 Provenance attachment helper

```r
# R/hmrc-tbl.R
new_hmrc_tbl <- function(x, source_url, attachment_url, hmrc_publication,
                         cell_methods = "cash", vintage_date = NA) {
  stopifnot(is.data.frame(x))
  attr(x, "hmrc_meta") <- list(
    source_url = source_url,
    attachment_url = attachment_url,
    fetched_at = Sys.time(),
    hmrc_publication = hmrc_publication,
    cell_methods = cell_methods,
    vintage_date = vintage_date,
    package_version = utils::packageVersion("hmrc")
  )
  class(x) <- c("hmrc_tbl", class(x))
  x
}

print.hmrc_tbl <- function(x, ...) {
  m <- attr(x, "hmrc_meta")
  cli::cli_rule(left = m$hmrc_publication)
  cli::cli_text("{.url {m$source_url}}")
  cli::cli_text("Fetched {format(m$fetched_at)} | Vintage: {m$vintage_date %||% 'latest'} | Cells: {m$cell_methods}")
  cli::cli_rule()
  NextMethod()
}
```

### 5.3 Catalogue table

```r
# data-raw/catalogue.R produces data/catalogue.rda
catalogue <- tibble::tribble(
  ~dataset,                    ~function_name,            ~frequency, ~start,    ~publisher,
  "tax_receipts_monthly",      "hmrc_tax_receipts",       "monthly",  "2008-04", "HMRC",
  "vat_monthly",               "hmrc_vat",                "monthly",  "1973-04", "HMRC",
  "paye_rti_regional_pay",     "hmrc_paye_rti",           "monthly",  "2014-07", "ONS/HMRC",
  ...
)
```

### 5.4 Vintage support

```r
hmrc_as_of <- function(dataset, date, ...) {
  date <- as.Date(date)
  snap <- find_wayback_snapshot(catalogue_url(dataset), date)
  if (is.null(snap)) cli::cli_abort("No snapshot found near {date}")
  raw <- download_cached(snap$url, vintage_key = snap$timestamp)
  out <- parse_dataset(raw, dataset)
  attr(out, "hmrc_meta")$vintage_date <- date
  out
}
```

### 5.5 Backwards compatibility

Each renamed function ships a deprecation alias in `R/deprec.R`:

```r
get_tax_receipts <- function(...) {
  lifecycle::deprecate_warn("0.4.0", "get_tax_receipts()", "hmrc_tax_receipts()")
  hmrc_tax_receipts(...)
}
```

Removed in v0.5.0 with a `lifecycle::deprecate_stop()` cycle.

---

## 6. Documentation strategy

### 6.1 Vignette portfolio (final)

| Vignette | Length | Audience |
|----------|--------|----------|
| Getting started | short | first-time users |
| Reproducible fiscal analysis with vintages | long | academic econometricians |
| HMRC ↔ OBR ↔ ONS bridge | medium | HMT / OBR analysts |
| Tax incidence with SPI | medium | IFS / RF distributional analysts |
| Green Book CBA in R | medium | HMT / consultancy CBA practitioners |
| PAYE RTI labour-market toolkit | medium | labour economists |

### 6.2 README structure

1. Logo / badges (CRAN, downloads, R-CMD-check, codecov, JOSS, DOI)
2. Why `hmrc`?
3. Installation
4. Quick start (3 examples)
5. Function index (linked to pkgdown)
6. Comparison: hmrc vs PolicyEngine UK vs UKMOD vs hand-scraping
7. Citation (BibTeX + DOI)
8. Used by (Resolution Foundation reports, IFS papers, OBR briefings — populate as adoption grows)
9. Related packages (`obr`, `ons`, `boe`, `inflateR`, `nowcast`, `debtkit`)
10. Contributing
11. Code of conduct

### 6.3 Cookbook (`inst/cookbook/`)

20 Quarto recipes. Examples:
- "Replicate the Resolution Foundation Living Standards Outlook receipts chart"
- "Reproduce IFS Green Budget Chapter 2 figures"
- "Build an OBR-style fan chart for Income Tax receipts"
- "Distributional incidence of a 1p increase in basic-rate IT"
- "Stamp Duty receipts vs property transactions: lead-lag"
- "Tax gap by behaviour over time"
- "Creative Industries reliefs vs UK film GVA"

---

## 7. Adoption strategy

### 7.1 Direct outreach

Prioritised contact list (use existing `outreach-emails` skill):
1. **IFS**: Stuart Adam, Helen Miller, Robert Joyce — R/Stata mix; RAP-curious.
2. **Resolution Foundation**: Adam Corlett, Lalitha Try — R-using.
3. **OBR**: macroeconomic forecasting team — uses R.
4. **HMT GAD**: Government Analysis Function R community.
5. **10DS PolicyEngine team**: Max Ghenis, Nikhil Woodruff — Python-first but value upstream R wrappers.
6. **Bank of England**: economist research community (via `boe` package overlap).
7. **ONS Data Science Campus**.
8. **Academic**: Stuart Land, Arun Advani (CGT specialism), Helen Simpson (productivity).

Email format: 3 paragraphs, name a specific paper / chart their team published, show how `hmrc` would have shortened it, ask for one piece of feedback.

### 7.2 Showcase artefacts

- **Quarto template**: `quarto-uk-fiscal-briefing` GitHub repo. One-command Quarto template with `hmrc + ons + obr + inflateR + boe` pre-wired. Publish to https://github.com/charlescoverdale/quarto-uk-fiscal-briefing.
- **Live dashboard**: Shiny app at `hmrc-dashboard.charlescoverdale.com` showing latest receipts, refreshed daily via GitHub Action — proves currency.
- **macrowithR Chapter 11**: already on user's roadmap; expand to feature `hmrc` heavily.

### 7.3 Discoverability

- Cross-reference from `obr`, `ons`, `boe`, `inflateR` README "Related packages" sections.
- File rOpenSci review submission once v1.0.0 ships (peer review + rOpenSci badge).
- CRAN Task View submission: `Econometrics`, `OfficialStatistics`.

### 7.4 Scheduled tasks (use `schedule` skill)

- Weekly: scrape catalogue HTML to detect new HMRC publications.
- Monthly: refresh vintage index from Wayback.
- Per-release: trigger Zenodo deposit and JOSS paper update.

---

## 8. Risk register

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| HMRC restructures gov.uk publication URLs | Medium | High | Already mitigated by Content API resolution; add monitoring action. |
| Data revisions invalidate cached results | High | Medium | Vintage support (Phase 4) makes revisions a feature not a bug. |
| Scope creep into microsim | Medium | High | Hard boundary documented (§2.4). PolicyEngine UK does microsim; we wrap data. |
| Maintenance burden grows with 32 exports | High | Medium | Automated URL-health GitHub Action; quarterly catalogue refresh; modular per-dataset tests. |
| JOSS reviewers reject for insufficient novelty | Medium | Medium | Frame as "research infrastructure" not "novel methodology"; cite RAP strategy and RFS code policy. |
| Wayback snapshots are sparse for some datasets | Medium | Low | Document coverage in `hmrc_vintages_available`; fall back to gov.uk's own attachment versioning where present. |
| User base too small to dethrone hand-scraping | Medium | High | Treasury RAP strategy is a tailwind; success of `boe`/`ons`/`obr` shows path. |
| HMRC API Developer Hub rate limits if we add operational endpoints | Low | Low | Phase 6 explicitly excludes operational APIs. |

---

## 9. Success metrics

### 3-month milestones (target: 2026-07-25)

- v0.4.0 on CRAN with S3 class, search, cache info, prefix migration.
- 16 exports, 200+ tests, 0/0/0 R CMD check.
- CITATION.cff and inst/CITATION shipped.
- Zenodo DOI assigned.
- macrowithR Chapter 11 references the package extensively.

### 6-month milestones (target: 2026-10-25)

- v0.7.0 on CRAN with PAYE RTI, ITL, SPI, CGT, IHT + first vintage functions.
- 25+ exports, 350+ tests.
- 6 vignettes published.
- JOSS paper submitted.
- 2 mentions / uses by IFS or Resolution Foundation analysts (track via Twitter/Bluesky and GitHub stars).
- CRAN downloads >1,500/month.

### 12-month milestones (target: 2027-04-25)

- v1.0.0 on CRAN. 32 exports, 500+ tests.
- JOSS paper published.
- R Journal paper draft / under review.
- Cited in at least one IFS or Resolution Foundation report.
- Used by 10DS PolicyEngine team for upstream data ingestion (track via direct contact).
- CRAN downloads >3,000/month.
- rOpenSci badge.
- Listed in Econometrics CRAN Task View.

---

## 10. Sources and references

### HMRC publication catalogue
- HMRC monthly tax receipts: https://www.gov.uk/government/statistics/hmrc-tax-and-nics-receipts-for-the-uk
- Personal Incomes Statistics: https://www.gov.uk/government/collections/personal-incomes-statistics
- Income Tax liabilities: https://www.gov.uk/government/collections/income-tax-statistics-and-distributions
- Corporation Tax statistics: https://www.gov.uk/government/organisations/hm-revenue-customs/series/analyses-of-corporation-tax-receipts-and-liabilities
- Measuring Tax Gaps: https://www.gov.uk/government/statistics/measuring-tax-gaps
- VAT annual statistics: https://www.gov.uk/government/statistics/value-added-tax-vat-annual-statistics
- PAYE RTI (ONS bulletin): https://www.ons.gov.uk/employmentandlabourmarket/peopleinwork/earningsandworkinghours/bulletins/earningsandemploymentfrompayasyouearnrealtimeinformationuk/latest
- Stamp Tax annual: https://www.gov.uk/government/statistics/uk-stamp-tax-statistics
- Inheritance Tax liabilities: https://www.gov.uk/government/statistics/inheritance-tax-liabilities-statistics
- Capital Gains Tax: https://www.gov.uk/government/organisations/hm-revenue-customs/series/capital-gains-tax-statistics
- R&D credits: https://www.gov.uk/government/statistics/corporate-tax-research-and-development-tax-credit
- Creative Industries: https://www.gov.uk/government/collections/creative-industries-statistics
- EIS/SEIS/VCT: https://www.gov.uk/government/statistics/enterprise-investment-scheme-seed-enterprise-investment-scheme-and-social-investment-tax-relief-may-2025
- Patent Box: https://www.gov.uk/government/statistics/patent-box-reliefs-statistics
- Tax relief statistics: https://www.gov.uk/government/collections/tax-relief-statistics
- HMRC Datalab: https://www.gov.uk/government/publications/hmrc-datalab/about-the-hmrc-datalab
- HMRC Developer Hub: https://developer.service.hmrc.gov.uk/api-documentation
- uktradeinfo OData: https://www.uktradeinfo.com/
- Whole of Government Accounts: https://www.gov.uk/government/collections/whole-of-government-accounts
- Country and regional public sector finances: https://www.ons.gov.uk/economy/governmentpublicsectorandtaxes/publicsectorfinance/datasets/countryandregionalpublicsectorfinancesrevenuetables

### Competing / complementary tools
- PolicyEngine UK: https://www.policyengine.org/uk and https://github.com/PolicyEngine/policyengine-uk
- PolicyEngine at 10DS: https://www.policyengine.org/ca/research/policyengine-10-downing-street
- HMT algorithmic transparency record (PolicyEngine): https://www.gov.uk/algorithmic-transparency-records/hmt-modelling-policy-engine
- UKMOD (Essex CeMPA): https://www.microsimulation.ac.uk/euromod/models/ukmod/
- UKMOD R via Python (Oct 2025): https://www.microsimulation.ac.uk/wp-content/uploads/2025/10/UKMODfest_Oct_2025_python_connector.pdf
- IFS TAXBEN: https://ifs.org.uk/publications/taxben-ifs-static-tax-and-benefit-microsimulation-model
- taxstats (Parsonage): https://github.com/HughParsonage/taxstats
- grattan: https://github.com/HughParsonage/grattan
- nomisr (rOpenSci): https://github.com/ropensci/nomisr
- dwpstat (Odell, dormant): https://github.com/evanodell/dwpstat
- pvdmeulen/uktrade: https://github.com/pvdmeulen/uktrade

### Government strategy
- Government Analysis Function RAP strategy 2022-2026: https://analysisfunction.civilservice.gov.uk/support/reproducible-analytical-pipelines/
- HMT Green Book 2026 discount review: https://www.gov.uk/government/publications/green-book-discount-rate-review-2026/review-of-discounting-in-the-green-book-terms-of-reference
- HMRC quality reports: https://www.gov.uk/government/collections/hmrc-quality-reports-statistics
- HMRC revisions policy: https://www.gov.uk/government/publications/hmrc-statement-on-revisions
- Schedule of HMRC statistics 2025-26: https://www.gov.uk/government/statistics/schedule-of-updates-and-announcements-for-hmrcs-statistics

### Sibling Coverdale packages (architecture reference)
- `boe` v0.1.2 — provenance S3, search, cache info, vintage support
- `fred` v0.2.0 — `fred_as_of`, `fred_first_release`, real-time vintage
- `ons` v0.1.3 — sibling on PSF outturn
- `obr` v0.2.5 — sibling on forecasts and PSF databank
- `inflateR` v0.1.3 — deflators (used in Phase 5)

---

## Appendix A. Decision points for review

1. **Spin out `greenbook` package?** Bundling Green Book helpers in `hmrc` keeps Treasury workflow in one package. Spinning out keeps `hmrc` data-pure. **Recommendation: bundle for v1.0.0; revisit if scope grows beyond ~10 helper functions.**

2. **Adopt or compete with `dwpstat`?** Stat-Xplore is DWP not HMRC. **Recommendation: do not bundle. Spin out a sibling `dwp` package once `hmrc` v1.0.0 ships.**

3. **`hmrc_uktradeinfo()` or defer to `pvdmeulen/uktrade`?** Customs is HMRC's remit. **Recommendation: thin wrapper for convenience only; cross-reference `pvdmeulen/uktrade` as primary.**

4. **Tax calculator?** A `hmrc_calculate_income_tax(income, year)` could mirror `grattan::income_tax`. **Recommendation: defer to v1.1.0; user demand evidence first. Do not duplicate PolicyEngine UK.**

5. **Microdata access policy.** Should the package read directly from UKDS Secure Lab? **Recommendation: no. Provide ingest helpers; users handle access.**

6. **JOSS or R Journal first?** JOSS turns around in 3-6 months and is suitable for research infrastructure. R Journal is more pedagogical and longer. **Recommendation: JOSS first (v1.0.0), R Journal second (v1.1.0).**

---

*End of plan. ~5,400 words. Reviewed against full HMRC catalogue, sibling Coverdale packages, and 2026 UK fiscal-tooling competitive map.*
