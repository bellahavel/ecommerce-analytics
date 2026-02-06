# E-Commerce Analytics: SQL & Customer Retention Analysis

## Project Overview

This project transforms raw, real-world e-commerce transaction data into
clean, analytics-ready datasets and business insights. The analysis focuses
on revenue performance, customer behavior, and cohort-based retention, with
all results reproduced consistently in both Python and SQL.

The goal of this project is to demonstrate strong data cleaning discipline,
business-driven analytics, and the ability to translate analytical logic
between Python and SQL workflows.

---

## Business Questions

- How does revenue evolve over time?
- How many orders are placed each month and what is the average order value?
- How do customers behave over their lifetime?
- How strong is customer retention by acquisition cohort?
- Can Python-based analytics be faithfully reproduced using SQL?

---

## Dataset

- Source: UCI Machine Learning Repository – Online Retail Dataset
- Time range: 2010–2011
- Unit of analysis: transaction-level line items within invoices

The raw dataset contains common real-world issues such as cancelled orders,
returns, missing customer identifiers, and invalid values.

---

## Project Structure

ecommerce-analytics/
├── data/
│ ├── raw.csv
│ ├── cleaned_revenue.csv
│ ├── cleaned_customers.csv
│ ├── customer_summary.csv
│ ├── cohort_counts.csv
│ ├── sql_monthly_kpis.csv
│ └── sql_cohort_retention.csv
├── notebooks/
│ ├── 01_data_cleaning.ipynb
│ └── 02_sql_analysis.ipynb
├── sql/
│ ├── schema.sql
│ └── queries.sql
├── .gitignore
├── README.md
└── requirements.txt

---

## Methodology

### 1. Data Cleaning & Preparation

- Inspected raw transaction data for data quality issues
- Removed cancelled invoices and invalid prices
- Preserved returns as business events
- Created revenue features and time-based fields
- Split datasets by analytical purpose:
  - revenue reporting
  - customer-level analytics

### 2. Revenue & KPI Analysis

- Monthly order counts
- Gross and net revenue
- Average order value (AOV)

### 3. Customer Analytics

- Customer-level aggregation (orders, revenue, recency)
- Identification of high-value and at-risk customers

### 4. Cohort Retention Analysis

- Defined cohorts by first purchase month
- Calculated cohort retention over time
- Visualized retention using a heatmap

### 5. SQL Mirror

- Reproduced all key analytics using SQL (DuckDB)
- Validated parity between Python and SQL results
- Exported SQL outputs for downstream BI use

---

## Key Insights

- Customer retention varies significantly by acquisition cohort
- Early cohorts (e.g., Dec 2010) show stronger long-term retention
- Revenue KPIs and cohort metrics align consistently across Python and SQL
- Clean separation of revenue vs customer analytics improves analytical integrity

---

## Tools & Technologies

- Python (pandas, matplotlib, seaborn)
- SQL (DuckDB)
- Jupyter Notebooks
- Git / GitHub

---

## Notes

This project emphasizes analytics correctness, reproducibility, and
business reasoning over predictive modeling. It serves as a strong
foundation for future work in forecasting, customer lifetime value,
and machine learning.
