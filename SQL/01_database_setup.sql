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

CREATE DATABASE credit_card_analytics;

USE credit_card_analytics;

CREATE TABLE customers (
    CLIENTNUM BIGINT PRIMARY KEY,
    Attrition_Flag VARCHAR(30),
    Customer_Age INT,
    Gender VARCHAR(10),
    Dependent_count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(30),
    Income_Category VARCHAR(30),
    Card_Category VARCHAR(20),
    Months_on_book INT,
    Total_Relationship_Count INT,
    Months_Inactive_12_mon INT,
    Contacts_Count_12_mon INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Avg_Open_To_Buy DECIMAL(10,2),
    Total_Amt_Chng_Q4_Q1 DECIMAL(6,3),
    Total_Trans_Amt DECIMAL(10,2),
    Total_Trans_Ct INT,
    Total_Ct_Chng_Q4_Q1 DECIMAL(6,3),
    Avg_Utilization_Ratio DECIMAL(6,3),
    NB_Prediction_1 DOUBLE,
    NB_Prediction_2 DOUBLE
);

-- Update the file path below to match your local MySQL uploads directory.
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\BankChurners.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

ALTER TABLE customers
DROP COLUMN NB_Prediction_1,
DROP COLUMN NB_Prediction_2;