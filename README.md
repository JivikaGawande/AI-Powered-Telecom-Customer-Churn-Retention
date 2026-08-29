# AI-Powered Telecom Customer Churn & Retention Analysis

## Project Overview

Customer churn is an important business problem in the telecom industry. When customers leave, companies not only lose recurring revenue but also spend more on acquiring new customers.

In this project, I analyzed telecom customer data to understand the factors associated with customer churn and built a machine learning model to identify customers who are more likely to leave.

I used SQL for data analysis and validation, Python for data preprocessing and machine learning, and Power BI to create interactive dashboards. The final goal was to turn customer data into useful business insights that can support customer retention decisions.

---

## Project Objectives

The main objectives of this project were to:

- Understand customer churn patterns.
- Identify customer groups with higher churn rates.
- Clean and prepare the dataset for analysis.
- Perform feature engineering for better customer segmentation.
- Build a machine learning model to predict customer churn.
- Calculate churn probability for individual customers.
- Divide customers into Low, Medium, and High Risk groups.
- Build an interactive Power BI dashboard.
- Suggest practical retention strategies based on the findings.

---

## Tools and Technologies

| Tool | Use in Project |
|---|---|
| SQL | Data exploration, validation and analysis |
| Python | Data preprocessing and machine learning |
| Pandas | Data cleaning and manipulation |
| Scikit-learn | Model training and evaluation |
| Logistic Regression | Churn prediction model |
| Power BI | Dashboard development and visualization |
| Jupyter Notebook | Analysis and experimentation |

---

## Dataset Overview

After data preparation, the final dataset contained:

- 7,032 customers
- 25 analytical columns
- 1,869 churned customers
- 5,163 non-churned customers
- Overall churn rate of 26.58%
- No missing values in the final cleaned dataset

Some of the important variables used in the analysis were:

`tenure`, `Contract`, `InternetService`, `PaymentMethod`, `MonthlyCharges`, `TotalCharges`, `OnlineSecurity`, `TechSupport`, and other customer service-related attributes.

---

## Project Workflow

```text
Raw Telecom Dataset
        |
        v
Data Cleaning and Validation
        |
        v
SQL Analysis
        |
        v
Feature Engineering
        |
        v
Python Data Preprocessing
        |
        v
Categorical Encoding
        |
        v
Feature Scaling
        |
        v
Train-Test Split
        |
        v
Logistic Regression Model
        |
        v
Model Evaluation
        |
        v
Churn Probability Prediction
        |
        v
Customer Risk Segmentation
        |
        v
Power BI Dashboard
        |
        v
Business Insights and Retention Recommendations
```

---

## Machine Learning Approach

For churn prediction, I used a Logistic Regression model.

Before training the model, categorical variables were converted into numerical features and the input features were standardized. The data was then divided into training and testing sets using an 80:20 split with stratification.

### Model Performance

| Metric | Result |
|---|---:|
| Accuracy | 79.46% |
| Training Records | 5,625 |
| Testing Records | 1,407 |
| Churn Precision | 64% |
| Churn Recall | 53% |
| Churn F1-Score | 58% |

### Confusion Matrix

| Actual / Predicted | No Churn | Churn |
|---|---:|---:|
| No Churn | 921 | 112 |
| Churn | 177 | 197 |

The model achieved an overall accuracy of 79.46%. I also considered precision, recall, and F1-score because accuracy alone does not fully explain model performance when the target classes are imbalanced.

---

## Customer Risk Segmentation

After training the model, I calculated the churn probability for every customer. These probabilities were then used to create three customer risk groups.

| Risk Level | Churn Probability | Number of Customers |
|---|---:|---:|
| Low Risk | 0% - 30% | 4,369 |
| Medium Risk | Above 30% - 60% | 1,623 |
| High Risk | Above 60% - 100% | 1,040 |

The model identified 1,040 customers as High Risk, representing approximately 14.79% of the total customer base.

This segmentation makes the prediction results easier to use from a business perspective because retention teams can prioritize customers with higher predicted churn probability.

---

## Power BI Dashboard

I created two Power BI dashboard pages to present both the overall churn analysis and the machine learning results.

### Page 1: Churn Overview

The first page focuses on the overall customer churn situation and includes:

- Total Customers
- Churned Customers
- Churn Rate
- High Risk Customers
- Churn Rate by Contract
- Churn Rate by Internet Service
- Churn Rate by Payment Method
- Churn Rate by Tenure Group
- Churn Rate by Monthly Charge Band
- Customer Risk Distribution

### Page 2: ML Risk Analysis

The second page focuses on predicted customer risk and includes:

- Customer Risk Distribution
- Average Churn Probability by Risk Level
- High-Risk Customers by Contract
- High-Risk Customers by Internet Service
- High-Risk Customers by Payment Method
- High-Risk Customers by Tenure Group
- High-Risk Customers by Monthly Charge Band
- Customer-level High-Risk Prediction Table
- Contract filter for interactive analysis

---

## Key Findings

The analysis highlighted several important customer churn patterns.

### Contract Type

Month-to-month customers had a churn rate of 42.71%, which was considerably higher than customers with longer contracts.

### Internet Service

Fiber optic customers had a churn rate of 41.89%, making this one of the most important customer groups to investigate further.

### Payment Method

Customers paying through electronic check had a churn rate of 45.29%, the highest among the payment methods analyzed.

### Customer Tenure

Customers with 0-12 months of tenure had a churn rate of 47.68%. The analysis suggests that the early stage of the customer relationship is particularly important for retention.

### Monthly Charges

Customers in the High monthly-charge band had a churn rate of 37.81%, which was the highest among the monthly charge groups.

### Machine Learning Risk

The model identified 1,040 customers as High Risk. These customers can be prioritized for retention campaigns instead of targeting the entire customer base.

---

## Business Recommendations

Based on the analysis, I would recommend the following actions:

1. Prioritize customers classified as High Risk for proactive retention campaigns.
2. Improve onboarding and customer engagement during the first 12 months.
3. Encourage suitable month-to-month customers to move to longer-term contracts.
4. Investigate service quality, pricing, and support experience for Fiber optic customers.
5. Review whether electronic check users experience billing or payment-related difficulties.
6. Use churn probability together with customer characteristics to create more personalized retention offers.
7. Track the results of retention campaigns and use those outcomes to improve future churn prediction models.

---

## Repository Files

| File | Description |
|---|---|
| `telco_churn_cleaned.csv` | Cleaned dataset used for analysis and modeling |
| `telco_churn_analysis.sql` | SQL queries used for customer churn analysis |
| `Telco_Churn_Analysis.ipynb` | Jupyter Notebook used during the analysis |
| `telco_churn_analysis.py` | Python script used for machine learning |
| `telco_churn_ml_predictions.csv` | Final customer churn probabilities and risk levels |
| `AI_Powered_Telecom_Customer_Churn_Retention_Dashboard.pbix` | Interactive Power BI dashboard |
| `AI_Powered_Telecom_Customer_Churn_Retention_Project_Report.docx` | Detailed project report |

---

## Conclusion

This project gave me practical experience in building an end-to-end data science solution, starting from data preparation and SQL analysis and continuing through machine learning and business intelligence.

The analysis showed that churn is particularly important among newer customers, month-to-month subscribers, Fiber optic users, and electronic check users. The machine learning model added another layer to the analysis by identifying individual customers with a higher probability of leaving.

The final Power BI dashboard brings the analysis and model predictions together so that churn patterns and high-risk customers can be explored in an interactive way.

---

## Author

**Jivika Gawande**

Data Science | Python | SQL | Machine Learning | Power BI
