# Loan Default Risk Analysis Dashboard

<div align="center">

[![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)

[![Pandas](https://img.shields.io/badge/Pandas-Data%20Wrangling-150458?style=for-the-badge&logo=pandas&logoColor=white)](https://pandas.pydata.org/)

[![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)

[![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)](https://github.com/nafishaparveen2104/Loan-Default-Risk-Analysis-Dashboard)

[![License](https://img.shields.io/badge/License-Not%20Specified-lightgrey?style=for-the-badge)](#-license)

**A comprehensive credit-risk analytics project featuring 9,578 historical loan records and an interactive Power BI dashboard**

[View Dashboard](#-dashboard-preview) • [Dataset Info](#-dataset) • [Setup Instructions](#-reproducing-this-project)

</div>

---

## 📑 Table of Contents

- [🎯 Project Overview](#-project-overview)
- [📊 Dashboard Preview](#-dashboard-preview)
- [📁 Dataset](#-dataset)
- [🛠️ Tech Stack](#️-tech-stack)
- [📂 Project Structure](#-project-structure)
- [🔧 Data Cleaning Pipeline](#-data-cleaning-pipeline)
- [📈 Dashboard Features](#-dashboard-features)
- [🔍 Key Findings](#-key-findings)
- [🚀 Reproducing This Project](#-reproducing-this-project)
- [📦 Dependencies](#-dependencies)
- [🎓 Skills Demonstrated](#-skills-demonstrated)
- [🔮 Future Enhancements](#-future-enhancements)
- [👤 Author](#-author)
- [📄 License](#-license)
- [🙏 Acknowledgments](#-acknowledgments)

---

## 🎯 Project Overview

This project delivers an end-to-end analysis of historical **LendingClub loan data** to identify the borrower and loan characteristics associated with higher rates of non-payment. It transforms raw loan data into a clean, SQL-ready dataset and an interactive Power BI dashboard that enables data-driven analysis across loan purpose, FICO score, debt-to-income ratio, revolving utilization, credit-policy status, and recent credit inquiries.

The project uses `not_fully_paid = 1` as the default-risk outcome. It is a descriptive business-intelligence analysis and does not train or deploy a predictive credit-scoring model.

### Why This Project Matters

| Challenge | Solution |
|-----------|-----------|
| Raw loan data uses analysis-unfriendly column names | Standardized 15-column cleaned dataset with SQL-friendly names |
| Default risk varies across borrower segments | Side-by-side KPI cards and cross-filtered risk visuals |
| Extreme observations can distort analysis | 439 extreme outliers flagged without deleting valid records |
| No single portfolio view | Interactive dashboard covering all major credit-risk dimensions |

### Key Questions Answered

- ✅ What is the overall loan default rate in the portfolio?

- ✅ Which loan purposes have the highest and lowest default rates?

- ✅ How does default risk compare across FICO, DTI, and revolving-utilization bands?

- ✅ How do credit-policy-compliant and policy-exception loans perform?

- ✅ Do recent credit inquiries indicate increased repayment risk?

---

## 📊 Dashboard Preview

### Executive Summary — Portfolio Overview

<div align="center">

  <img src="https://i.ibb.co/cdyLtnM/Screenshot-2026-07-09-123720.png" alt="Loan Default Risk Dashboard" width="700"/>

  <p><em>Portfolio-level KPIs, interactive filters, loan-purpose analysis, risk bands, credit-policy mix, and inquiry trends</em></p>

</div>

---

### Loan Purpose Analysis

<div align="center">

  <img src="https://i.ibb.co/Mk654Rwz/Screenshot-2026-07-09-132503.png" alt="Default Rate by Loan Purpose" width="700"/>

  <p><em>Default-rate comparison across small business, education, home improvement, debt consolidation, credit card, and other loan purposes</em></p>

</div>

---

### FICO Score Analysis

<div align="center">

  <img src="https://i.ibb.co/rRs2x0KQ/Screenshot-2026-07-09-132637.png" alt="Default Rate by FICO Band" width="700"/>

  <p><em>Default-rate distribution across Low, Medium, and High FICO score bands</em></p>

</div>

---

### Debt-to-Income Analysis

<div align="center">

  <img src="https://i.ibb.co/4gWxyygN/Screenshot-2026-07-09-132727.png" alt="Default Rate by DTI Band" width="700"/>

  <p><em>Borrower risk comparison across Low, Medium, and High debt-to-income bands</em></p>

</div>

---

### Revolving Utilization Analysis

<div align="center">

  <img src="https://i.ibb.co/fYdnB4BP/Screenshot-2026-07-09-133019.png" alt="Default Rate by Revolving Utilization" width="700"/>

  <p><em>Default-rate comparison by revolving credit utilization level</em></p>

</div>

---

### Credit Policy Distribution

<div align="center">

  <img src="https://i.ibb.co/L2Q6p4W/Screenshot-2026-07-09-133157.png" alt="Loan Distribution by Credit Policy" width="700"/>

  <p><em>Portfolio distribution between policy-compliant and policy-exception loans</em></p>

</div>

---

### Recent Credit Inquiries

<div align="center">

  <img src="https://i.ibb.co/hxgZSv5g/Screenshot-2026-07-09-133658.png" alt="Default Rate by Recent Credit Inquiries" width="700"/>

  <p><em>Default-rate trend by the number of creditor inquiries during the previous six months</em></p>

</div>

> 📝 **Note:** The images above are hosted externally. For the best viewing experience, download and open the Power BI dashboard file (`.pbix`) directly. The dashboard displays 9,578 loans as **10K** because compact KPI display units are enabled.

---

## 📁 Dataset

**Raw File:** `loan_data.csv`  

**Cleaned File:** `loan_data_cleaned.csv`  

**Records:** 9,578 loans  

**Dimensions:** 14 source columns + 1 derived outlier flag  

**Data Source:** [Loan Data on Kaggle](https://www.kaggle.com/datasets/itssuru/loan-data)  

**Data Period:** Historical LendingClub records from 2007–2010

### Complete Schema

| # | Column | Type | Description |
|---|--------|------|-------------|
| 1 | `credit_policy` | int64 | `1` if the borrower meets LendingClub's credit-underwriting criteria; otherwise `0` |
| 2 | `purpose` | category | Loan purpose: all other, credit card, debt consolidation, educational, home improvement, major purchase, or small business |
| 3 | `int_rate` | float64 | Interest rate stored as a proportion; `0.1189` represents 11.89% |
| 4 | `installment` | float64 | Monthly installment owed by the borrower |
| 5 | `log_annual_inc` | float64 | Natural logarithm of the borrower's self-reported annual income |
| 6 | `dti` | float64 | Borrower's debt-to-income ratio |
| 7 | `fico` | int64 | Borrower's FICO credit score |
| 8 | `days_with_cr_line` | float64 | Number of days the borrower has maintained a credit line |
| 9 | `revol_bal` | int64 | Borrower's revolving credit balance |
| 10 | `revol_util` | float64 | Revolving credit utilization percentage |
| 11 | `inq_last_6mths` | int64 | Creditor inquiries during the previous six months |
| 12 | `delinq_2yrs` | int64 | Payments 30 or more days late during the previous two years |
| 13 | `pub_rec` | int64 | Number of derogatory public records |
| 14 | `not_fully_paid` | int64 | `1` if the loan was not fully paid; otherwise `0` |
| 15 | `is_outlier` | int64 | `1` if a selected field exceeds the 3×IQR extreme-outlier threshold |

### Data Quality Guarantee

The cleaned dataset provides:

- ✅ **Zero duplicate rows** — verified with `df.duplicated().sum()`

- ✅ **Zero missing values** — confirmed across all source and cleaned columns

- ✅ **Validated FICO scores** — all observed values fall between 612 and 827

- ✅ **No invalid negative values** — checked for interest rate, installment, FICO, DTI, and revolving balance

- ✅ **Consistent categories** — seven standardized loan-purpose categories

- ✅ **Outlier preservation** — 439 extreme observations flagged without removing any records

---

## 🛠️ Tech Stack

<table>

<tr>

<td width="50%">

**Data Processing**

- Python 3.x

- Pandas (data manipulation)

- NumPy (numerical analysis)

- Jupyter Notebook / Google Colab

</td>

<td width="50%">

**Business Intelligence**

- Power BI Desktop (dashboard creation)

- DAX (custom measures and risk bands)

- Power Query M (MySQL data import)

</td>

</tr>

<tr>

<td>

**Development & Deployment**

- Git (version control)

- GitHub (portfolio hosting)

- MySQL (analytical database)

- CSV (data interchange format)

</td>

<td>

**Future Stack (Planned)**

- pytest / data validation tests

- GitHub Actions (CI)

- Power BI Service (cloud deployment)

- PBIP / TMDL (semantic-model versioning)

</td>

</tr>

</table>

---

## 📂 Project Structure

```
Loan-Default-Risk-Analysis-Dashboard/
│
├── 📓 Loan_Data.ipynb
│   └── Jupyter/Colab notebook with the complete data-cleaning pipeline
│
├── 📄 loan_data.csv
│   └── Original dataset (9,578 rows × 14 columns)
│
├── 📊 loan_data_cleaned.csv
│   └── Final cleaned dataset (9,578 rows × 15 columns)
│
├── 🗄️ Database-Loan_data.sql
│   └── MySQL schema and analytical SQL queries
│
├── 📈 Loan_data_analysis_dashboard.pbix
│   └── Interactive Power BI dashboard and semantic model
│
├── 📑 Loan_Default_Risk_Report.pdf
│   └── Five-page exported analysis report
│
├── 📝 Loan_Default_Risk_Report.docx
│   └── Editable report source
│
└── 📖 README.md
    └── Project documentation (this file)
```

---

## 🔧 Data Cleaning Pipeline

The data-cleaning process is fully documented in `Loan_Data.ipynb`. Here's what it does:

### Step 1: Load & Inspect Data

```python
import pandas as pd

# Load dataset
df = pd.read_csv("loan_data.csv")

# Initial inspection
print(f"Shape: {df.shape}")
print(f"\nColumns: {list(df.columns)}")
df.info()
```

**Output:** 9,578 rows × 14 columns, mixed data types, and no missing values.

---

### Step 2: Column Name Normalization

```python
# Replace dots with underscores for SQL-friendly column names
df.columns = df.columns.str.replace(".", "_", regex=False)

print(df.columns.tolist())
```

**Why:** Converts fields such as `credit.policy` and `not.fully.paid` into `credit_policy` and `not_fully_paid`.

---

### Step 3: Missing Value & Duplicate Validation

```python
# Check missing values
print("Missing values:\n", df.isnull().sum())

# Check duplicate rows
print("Duplicate rows:", df.duplicated().sum())

# Review summary statistics
print(df.describe())
```

**Why:** Confirms that all 9,578 source rows are complete and unique.

---

### Step 4: Type Enforcement

```python
# Convert loan purpose to a categorical data type
df["purpose"] = df["purpose"].astype("category")

print(df["purpose"].cat.categories)
print(df.dtypes)
```

**Why:** Keeps the seven loan-purpose categories consistent and memory efficient.

---

### Step 5: Outlier Analysis

```python
numeric_cols = [
    "int_rate",
    "installment",
    "log_annual_inc",
    "dti",
    "fico",
    "days_with_cr_line",
    "revol_bal",
    "revol_util",
]

for col in numeric_cols:
    q1 = df[col].quantile(0.25)
    q3 = df[col].quantile(0.75)
    iqr = q3 - q1
    lower = q1 - 1.5 * iqr
    upper = q3 + 1.5 * iqr
    outliers = df[(df[col] < lower) | (df[col] > upper)]
    print(f"{col}: {len(outliers)} potential outliers")
```

**Why:** Profiles unusual values without silently deleting valid high-value observations.

---

### Step 6: Extreme Outlier Flag

```python
# Flag extreme outliers without removing records
df["is_outlier"] = 0

for col in ["revol_bal", "days_with_cr_line", "dti"]:
    q1 = df[col].quantile(0.25)
    q3 = df[col].quantile(0.75)
    iqr = q3 - q1
    lower = q1 - 3 * iqr
    upper = q3 + 3 * iqr

    mask = (df[col] < lower) | (df[col] > upper)
    df.loc[mask, "is_outlier"] = 1

print("Total flagged extreme outliers:", df["is_outlier"].sum())
```

**Output:** 439 extreme outliers flagged and retained.

---

### Step 7: Export Cleaned Data

```python
# Final validation
print(
    "Shape:", df.shape,
    "| Nulls:", df.isnull().sum().sum(),
    "| Duplicates:", df.duplicated().sum(),
)

# Export
df.to_csv("loan_data_cleaned.csv", index=False)
print("✅ Cleaned data exported successfully!")
```

---

## 📈 Dashboard Features

The Power BI dashboard `Loan_data_analysis_dashboard.pbix` contains **1 interactive page** with six major analytical areas:

| Area | Content | Key Visuals |
|------|---------|--------------|
| **1. Executive Summary** | Portfolio overview | KPI cards for loans, default rate, FICO, and interest rate |
| **2. Loan Purpose** | Purpose-level risk analysis | Default-rate bar chart across seven purposes |
| **3. FICO & DTI** | Borrower credit-quality analysis | FICO-band and DTI-band bar charts |
| **4. Revolving Utilization** | Credit-usage analysis | Utilization-band default-rate chart |
| **5. Credit Policy** | Underwriting-policy mix | Policy-compliant versus exception donut chart |
| **6. Recent Inquiries** | Credit-seeking behavior | Inquiry-level default-rate line chart |

### Interactive Capabilities

- **Cross-filtering:** Click any visual to filter related values on the dashboard

- **Slicers:** Filter by purpose, FICO band, DTI band, and credit-policy status

- **Tooltips:** Hover over visuals for precise values and percentages

- **DAX Measures:** Custom calculations for total loans, defaults, default rate, average FICO, and average interest rate

- **Imported Snapshot:** Open the dashboard without connecting to the original MySQL server

---

## 🔍 Key Findings

Based on analysis of the cleaned dataset:

| Metric | Finding | Business Implication |
|--------|---------|---------------------|
| **Overall Portfolio** | 1,533 of 9,578 loans were not fully paid | The observed portfolio default rate is 16.01% |
| **Loan Purpose** | Small business: 27.79%; major purchase: 11.21% | Loan purpose should be considered in underwriting and pricing reviews |
| **FICO Score** | Low FICO: 23.62%; High FICO: 7.43% | FICO produces the largest separation among the displayed risk bands |
| **Debt Burden** | High DTI: 18.33%; Low DTI: 14.83% | Higher borrower debt burden is associated with higher default risk |
| **Credit Utilization** | High: 18.97%; Low: 12.43% | Revolving utilization adds useful context to FICO and DTI |
| **Credit Policy** | Exceptions: 27.78%; compliant: 13.15% | Policy-exception loans should be monitored separately |
| **Recent Inquiries** | Risk generally rises through commonly populated inquiry counts | Frequent inquiries can support additional verification, but sparse groups require caution |

> These results are historical associations, not causal findings or validated predictions for future borrowers.

---

## 🚀 Reproducing This Project

### Prerequisites

- **Python:** Version 3.x

- **pip:** Latest available version

- **MySQL:** Server with CLI or Workbench

- **Power BI Desktop:** [Download here](https://powerbi.microsoft.com/downloads/) (Windows)

### Step 1: Clone the Repository

```bash
git clone https://github.com/nafishaparveen2104/Loan-Default-Risk-Analysis-Dashboard.git

cd Loan-Default-Risk-Analysis-Dashboard
```

### Step 2: Set Up Python Environment

```bash
# Create virtual environment
python -m venv venv

# Activate (macOS/Linux)
source venv/bin/activate

# Activate (Windows)
venv\Scripts\activate

# Install dependencies
pip install pandas numpy jupyter
```

### Step 3: Run Data Cleaning Notebook

```bash
jupyter notebook "Loan_Data.ipynb"
```

Execute all cells to:

1. Load the raw loan data

2. Inspect data types, missing values, and duplicates

3. Normalize column names

4. Validate financial ranges

5. Flag extreme outliers

6. Export the cleaned CSV

> 💡 **Note:** The cleaned CSV is already included in the repository, so you can skip to Step 4 if you only want to rebuild or view the dashboard.

### Step 4: Set Up the MySQL Database

Create the database and table:

```bash
mysql -u root -p < Database-Loan_data.sql
```

Load the cleaned CSV with MySQL `local_infile` enabled:

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

Validate the imported totals:

```bash
mysql -u root -p loan_analysis -e "
SELECT
    COUNT(*) AS total_loans,
    SUM(not_fully_paid) AS total_defaults,
    ROUND(AVG(not_fully_paid) * 100, 2) AS default_rate_pct
FROM loan_data;
"
```

### Step 5: Open the Dashboard

**Option A: Power BI Desktop (Recommended)**

1. Download and install [Power BI Desktop](https://powerbi.microsoft.com/downloads/)

2. Open `Loan_data_analysis_dashboard.pbix`

3. To refresh the model, confirm MySQL is running at `localhost:3306`

4. If the source is unavailable: **File → Options and settings → Data source settings** → update the MySQL source or credentials

**Option B: View the Static Report**

1. Open `Loan_Default_Risk_Report.pdf`

2. Review the dashboard findings without installing Power BI Desktop

---

## 📦 Dependencies

```txt
pandas
numpy
jupyter
```

Install with:

```bash
pip install pandas numpy jupyter
```

For Power BI: Download it from the [official website](https://powerbi.microsoft.com/downloads/) (free for development).

For MySQL: Install MySQL Server and a Power BI-compatible MySQL driver before refreshing the PBIX source.

---

## 🎓 Skills Demonstrated

<div align="center">

`Data Cleaning` `Data Validation` `Data Wrangling` `Outlier Analysis` `Pandas` `Python` `NumPy` `Jupyter Notebook` `Google Colab` `Exploratory Data Analysis` `SQL` `MySQL` `Power Query` `Power BI` `DAX` `Data Visualization` `Business Intelligence` `Credit Risk Analysis` `Dashboard Design` `Data Storytelling` `CSV Processing` `Git` `GitHub` `Documentation`

</div>

---

## 🔮 Future Enhancements

- [ ] **Automated data validation** with reusable tests and schema checks

- [ ] **Pinned dependencies** using a `requirements.txt` or lock file

- [ ] **Power Query parameters** for MySQL host, port, database, and table

- [ ] **GitHub Actions** for automated row-count and metric validation

- [ ] **PBIP/TMDL conversion** for source-friendly Power BI version control

- [ ] **Sample-size labels** for the recent-inquiry visual

- [ ] **Confidence intervals** for segment-level default rates

- [ ] **Power BI Service deployment** for browser access and scheduled refresh

- [ ] **Row-level security** for controlled portfolio access

- [ ] **Predictive modeling** with temporal validation, calibration, fairness testing, and explainability

---

## 👤 Author

<div align="center">

**Nafisha Parveen**  

*Aspiring Data Analyst*

[![GitHub](https://img.shields.io/badge/GitHub-nafishaparveen2104-181717?style=flat&logo=github)](https://github.com/nafishaparveen2104)

[![Portfolio](https://img.shields.io/badge/Portfolio-View%20All%20Projects-blue?style=flat)](https://github.com/nafishaparveen2104)

**Tech Stack:** Python · Pandas · NumPy · Power BI · DAX · Power Query · SQL · MySQL

</div>

---

## 📄 License

This repository currently does **not** contain a `LICENSE` file. The project code, dashboard, and reports therefore do not have an explicit open-source license.

The source dataset is licensed separately. The Kaggle data card identifies it under the [Open Data Commons Database Contents License 1.0](https://opendatacommons.org/licenses/dbcl/1-0/).

---

## 🙏 Acknowledgments

- Dataset published by [ItsSuru on Kaggle](https://www.kaggle.com/datasets/itssuru/loan-data)

- Historical lending data originally associated with LendingClub records from 2007–2010

- Power BI dashboard designed to demonstrate credit-risk analytics and business-intelligence skills

- Built as a portfolio project to demonstrate end-to-end data cleaning, SQL analysis, dashboard development, and technical documentation

---

<div align="center">

⭐ **If this project helped you or impressed you, consider giving it a star!** ⭐

[Back to Top](#loan-default-risk-analysis-dashboard)

</div>
