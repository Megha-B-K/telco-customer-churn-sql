CREATE DATABASE CustomerChurnAnalysis;

USE CustomerChurnAnalysis;

SELECT *
FROM [dbo].[Telco-Customer-Churn];

SELECT COUNT(*) AS total_customers
FROM [dbo].[Telco-Customer-Churn];

SELECT Churn, COUNT(*) AS customers
FROM [dbo].[Telco-Customer-Churn]
GROUP BY Churn;

-- Identify missing TotalCharges
SELECT *
FROM [dbo].[Telco-Customer-Churn]
WHERE TotalCharges IS NULL;

-- Data cleaning
UPDATE [dbo].[Telco-Customer-Churn]
SET TotalCharges = 0
WHERE TotalCharges IS NULL;

-- Churn by Gender
SELECT gender, Churn, COUNT(*) AS customers
FROM [dbo].[Telco-Customer-Churn]
GROUP BY gender, Churn
ORDER BY gender;

-- Churn by Senior Citizen
SELECT SeniorCitizen, Churn, COUNT(*) AS customers
FROM [dbo].[Telco-Customer-Churn]
GROUP BY SeniorCitizen, Churn;

-- Average Monthly Charges by Contract
SELECT Contract, AVG(MonthlyCharges) AS avg_monthly_charge
FROM [dbo].[Telco-Customer-Churn]
GROUP BY Contract;

-- Customers by Internet Service
SELECT InternetService, COUNT(*) AS customers
FROM [dbo].[Telco-Customer-Churn]
GROUP BY InternetService;

-- Churn by Internet Service
SELECT InternetService, Churn, COUNT(*) AS customers
FROM [dbo].[Telco-Customer-Churn]
GROUP BY InternetService, Churn
ORDER BY InternetService;

-- Customer Segmentation by Tenure
SELECT 
CASE 
WHEN tenure < 12 THEN 'New Customers'
WHEN tenure BETWEEN 12 AND 36 THEN 'Mid-Term Customers'
ELSE 'Long-Term Customers'
END AS customer_segment,
COUNT(*) AS customers
FROM [dbo].[Telco-Customer-Churn]
GROUP BY 
CASE 
WHEN tenure < 12 THEN 'New Customers'
WHEN tenure BETWEEN 12 AND 36 THEN 'Mid-Term Customers'
ELSE 'Long-Term Customers'
END;

-- Revenue by Payment Method
SELECT PaymentMethod, SUM(MonthlyCharges) AS total_revenue
FROM [dbo].[Telco-Customer-Churn]
GROUP BY PaymentMethod
ORDER BY total_revenue DESC;

--This shows top revenue customers
SELECT TOP 10 customerID, TotalCharges
FROM [dbo].[Telco-Customer-Churn]
ORDER BY TotalCharges DESC;