CREATE DATABASE loan_analysis;
USE loan_analysis;

CREATE TABLE loan_data (
    credit_policy       INT,
    purpose              VARCHAR(50),
    int_rate             FLOAT,
    installment           FLOAT,
    log_annual_inc        FLOAT,
    dti                   FLOAT,
    fico                  INT,
    days_with_cr_line     FLOAT,
    revol_bal             BIGINT,
    revol_util            FLOAT,
    inq_last_6mths        INT,
    delinq_2yrs           INT,
    pub_rec               INT,
    not_fully_paid        INT,
    is_outlier            INT
);

SELECT COUNT(*) FROM loan_data;
SELECT * FROM loan_data LIMIT 10;

SELECT 
    SUM(CASE WHEN purpose IS NULL THEN 1 ELSE 0 END) AS null_purpose,
    SUM(CASE WHEN fico IS NULL THEN 1 ELSE 0 END) AS null_fico,
    SUM(CASE WHEN int_rate IS NULL THEN 1 ELSE 0 END) AS null_int_rate
FROM loan_data;

-- Total number of loans and overall default rate
SELECT 
    COUNT(*) AS total_loans,
    SUM(not_fully_paid) AS defaulted_loans,
    ROUND(SUM(not_fully_paid) * 100.0 / COUNT(*), 2) AS default_rate_pct
FROM loan_data;

-- Loan count and default rate by purpose
SELECT 
    purpose,
    COUNT(*) AS total_loans,
    ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate,
    SUM(not_fully_paid) AS defaults,
    ROUND(SUM(not_fully_paid) * 100.0 / COUNT(*), 2) AS default_rate_pct
FROM loan_data
GROUP BY purpose
ORDER BY total_loans DESC;

-- Average FICO score by credit policy (1 = meets criteria, 0 = does not)
SELECT 
    credit_policy,
    COUNT(*) AS total_loans,
    ROUND(AVG(fico), 0) AS avg_fico,
    ROUND(AVG(int_rate) * 100, 2) AS avg_interest_rate
FROM loan_data
GROUP BY credit_policy;

-- Categorize loans into FICO score bands and check default rate per band
SELECT 
    CASE 
        WHEN fico < 650 THEN 'Below 650'
        WHEN fico BETWEEN 650 AND 699 THEN '650-699'
        WHEN fico BETWEEN 700 AND 749 THEN '700-749'
        WHEN fico BETWEEN 750 AND 799 THEN '750-799'
        ELSE '800+' 
    END AS fico_band,
    COUNT(*) AS total_loans,
    SUM(not_fully_paid) AS defaults,
    ROUND(SUM(not_fully_paid) * 100.0 / COUNT(*), 2) AS default_rate_pct
FROM loan_data
GROUP BY fico_band
ORDER BY fico_band;

-- Average installment and DTI (debt-to-income) by purpose
SELECT 
    purpose,
    ROUND(AVG(installment), 2) AS avg_installment,
    ROUND(AVG(dti), 2) AS avg_dti,
    ROUND(AVG(log_annual_inc), 2) AS avg_log_income
FROM loan_data
GROUP BY purpose
ORDER BY avg_installment DESC;

-- Impact of recent credit inquiries on default rate
SELECT 
    inq_last_6mths,
    COUNT(*) AS total_loans,
    SUM(not_fully_paid) AS defaults,
    ROUND(SUM(not_fully_paid) * 100.0 / COUNT(*), 2) AS default_rate_pct
FROM loan_data
GROUP BY inq_last_6mths
ORDER BY inq_last_6mths;