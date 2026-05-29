-- STAGE 5: Tenure and Cohort Analysis

-- Tenure 1: Churn Rate by Exact Month
SELECT 
    	tenure,
    	COUNT(*) AS total_customers,
		SUM(churn) AS churned_customers,
		ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churned_percentage 
FROM churn_analysis
GROUP BY tenure
ORDER BY churned_percentage DESC;

-- Tenure 2: Cohort Buckets
SELECT
		CASE
			WHEN tenure <= 3 THEN '01-03 Months (Critical)'
			WHEN tenure <= 12 THEN '04-12 Months (First Year)'
			WHEN tenure <= 36 THEN '13-36 Months (Stable)'
			ELSE '36+ Months (Loyal)'
		END AS tenure_group,
		COUNT(*) AS total_customers,
		SUM(churn) AS churned_customers,
		ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churned_percentage
FROM churn_analysis
GROUP BY tenure_group
ORDER BY MIN(tenure);
        		
-- Tenure 3: Financial Leak by Cohort
SELECT
		CASE
			WHEN tenure <= 3 THEN '01-03 Months (Critical)'
			WHEN tenure <= 12 THEN '04-12 Months (First Year)'
			WHEN tenure <= 36 THEN '13-36 Months (Stable)'
			ELSE '36+ Months (Loyal)'
		END AS tenure_group,
		COUNT(*) AS total_customers,
		SUM(monthlycharges) AS lost_monthly_revenue,
		SUM(totalcharges) AS lost_total_revenue
FROM churn_analysis
GROUP BY tenure_group
ORDER BY MIN(tenure);