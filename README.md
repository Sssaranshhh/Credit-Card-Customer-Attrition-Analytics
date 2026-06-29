# Credit Card Customer Attrition Analytics

## Overview

This project analyzes customer attrition for a credit card company using SQL and Power BI. The objective was to identify the key drivers of customer churn through SQL-based exploratory data analysis and present actionable business insights in an interactive Power BI dashboard.

The project follows a complete analytics workflow including data cleaning, validation, exploratory analysis, KPI development, dashboard design, and business recommendations.
The project simulates an end-to-end analytics workflow, including data cleaning, validation, exploratory SQL analysis, KPI development, dashboard creation, and business recommendations.

---

## Dataset

- **Dataset:** BankChurners
- **Records:** 10,127 Customers
- **Tools Used:** MySQL, Power BI, DAX

---
## Features

- SQL-based data validation and exploratory analysis
- Interactive Power BI dashboard
- DAX-based KPI calculations
- Executive-level business insights
- Interactive filtering by card category and gender

---
## Project Workflow

### 1. Database Creation

- Created MySQL database
- Imported customer data using `LOAD DATA INFILE`
- Removed unnecessary Naive Bayes prediction columns

### 2. Data Validation

Performed validation including:

- Row count verification
- Duplicate detection
- NULL value checks
- Category validation

### 3. Exploratory Data Analysis

Analyzed customer attrition across:

- Gender
- Income Category
- Education Level
- Card Category
- Customer Support Contacts
- Months Inactive
- Total Relationship Count
- Credit Utilization
- Age Groups
- Customer Spending Patterns

### 4. Power BI Dashboard

Built an executive dashboard featuring:

- KPI Cards
- Attrition Analysis
- Customer Behavior Analysis
- Customer Value Analysis
- Business Recommendations
- Interactive Slicers

---

# Dashboard Preview

![Dashboard](Dashboard/Dashboard.png)

---

# Key Insights

- Overall customer attrition rate is **16.1%**
- Customer inactivity is one of the strongest indicators of churn.
- Repeated customer support interactions strongly correlate with attrition.
- Customers with multiple banking products exhibit significantly higher retention.
- Attrited customers have substantially lower transaction amounts.
- Premium cardholders generate the highest business value.

---

# Business Recommendations

- Launch proactive retention campaigns for inactive customers.
- Strengthen first-contact resolution to reduce repeated customer support interactions.
- Cross-sell additional banking products to strengthen customer relationships.
- Monitor declining transaction activity as an early indicator of potential customer churn.
---

# Project Structure

```
Credit-Card-Customer-Attrition-Analytics
│
├── Dashboard
│   ├── credit_card_analytics.pbix
│   └── Dashboard.png
│
├── Data
│   └── BankChurners.csv
│
├── SQL
│   ├── 01_database_setup.sql
│   ├── 02_data_validation.sql
│   └── 03_exploratory_analysis.sql
│
└── README.md
```

---

# Skills Demonstrated

- MySQL
- Power BI
- DAX
- Data Cleaning
- Data Validation
- Exploratory Data Analysis (EDA)
- Business Intelligence
- Dashboard Design
- Data Visualization

---

## Tech Stack

- MySQL
- Power BI
- DAX

---
## Author

**Saransh**
