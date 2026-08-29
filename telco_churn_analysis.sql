USE telco_churn_project;
SHOW TABLES;
SELECT *
FROM `ai_powered_telecom_churn_project_overview (2)`
LIMIT 10;
SELECT COUNT(*) AS total_customers
FROM `ai_powered_telecom_churn_project_overview (2)`;
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customerID) AS unique_customers
FROM `ai_powered_telecom_churn_project_overview (2)`;
SHOW COLUMNS FROM `ai_powered_telecom_churn_project_overview (2)`;
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customerID) AS unique_customers
FROM telco_churn;
SELECT
    SUM(customerID IS NULL) AS null_customerID,
    SUM(gender IS NULL) AS null_gender,
    SUM(SeniorCitizen IS NULL) AS null_senior,
    SUM(tenure IS NULL) AS null_tenure,
    SUM(MonthlyCharges IS NULL) AS null_monthly_charges,
    SUM(TotalCharges IS NULL) AS null_total_charges,
    SUM(Churn IS NULL) AS null_churn
FROM telco_churn;
SELECT
    SUM(TRIM(customerID) = '') AS blank_customerID,
    SUM(TRIM(gender) = '') AS blank_gender,
    SUM(TRIM(Churn) = '') AS blank_churn
FROM telco_churn;
SELECT gender, COUNT(*) AS count
FROM telco_churn
GROUP BY gender;

SELECT Churn, COUNT(*) AS count
FROM telco_churn
GROUP BY Churn;

SELECT Contract, COUNT(*) AS count
FROM telco_churn
GROUP BY Contract;
SELECT
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure,
    MIN(MonthlyCharges) AS min_monthly_charge,
    MAX(MonthlyCharges) AS max_monthly_charge,
    MIN(TotalCharges) AS min_total_charge,
    MAX(TotalCharges) AS max_total_charge
FROM telco_churn;
SELECT 
    Churn,
    COUNT(*) AS customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM telco_churn), 2) AS percentage
FROM telco_churn
GROUP BY Churn;
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

SELECT
    Tenure_Group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM telco_churn
GROUP BY Tenure_Group
ORDER BY churn_rate DESC;
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM telco_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(TotalCharges), 2) AS avg_total_charges,
    ROUND(AVG(tenure), 2) AS avg_tenure
FROM telco_churn
GROUP BY Churn;
SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM telco_churn
GROUP BY SeniorCitizen
ORDER BY churn_rate DESC;
SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM telco_churn
GROUP BY gender
ORDER BY churn_rate DESC;
SELECT
    Partner,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM telco_churn
GROUP BY Partner
ORDER BY churn_rate DESC;
SELECT
    Dependents,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM telco_churn
GROUP BY Dependents
ORDER BY churn_rate DESC;
SELECT
    OnlineSecurity,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM telco_churn
GROUP BY OnlineSecurity
ORDER BY churn_rate DESC;
SELECT
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM telco_churn
GROUP BY TechSupport
ORDER BY churn_rate DESC;

SELECT
    customerID,
    Contract,
    tenure,
    InternetService,
    PaymentMethod,
    MonthlyCharges,
    SeniorCitizen,
    Partner,
    Dependents,
    OnlineSecurity,
    TechSupport,
    Churn,

    CASE
        WHEN Contract = 'Month-to-month'
             AND tenure <= 12
             AND (OnlineSecurity = 'No' OR TechSupport = 'No')
        THEN 'High Risk'

        WHEN Contract = 'Month-to-month'
             OR tenure <= 24
             OR InternetService = 'Fiber optic'
             OR PaymentMethod = 'Electronic check'
        THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS Risk_Level

FROM telco_churn;
SELECT
    Risk_Level,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS actual_churn_rate
FROM
(
    SELECT
        Churn,
        CASE
            WHEN Contract = 'Month-to-month'
                 AND tenure <= 12
                 AND (OnlineSecurity = 'No' OR TechSupport = 'No')
            THEN 'High Risk'

            WHEN Contract = 'Month-to-month'
                 OR tenure <= 24
                 OR InternetService = 'Fiber optic'
                 OR PaymentMethod = 'Electronic check'
            THEN 'Medium Risk'

            ELSE 'Low Risk'
        END AS Risk_Level
    FROM telco_churn
) AS risk_data

GROUP BY Risk_Level
ORDER BY actual_churn_rate DESC;