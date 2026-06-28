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

--1. Gender

SELECT
    Gender,
    COUNT(*) AS Total_Customers,
    SUM(CASE
            WHEN Attrition_Flag = 'Attrited Customer'
            THEN 1
            ELSE 0
        END) AS Attrited_Customers,
    ROUND(
        SUM(CASE
                WHEN Attrition_Flag = 'Attrited Customer'
                THEN 1
                ELSE 0
            END)
        *100.0/COUNT(*),2
    ) AS Attrition_Rate
FROM customers
GROUP BY Gender;

--2. Card_Category

SELECT
    Card_Category,
    COUNT(*) AS Total_Customers,
    SUM(CASE
            WHEN Attrition_Flag = 'Attrited Customer'
            THEN 1
            ELSE 0
        END) AS Attrited_Customers,
    ROUND(
        SUM(CASE
                WHEN Attrition_Flag = 'Attrited Customer'
                THEN 1
                ELSE 0
            END)
        *100.0/COUNT(*),2
    ) AS Attrition_Rate
FROM customers
GROUP BY Card_Category;

--3. Income_Category

SELECT
    Income_Category,
    COUNT(*) AS Total_Customers,
    SUM(CASE
            WHEN Attrition_Flag = 'Attrited Customer'
            THEN 1
            ELSE 0
        END) AS Attrited_Customers,
    ROUND(
        SUM(CASE
                WHEN Attrition_Flag = 'Attrited Customer'
                THEN 1
                ELSE 0
            END)
        *100.0/COUNT(*),2
    ) AS Attrition_Rate
FROM customers
GROUP BY Income_Category;

--4. Education_Level

SELECT
    Education_Level,
    COUNT(*) AS Total_Customers,
    SUM(CASE
            WHEN Attrition_Flag = 'Attrited Customer'
            THEN 1
            ELSE 0
        END) AS Attrited_Customers,
    ROUND(
        SUM(CASE
                WHEN Attrition_Flag = 'Attrited Customer'
                THEN 1
                ELSE 0
            END)
        *100.0/COUNT(*),2
    ) AS Attrition_Rate
FROM customers
GROUP BY Education_Level;


--5. Contacts made to customer support count in 12 months

SELECT
    Contacts_Count_12_mon,
    COUNT(*) AS Total_Customers,
    SUM(CASE
            WHEN Attrition_Flag = 'Attrited Customer'
            THEN 1
            ELSE 0
        END) AS Attrited_Customers,
    ROUND(
        SUM(CASE
                WHEN Attrition_Flag = 'Attrited Customer'
                THEN 1
                ELSE 0
            END)
        *100.0/COUNT(*),2
    ) AS Attrition_Rate
FROM customers
GROUP BY Contacts_Count_12_mon;

--6. Months card has been inactive for

SELECT
    Months_Inactive_12_mon,
    COUNT(*) AS Total_Customers,
    SUM(CASE
            WHEN Attrition_Flag = 'Attrited Customer'
            THEN 1
            ELSE 0
        END) AS Attrited_Customers,
    ROUND(
        SUM(CASE
                WHEN Attrition_Flag = 'Attrited Customer'
                THEN 1
                ELSE 0
            END)
        *100.0/COUNT(*),2
    ) AS Attrition_Rate
FROM customers
GROUP BY Months_Inactive_12_mon;

--7. How many bank products the customer has
SELECT
    Total_Relationship_Count,
    COUNT(*) AS Total_Customers,
    SUM(CASE
            WHEN Attrition_Flag = 'Attrited Customer'
            THEN 1
            ELSE 0
        END) AS Attrited_Customers,
    ROUND(
        SUM(CASE
                WHEN Attrition_Flag = 'Attrited Customer'
                THEN 1
                ELSE 0
            END)
        *100.0/COUNT(*),2
    ) AS Attrition_Rate
FROM customers
GROUP BY Total_Relationship_Count;




--Do attrited customers spend less than existing customers?

