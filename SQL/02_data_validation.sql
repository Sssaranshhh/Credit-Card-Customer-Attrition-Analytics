/*
Project:
Credit Card Customer Attrition Analytics

Author:
Saransh

Database:
MySQL 8.0

Dataset:
BankChurners (10,127 customers)

Description:
This script performs database creation, validation,
and exploratory SQL analysis to identify key drivers
of customer attrition.
*/

-- Verify row count
SELECT COUNT(*) AS Total_Customers
FROM customers;

-- Check for duplicate Customer IDs
SELECT CLIENTNUM,
COUNT(*) AS Duplicate_Count
FROM customers
GROUP BY CLIENTNUM
HAVING COUNT(*) > 1;

-- Check for null values
SELECT
SUM(CLIENTNUM IS NULL) AS ClientNum,
SUM(Attrition_Flag IS NULL) AS Attrition,
SUM(Customer_Age IS NULL) AS Age,
SUM(Gender IS NULL) AS Gender,
SUM(Education_Level IS NULL) AS Education,
SUM(Marital_Status IS NULL) AS Marital,
SUM(Income_Category IS NULL) AS Income,
SUM(Card_Category IS NULL) AS Card,
SUM(Credit_Limit IS NULL) AS CreditLimit,
SUM(Total_Trans_Amt IS NULL) AS TransactionAmount,
SUM(Total_Trans_Ct IS NULL) AS TransactionCount,
SUM(Avg_Utilization_Ratio IS NULL) AS Utilization
FROM customers;

-- Checking categories
SELECT Attrition_Flag, COUNT(*) AS Customers
FROM customers
GROUP BY Attrition_Flag;

SELECT Gender, COUNT(*) AS Customers
FROM customers
GROUP BY Gender;

SELECT Card_Category, COUNT(*) AS Customers
FROM customers
GROUP BY Card_Category;

SELECT Income_Category, COUNT(*) AS Customers
FROM customers
GROUP BY Income_Category;

SELECT Education_Level, COUNT(*) AS Customers
FROM customers
GROUP BY Education_Level;

SELECT Marital_Status, COUNT(*) AS Customers
FROM customers
GROUP BY Marital_Status;