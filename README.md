# Loan Default Risk Analysis Dashboard

[![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Pandas](https://img.shields.io/badge/Pandas-Data%20Wrangling-150458?style=for-the-badge&logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![MySQL](https://img.shields.io/badge/MySQL-Analytics-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![Status](https://img.shields.io/badge/Status-Analysis%20Complete-brightgreen?style=for-the-badge)](https://github.com/nafishaparveen2104/Loan-Default-Risk-Analysis-Dashboard)
[![Dataset](https://img.shields.io/badge/Dataset-9%2C578%20Loans-0A66C2?style=for-the-badge)](https://www.kaggle.com/datasets/itssuru/loan-data)

**End-to-end credit-risk analytics on 9,578 historical LendingClub loans — from raw CSV cleaning in Python, through MySQL analysis, to an interactive Power BI dashboard and stakeholder report.**

[Dashboard Preview](#dashboard-preview) · [Dataset](#dataset) · [Key Findings](#key-findings) · [Reproduce](#reproducing-this-project) · [Report](./Loan_Default_Risk_Report.pdf)


**Repository:** [github.com/nafishaparveen2104/Loan-Default-Risk-Analysis-Dashboard](https://github.com/nafishaparveen2104/Loan-Default-Risk-Analysis-Dashboard)
---

## Table of Contents

- [Project Overview](#project-overview)
- [Portfolio at a Glance](#portfolio-at-a-glance)
- [Dashboard Preview](#dashboard-preview)
- [Dataset](#dataset)
- [Tech Stack](#tech-stack)
- [Architecture and Data Flow](#architecture-and-data-flow)
- [Project Structure](#project-structure)
- [Data Cleaning Pipeline](#data-cleaning-pipeline)
- [Dashboard Features](#dashboard-features)
- [Key Findings](#key-findings)
- [Recommendations](#recommendations)
- [Reproducing This Project](#reproducing-this-project)
- [Dependencies](#dependencies)
- [Validation and Engineering Status](#validation-and-engineering-status)
- [Limitations and Responsible Use](#limitations-and-responsible-use)
- [Skills Demonstrated](#skills-demonstrated)
- [Future Enhancements](#future-enhancements)
- [Troubleshooting](#troubleshooting)
- [Author](#author)
- [License](#license)
- [Acknowledgments](#acknowledgments)

---

## Project Overview

This project analyzes publicly available LendingClub loan records (2007–2010) to identify borrower and loan segments with elevated non-payment risk. A 14-column raw dataset is profiled and cleaned in Python, loaded into MySQL for structured SQL analytics, and modeled in Power BI with DAX measures, calculated risk bands, slicers, and an interactive single-page dashboard.

The deliverable set also includes an editable Word report and a five-page PDF summary for stakeholders who need a portable narrative alongside the live dashboard.

> **Analysis scope:** This is a **descriptive business-intelligence** project. The outcome field is `not_fully_paid = 1` (loan not fully paid). The repository does **not** train or deploy a predictive credit-scoring model.

### Why This Project Exists

| Challenge | Approach |
| --- | --- |
| Credit risk is uneven across borrower segments | Compare default rates by purpose, FICO, DTI, utilization, policy status, and inquiries |
| Raw field names are awkward for SQL and BI tools | Normalize dotted names to `snake_case` |
| Extreme observations can distort portfolio summaries | Flag 439 extreme outliers without deleting valid records |
| Static tables make segment comparison slow | Interactive KPI cards, slicers, cross-filtering, and charts |
| Dashboard logic can drift across visuals | Centralize portfolio math in reusable DAX measures and calculated bands |
| Results need a shareable narrative | Include DOCX + PDF reports next to the PBIX file |

### Questions Answered

- What is the portfolio’s overall non-payment rate?
- Which loan purposes show the highest observed default rates?
- How does risk change across FICO, DTI, and revolving-utilization bands?
- How do policy-compliant loans compare with policy exceptions?
- Do recent credit inquiries provide a useful early risk signal?
- Which records are extreme outliers, and how do they compare with the rest of the book?

---

## Portfolio at a Glance

| Metric | Result |
| --- | ---: |
| Total loan records | **9,578** |
| Not fully paid | **1,533** |
| Overall default rate | **16.01%** |
| Average FICO score | **710.85** |
| Average interest rate | **12.26%** |
| Credit-policy compliant | **7,710 (80.50%)** |
| Credit-policy exception | **1,868 (19.50%)** |
| Extreme outliers flagged | **439 (4.58%)** |

---

## Dashboard Preview

Interactive Power BI page with four KPIs, four slicers, and six analytical visuals. Open [`Loan_data_analysis_dashboard.pbix`](./Loan_data_analysis_dashboard.pbix) in Power BI Desktop for full cross-filtering and tooltips.

### Portfolio Overview

<img src="https://i.ibb.co/cdyLtnM/Screenshot-2026-07-09-123720.png" width="700" alt="Loan Default Risk Dashboard — portfolio KPIs, slicers, and risk-segment charts">

*Single-page portfolio view: Total Loans, Default Rate, Avg FICO, Avg Interest Rate, plus purpose, FICO, DTI, utilization, policy, and inquiry visuals.*

> **Note:** The KPI card may display **10K** for total loans because compact display units are enabled. The semantic model and source files contain exactly **9,578** rows.

### Default Rate by Loan Purpose

<img src="https://i.ibb.co/Mk654Rwz/Screenshot-2026-07-09-132503.png" width="700" alt="Default rate by loan purpose">

*Small-business and educational loans show the highest observed non-payment rates.*

### Default Rate by FICO Band

<img src="https://i.ibb.co/rRs2x0KQ/Screenshot-2026-07-09-132637.png" width="700" alt="Default rate by FICO score band">

*Lower-FICO borrowers have substantially higher historical default rates.*

### Default Rate by Debt-to-Income Band

<img src="https://i.ibb.co/4gWxyygN/Screenshot-2026-07-09-132727.png" width="700" alt="Default rate by debt-to-income band">

*Default rates increase as borrower debt burden rises.*

### Default Rate by Revolving Utilization

<img src="https://i.ibb.co/fYdnB4BP/Screenshot-2026-07-09-133019.png" width="700" alt="Default rate by revolving credit utilization band">

*Higher revolving utilization is associated with higher non-payment risk.*

### Loan Distribution by Credit Policy

<img src="https://i.ibb.co/L2Q6p4W/Screenshot-2026-07-09-133157.png" width="700" alt="Loan distribution by credit-policy status">

*80.5% of records meet the original LendingClub credit-policy criteria.*

### Default Rate by Recent Credit Inquiries

<img src="https://i.ibb.co/hxgZSv5g/Screenshot-2026-07-09-133658.png" width="700" alt="Default rate by recent credit inquiries in the previous six months">

*Inquiry-level risk trend; extreme counts should be interpreted cautiously because sample sizes are small.*

---

## Dataset

| Attribute | Detail |
| --- | --- |
| Raw file | [`loan_data.csv`](./loan_data.csv) |
| Cleaned file | [`loan_data_cleaned.csv`](./loan_data_cleaned.csv) |
| Records | 9,578 loans |
| Raw dimensions | 14 columns |
| Cleaned dimensions | 15 columns (`is_outlier` added) |
| Power BI model | 15 imported columns + 5 calculated columns |
| Time period | 2007–2010 |
| Source | [Loan Data on Kaggle](https://www.kaggle.com/datasets/itssuru/loan-data) |
| Origin | Public LendingClub lending data |

### Cleaned Schema

| # | Column | Type | Description |
| ---: | --- | --- | --- |
| 1 | `credit_policy` | Integer (binary) | `1` if borrower meets LendingClub credit-underwriting criteria; else `0` |
| 2 | `purpose` | Category | Loan purpose: all other, credit card, debt consolidation, educational, home improvement, major purchase, small business |
| 3 | `int_rate` | Float | Interest rate as a proportion (`0.1189` = 11.89%) |
| 4 | `installment` | Float | Monthly installment owed by the borrower |
| 5 | `log_annual_inc` | Float | Natural log of self-reported annual income |
| 6 | `dti` | Float | Debt-to-income ratio |
| 7 | `fico` | Integer | FICO credit score |
| 8 | `days_with_cr_line` | Float | Days the borrower has maintained a credit line |
| 9 | `revol_bal` | Integer | Revolving balance at end of billing cycle |
| 10 | `revol_util` | Float | Revolving-line utilization (% of available credit used) |
| 11 | `inq_last_6mths` | Integer | Creditor inquiries in the previous six months |
| 12 | `delinq_2yrs` | Integer | 30+ day late payments in the previous two years |
| 13 | `pub_rec` | Integer | Derogatory public records (bankruptcies, tax liens, judgments) |
| 14 | `not_fully_paid` | Integer (binary) | `1` if loan was not fully paid (analysis outcome) |
| 15 | `is_outlier` | Integer (binary) | `1` if a selected field exceeds the notebook’s 3×IQR extreme-outlier boundary |

### Power BI Calculated Columns

| Column | Definition | Role |
| --- | --- | --- |
| `fico_band` | Low `<680`; Medium `680–749`; High `≥750` | Slicer + default-rate chart |
| `dti_band` | Low `<10`; Medium `10–<20`; High `≥20` | Slicer + default-rate chart |
| `interest_rate_band` | 5%–10%, 10%–15%, 15%–20%, 20%–25% | Extended analysis |
| `revol_util_band` | Low `<30`; Medium `30–<60`; High `≥60` | Default-rate chart |
| `fico_band_2` | Below 650, 650–699, 700–749, 750–799, 800+ | Granular FICO analysis |

### Data Quality Checks

| Check | Result |
| --- | --- |
| Duplicate rows | **0** |
| Missing values | **0** (all source and cleaned fields) |
| FICO range | **612–827** |
| Negative values | **None** in interest rate, installment, FICO, DTI, revolving balance |
| Loan purposes | **7** consistent categories |
| Row count stability | **9,578** source → **9,578** cleaned |
| Outlier handling | **439** extreme records flagged; **none deleted** |

---

## Tech Stack

| Area | Technology | Purpose |
| --- | --- | --- |
| Data processing | Python, Pandas, NumPy | Profiling, validation, column normalization, outlier flagging |
| Notebook | Google Colab / Jupyter | Interactive, documented cleaning workflow |
| Database | MySQL | Cleaned-table storage and analytical SQL |
| Ingestion | Power Query (M) | Import MySQL table into Power BI |
| Semantic model | DAX | KPIs, risk bands, validation measures |
| Visualization | Power BI Desktop | Dashboard, slicers, tooltips, cross-filter |
| Reporting | Microsoft Word + PDF | Editable and portable findings |
| Version control | Git / GitHub | Source history and portfolio hosting |

---

### Power BI Source Configuration

| Setting | Value |
| --- | --- |
| Connector | `MySQL.Database` |
| Host | `localhost:3306` |
| Database | `loan_analysis` |
| Table | `loan_data` |
| Storage mode | Import |
| Parameters / env vars | None |
| Credentials in repo | None |

The PBIX ships with an **imported data snapshot**. It opens without MySQL; refreshing requires a local MySQL instance and valid credentials.

---

## Project Structure

```text
Loan-Default-Risk-Analysis-Dashboard/
├── Loan_Data.ipynb                      # Profiling & cleaning notebook
├── loan_data.csv                        # Original 9,578 × 14 dataset
├── loan_data_cleaned.csv                # Cleaned 9,578 × 15 (+ is_outlier)
├── Database-Loan_data.sql               # MySQL schema + analytical queries
├── Loan_data_analysis_dashboard.pbix    # Power BI dashboard & semantic model
├── Loan_Default_Risk_Report.pdf         # Five-page portable report
├── Loan_Default_Risk_Report.docx        # Editable report source
└── README.md                            # Project documentation
```

| File | Description |
| --- | --- |
| [`Loan_Data.ipynb`](./Loan_Data.ipynb) | Full profiling and cleaning workflow |
| [`loan_data.csv`](./loan_data.csv) | Raw source with dotted column names |
| [`loan_data_cleaned.csv`](./loan_data_cleaned.csv) | SQL-friendly names + `is_outlier` |
| [`Database-Loan_data.sql`](./Database-Loan_data.sql) | Schema + portfolio, purpose, FICO, DTI, inquiry queries |
| [`Loan_data_analysis_dashboard.pbix`](./Loan_data_analysis_dashboard.pbix) | Interactive dashboard |
| [`Loan_Default_Risk_Report.pdf`](./Loan_Default_Risk_Report.pdf) | Stakeholder PDF |
| [`Loan_Default_Risk_Report.docx`](./Loan_Default_Risk_Report.docx) | Editable report |

---

## Data Cleaning Pipeline

Documented end-to-end in [`Loan_Data.ipynb`](./Loan_Data.ipynb). All source records are retained.

### 1. Load and inspect

```python
import pandas as pd

df = pd.read_csv("loan_data.csv")

print("Shape:", df.shape)
print("Columns:", df.columns.tolist())
print(df.dtypes)
print(df.head())
```

**Expected:** 9,578 rows × 14 columns.

### 2. Missing values and duplicates

```python
print("Missing values:\n", df.isnull().sum())
print("Duplicate rows:", df.duplicated().sum())
print(df.describe())
```

**Expected:** zero missing values, zero duplicate rows.

### 3. Normalize column names

```python
df.columns = df.columns.str.replace(".", "_", regex=False)
df["purpose"] = df["purpose"].astype("category")

print(df.columns.tolist())
```

Dotted names such as `credit.policy` and `not.fully.paid` become `credit_policy` and `not_fully_paid` for SQL, DAX, and Python.

### 4. Validate numeric ranges

```python
for column in ["int_rate", "installment", "fico", "dti", "revol_bal"]:
    print(f"{column}: {(df[column] < 0).sum()} negative values")

print("FICO range:", df["fico"].min(), "-", df["fico"].max())
```

**Expected:** no negatives; FICO 612–827.

### 5. Profile potential outliers (1.5×IQR)

```python
numeric_columns = [
    "int_rate", "installment", "log_annual_inc", "dti",
    "fico", "days_with_cr_line", "revol_bal", "revol_util",
]

for column in numeric_columns:
    q1, q3 = df[column].quantile(0.25), df[column].quantile(0.75)
    iqr = q3 - q1
    lower, upper = q1 - 1.5 * iqr, q3 + 1.5 * iqr
    count = ((df[column] < lower) | (df[column] > upper)).sum()
    print(f"{column}: {count} potential outliers")
```

### 6. Flag extreme outliers (3×IQR)

```python
df["is_outlier"] = 0

for column in ["revol_bal", "days_with_cr_line", "dti"]:
    q1, q3 = df[column].quantile(0.25), df[column].quantile(0.75)
    iqr = q3 - q1
    lower, upper = q1 - 3 * iqr, q3 + 3 * iqr
    mask = (df[column] < lower) | (df[column] > upper)
    df.loc[mask, "is_outlier"] = 1

print("Extreme outliers flagged:", df["is_outlier"].sum())
```

**Expected:** 439 records flagged; all rows kept.

### 7. Export cleaned data

```python
print("Final shape:", df.shape)
print("Remaining nulls:", df.isnull().sum().sum())

df.to_csv("loan_data_cleaned.csv", index=False)
```

**Expected:** `loan_data_cleaned.csv` — 9,578 × 15.

---

## Dashboard Features

File: [`Loan_data_analysis_dashboard.pbix`](./Loan_data_analysis_dashboard.pbix)

| Component | Content | Implementation |
| --- | --- | --- |
| KPI cards | Total loans, default rate, avg FICO, avg interest rate | DAX measures |
| Purpose analysis | Default rate across 7 purposes | Clustered bar |
| FICO analysis | Default rate by Low / Medium / High | Calculated column + bar |
| DTI analysis | Default rate by Low / Medium / High | Calculated column + bar |
| Utilization | Default rate by revolving-util band | Calculated column + bar |
| Credit-policy mix | Compliant vs exception volume | Donut |
| Inquiry analysis | Default rate by inquiries (last 6 months) | Line chart |
| Slicers | Purpose, FICO band, DTI band, credit policy | Interactive filters |

### Interactive capabilities

- **Cross-filtering** across visuals and slicers
- **Tooltips** for detailed point inspection
- **Reusable DAX** so KPIs and charts share one definition of risk
- **Imported snapshot** usable offline without MySQL

### DAX measures

| Measure | Logic | Use |
| --- | --- | --- |
| `Total Loans` | Count model rows | KPI, policy donut |
| `Total Defaults` | Sum of `not_fully_paid` | Model |
| `Default Rate %` | Defaults / loans (zero-safe) | KPI + risk charts |
| `Avg FICO Score` | Average FICO | KPI |
| `Avg Interest Rate %` | Mean `int_rate` × 100 | KPI |
| `Avg Installment` | Mean monthly installment | Model |
| `Avg DTI` | Mean debt-to-income | Model |
| `Avg Log Income` | Mean `log_annual_inc` | Model |
| `Check Values` | Distinct count of binary outcome | Validation |
| `Total Rows Check` | Count model rows | Validation |

> The model also contains `Avg Annual Income`, which currently averages `log_annual_inc`. Treat it as a log-scale field — not currency — until it is exponentiated or renamed.

---

## Key Findings

### Loan-purpose comparison

| Loan purpose | Loans | Not fully paid | Default rate | Interpretation |
| --- | ---: | ---: | ---: | --- |
| Small business | 619 | 172 | **27.79%** | Highest purpose-level risk |
| Educational | 343 | 69 | **20.12%** | Above portfolio average |
| Home improvement | 629 | 107 | **17.01%** | Moderately elevated |
| All other | 2,331 | 387 | **16.60%** | Near average |
| Debt consolidation | 3,957 | 603 | **15.24%** | Largest volume segment |
| Credit card | 1,262 | 146 | **11.57%** | Below average |
| Major purchase | 437 | 49 | **11.21%** | Lowest purpose-level risk |

### Risk-band comparison

| Dimension | Low | Medium | High | Finding |
| --- | ---: | ---: | ---: | --- |
| FICO | 23.62% (`<680`) | 15.63% (`680–749`) | 7.43% (`≥750`) | Largest separation among three-band views |
| DTI | 14.83% (`<10`) | 16.10% (`10–<20`) | 18.33% (`≥20`) | Risk rises with debt burden |
| Revolving util | 12.43% (`<30`) | 16.33% (`30–<60`) | 18.97% (`≥60`) | Higher utilization → higher risk |

### Additional portfolio insights

| Metric | Finding | Implication |
| --- | --- | --- |
| Credit policy | Exceptions default at **27.78%** vs **13.15%** for compliant loans | Monitor exceptions separately; review approval criteria |
| Outlier flag | Flagged records default at **21.18%** vs **15.76%** others | Keep an outlier review path; do not auto-exclude |
| Interest-rate bands | **7.41%** (5%–10%) → **35.14%** (20%–25%) | Pricing already reflects substantial risk differentiation |
| Recent inquiries | Risk generally rises with populated inquiry counts | Supporting signal — not a standalone decision rule |
| Sparse inquiry groups | Some high-count groups have 1–2 records | Avoid treating 0% / 100% as stable estimates |

> Findings describe **historical associations**. They do not establish causation and are not validated predictions for future borrowers.

---

## Recommendations

Based on the portfolio analysis (see [`Loan_Default_Risk_Report.pdf`](./Loan_Default_Risk_Report.pdf)):

1. Apply **risk-based pricing** for small-business and educational loans (highest observed default rates).
2. Enforce **minimum FICO** and **maximum DTI** thresholds for auto-approval; route borderline cases to manual review.
3. Flag applicants with **more than 5–6 recent credit inquiries** for additional verification.
4. Monitor the **~19.5% policy-exception** book as a separate cohort and review underwriting effectiveness over time.
5. Explore a **composite risk score** combining FICO, DTI, revolving utilization, and recent inquiries — only after leakage review, temporal validation, and fairness testing if used for production decisions.

---

## Reproducing This Project

### Prerequisites

- Git
- Python 3 + `pip`
- Google Colab or Jupyter Notebook
- MySQL Server (CLI or Workbench)
- Power BI Desktop (Windows)
- Power BI–compatible MySQL driver (for refresh only)

### 1. Clone the repository

```bash
git clone https://github.com/nafishaparveen2104/Loan-Default-Risk-Analysis-Dashboard.git
cd Loan-Default-Risk-Analysis-Dashboard
```

### 2. Python environment

```bash
python -m venv .venv
```

macOS / Linux:

```bash
source .venv/bin/activate
```

Windows PowerShell:

```powershell
.venv\Scripts\Activate.ps1
```

```bash
python -m pip install --upgrade pip
python -m pip install pandas numpy jupyter
```

### 3. Run the notebook

**Option A — Google Colab**

Open [Loan_Data.ipynb on Colab](https://colab.research.google.com/github/nafishaparveen2104/Loan-Default-Risk-Analysis-Dashboard/blob/main/Loan_Data.ipynb), run cells in order, and upload `loan_data.csv` when prompted.

**Option B — Local Jupyter**

```bash
jupyter notebook Loan_Data.ipynb
```

Skip `google.colab.files` upload/download cells when running locally; keep `loan_data.csv` in the project root.

> **Shortcut:** `loan_data_cleaned.csv` is already in the repo. Skip to MySQL or Power BI if you only need the finished analysis.

### 4. Create the MySQL schema

```bash
mysql -u root -p < Database-Loan_data.sql
```

Creates `loan_analysis.loan_data` and includes analytical queries for totals, purpose, FICO bands, credit policy, and inquiries.

### 5. Load the cleaned CSV

With `local_infile` enabled (Bash / Git Bash):

```bash
mysql --local-infile=1 -u root -p -e "
LOAD DATA LOCAL INFILE '$(pwd)/loan_data_cleaned.csv'
INTO TABLE loan_analysis.loan_data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
"
```

Validate:

```bash
mysql -u root -p loan_analysis -e "
SELECT
  COUNT(*) AS total_loans,
  SUM(not_fully_paid) AS total_defaults,
  ROUND(AVG(not_fully_paid) * 100, 2) AS default_rate_pct
FROM loan_data;
"
```

**Expected:** 9,578 loans · 1,533 defaults · 16.01% default rate.

### 6. Open and refresh the dashboard

1. Open `Loan_data_analysis_dashboard.pbix` in Power BI Desktop.
2. Inspect the embedded snapshot — no database required.
3. To refresh: start MySQL and confirm `loan_analysis.loan_data` exists.
4. **File → Options and settings → Data source settings**.
5. Update `localhost:3306` credentials if needed.
6. **Refresh** and confirm KPIs match expected totals.

---

## Dependencies

No pinned `requirements.txt` is committed yet. Notebook packages:

| Package | Use |
| --- | --- |
| `pandas` | Load, profile, transform, validate, export |
| `numpy` | Numerical support in the notebook |
| `jupyter` | Local notebook execution |
| `google.colab` | Upload/download when running in Colab only |

```bash
python -m pip install pandas numpy jupyter
```

Install MySQL Server and Power BI Desktop from their official distributions.

---

## Validation and Engineering Status

| Area | Status |
| --- | --- |
| Missing-value checks | Implemented (notebook) |
| Duplicate detection | Implemented (notebook) |
| Range checks | Implemented (selected financial fields + FICO) |
| Outlier handling | Extreme values flagged and retained |
| SQL validation | Row count, default rate, segment, inquiry queries |
| Automated tests | Not configured |
| CI/CD | Not configured |
| Logging | Notebook output + Power BI refresh status |
| Monitoring | Not configured |
| Docker | Not used |
| Power BI Service deploy | Not included |
| Row-level security | Not configured |
| Credentials committed | None detected |

### Security notes

- Database credentials stay outside the repository.
- The PBIX contains imported data and connection metadata — review before external distribution.
- For confidential lending data, add workspace permissions, RLS, gateway controls, and credential rotation.
- The public dataset has no direct borrower identifiers; production credit data requires stronger privacy and regulatory controls.

---

## Limitations and Responsible Use

- Source period is **2007–2010**; it may not represent current borrowers, products, or macro conditions.
- `not_fully_paid` is a default **proxy** and may not match institutional delinquency or charge-off definitions.
- No classification model, temporal validation, calibration, fairness testing, or inference API is included.
- High recent-inquiry categories have very small samples (unstable 0% / 100% rates).
- Notebook → CSV → MySQL → Power BI refresh remains **manual**.
- Power Query points at `localhost:3306`; refresh is not portable until the source is parameterized.
- `Avg Annual Income` averages a **logarithmic** field — not currency.
- MySQL schema uses `FLOAT` for some decimals (possible minor representation differences).
- No automated tests, CI, hosted dashboard, or repository license file yet.

> **Responsible use:** Educational and portfolio demonstration only. Do **not** use this project as the sole basis for lending, pricing, adverse-action, or other high-impact decisions.

---

## 🛠️ Skills Demonstrated

`Data Cleaning` · `Data Validation` · `Data Profiling` · `Outlier Analysis` · `Python` · `Pandas` · `NumPy` · `Jupyter` · `Google Colab` · `MySQL` · `SQL` · `Power Query` · `DAX` · `Power BI` · `Data Visualization` · `Business Intelligence` · `Credit Risk Analysis` · `Dashboard Design` · `Data Storytelling` · `Technical Documentation` · `Git` · `GitHub`

---

## Future Enhancements

- [1] Parameterize MySQL host, port, database, and table in Power Query
- [2] Add pinned Python dependencies / reproducible environment file
- [3] Convert notebook transforms into a testable CLI pipeline
- [4] Add schema, range, row-count, and aggregate regression tests
- [5] Configure GitHub Actions for automated validation
- [6] Convert PBIX to PBIP/TMDL for source-friendly version control
- [7] Add sample counts and confidence intervals to risk-segment visuals
- [8] Band sparse inquiry values into statistically meaningful groups
- [9] Correct or rename the annual-income measure
- [10] Power BI Service deployment, gateway, scheduled refresh, and RLS
- [11] Add an explicit repository license and contribution guide
- [12] Optional predictive workflow only after leakage review, temporal validation, calibration, explainability, and fairness testing

---

## Troubleshooting

| Problem | Resolution |
| --- | --- |
| `ModuleNotFoundError: google.colab` | Run in Colab, or skip Colab upload/download cells locally |
| `LOAD DATA LOCAL INFILE` disabled | Enable `local_infile`, or use Workbench Table Data Import Wizard |
| Power BI cannot connect to MySQL | Confirm MySQL is running, install a supported driver, verify `localhost:3306` and permissions |
| PBIX opens but refresh fails | Snapshot opens offline; refresh still needs the configured MySQL source |
| KPI shows 10K instead of 9,578 | Compact display units; underlying measure is 9,578 |
| Database already exists | Reuse `loan_analysis`, or drop only when intentionally rebuilding |
| Segment rates look wrong | Confirm DAX band thresholds and refresh all visuals |

---

## Author

**Nafisha Parveen**  
Aspiring Data Analyst

[![GitHub](https://img.shields.io/badge/GitHub-nafishaparveen2104-181717?style=flat&logo=github&logoColor=white)](https://github.com/nafishaparveen2104)
[![Portfolio](https://img.shields.io/badge/Portfolio-View%20Projects-1F3864?style=flat)](https://github.com/nafishaparveen2104)

**Core stack:** Python · Pandas · NumPy · Jupyter · SQL · MySQL · Power BI · Power Query · DAX

---

⭐ If this project helped you or impressed you, consider starring the repo — it really helps visibility!

[Back to top](#loan-default-risk-analysis-dashboard)