SELECT
    Attrition_Flag,
    COUNT(*) AS Customers,
    ROUND(AVG(Total_Trans_Amt),2) AS Avg_Transaction_Amount,
    ROUND(AVG(Total_Trans_Ct),2) AS Avg_Transaction_Count
FROM customers
GROUP BY Attrition_Flag;

--Do attrited customers have lower credit utilization?

SELECT
    Attrition_Flag,
    ROUND(AVG(Avg_Utilization_Ratio),3) AS Avg_Utilization,
    ROUND(AVG(Credit_Limit),2) AS Avg_Credit_Limit,
    ROUND(AVG(Total_Revolving_Bal),2) AS Avg_Revolving_Balance
FROM customers
GROUP BY Attrition_Flag;

-- Which age group customers attrite the most

SELECT
CASE
    WHEN Customer_Age BETWEEN 20 AND 30 THEN '20-30'
    WHEN Customer_Age BETWEEN 31 AND 40 THEN '31-40'
    WHEN Customer_Age BETWEEN 41 AND 50 THEN '41-50'
    WHEN Customer_Age BETWEEN 51 AND 60 THEN '51-60'
    ELSE '60+'
END AS Age_Group,

COUNT(*) AS Total_Customers,

SUM(Attrition_Flag='Attrited Customer') AS Attrited_Customers,

ROUND(
100*SUM(Attrition_Flag='Attrited Customer')/COUNT(*),
2
) AS Attrition_Rate

FROM customers

GROUP BY Age_Group

ORDER BY Age_Group;

-- Which card category generates the most business?

SELECT
Card_Category,

COUNT(*) Customers,

ROUND(AVG(Total_Trans_Amt),2) Avg_Transaction,

ROUND(AVG(Total_Trans_Ct),2) Avg_Transactions,

ROUND(AVG(Credit_Limit),2) Avg_Credit_Limit

FROM customers

GROUP BY Card_Category

ORDER BY Avg_Transaction DESC;

-- Which income group generates the most transaction amount?

SELECT
    Income_Category,
    ROUND(AVG(Total_Trans_Amt),2) AS Avg_Transaction,
    ROUND(SUM(Total_Trans_Amt),2) AS Total_Transaction
FROM customers
GROUP BY Income_Category
ORDER BY Total_Transaction DESC;

-- Which age group spends the most?
SELECT
    CASE
        WHEN Customer_Age BETWEEN 20 AND 30 THEN '20-30'
        WHEN Customer_Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Customer_Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Customer_Age BETWEEN 51 AND 60 THEN '51-60'
        ELSE '60+'
    END AS Age_Group,
    ROUND(AVG(Total_Trans_Amt),2) AS Avg_Transaction,
    ROUND(SUM(Total_Trans_Amt),2) AS Total_Transaction
FROM customers
GROUP BY Age_Group
ORDER BY Total_Transaction DESC;

-- Correlation between utilization and transaction amount.

SELECT
    CASE
        WHEN Avg_Utilization_Ratio BETWEEN 0.00 AND 0.20 THEN '0-20%'
        WHEN Avg_Utilization_Ratio BETWEEN 0.20 AND 0.40 THEN '20-40%'
        WHEN Avg_Utilization_Ratio BETWEEN 0.40 AND 0.60 THEN '40-60%'
        WHEN Avg_Utilization_Ratio BETWEEN 0.60 AND 0.80 THEN '60-80%'
        WHEN Avg_Utilization_Ratio BETWEEN 0.80 AND 1.00 THEN '80-100%'
    END AS Utilization_Bucket,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Total_Trans_Amt), 2) AS Avg_Transaction_Amount,
    ROUND(AVG(Total_Trans_Ct), 2) AS Avg_Transaction_Count,
    SUM(CASE
            WHEN Attrition_Flag = 'Attrited Customer'
            THEN 1 ELSE 0
        END) AS Attrited_Customers,
    ROUND(
        SUM(CASE
                WHEN Attrition_Flag = 'Attrited Customer'
                THEN 1 ELSE 0
            END) * 100.0 / COUNT(*), 2
    ) AS Attrition_Rate
FROM customers
GROUP BY Utilization_Bucket
ORDER BY Utilization_Bucket;