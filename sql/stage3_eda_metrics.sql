-- STAGE 3: EXPLORATORY DATA ANALYSIS (EDA) & BASE CHURN METRICS

-- EDA 1: Global Churn Rate
SELECT 
 	COUNT(*) AS total_customers,
   	SUM(churn) AS churned_customers,
    ROUND(SUM(churn) * 100 / COUNT(*), 2) AS churned_percentage
FROM churn_analysis;

-- EDA 2: Churn by Contract Type
SELECT 
    	contract,
    	COUNT(*) AS total_customers,
		SUM(churn) AS churned_customers,
    	ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churned_percentage
FROM churn_analysis
GROUP BY contract;

-- EDA 3: Churn by Internet Service Type
SELECT 
    	internetservice,
    	COUNT(*) AS total_customers,
		SUM(churn) AS churned_customers,
    	ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churned_percentage,
    	AVG(monthlycharges) AS avg_monthly_charges
FROM churn_analysis
GROUP BY internetservice
ORDER BY churned_percentage DESC;

-- EDA 4: Churn by Tech Support
SELECT 
    	techsupport,
    	COUNT(*) AS total_customers,
		SUM(churn) AS churned_customers,
    	ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churned_percentage
FROM churn_analysis
GROUP BY techsupport
ORDER BY churned_percentage DESC;

-- EDA 5: Churn by Payment Method
SELECT 
    	paperlessbilling,
		paymentmethod,
    	COUNT(*) AS total_customers,
		SUM(churn) AS churned_customers,
    	ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churned_percentage
FROM churn_analysis
GROUP BY paperlessbilling, paymentmethod
ORDER BY churned_percentage DESC;

-- EDA 6: Churn by Senior Citizen Status
SELECT
	CASE
		WHEN seniorcitizen = 1 THEN ’Senior’
		ELSE ’Non-Senior’
	END AS customer_segment,
	COUNT(*) AS total_customers,
	SUM(churn) AS churned_customers,
	ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churned_percentage
FROM churn_analysis
GROUP BY seniorcitizen 
ORDER BY churned_percentage DESC;
