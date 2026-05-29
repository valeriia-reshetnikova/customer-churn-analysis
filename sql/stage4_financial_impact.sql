-- STAGE 4: FINANCIAL IMPACT ANALYSIS

-- Financial Impact 1: Global Revenue Loss
SELECT 
	SUM(monthlycharges) AS lost_monthly_revenue,
	SUM(totalcharges) AS lost_total_revenue
FROM churn_analysis
WHERE churn = 1;

-- Financial Impact 2: Fiber Optic segment
SELECT 
   	SUM(monthlycharges) AS lost_monthly_revenue,
	SUM(totalcharges) AS lost_total_revenue
FROM churn_analysis
WHERE churn = 1 AND internetservice = 'Fiber optic';

-- Financial Impact 3: No Tech Support segment
SELECT 
    	SUM(monthlycharges) AS lost_monthly_revenue,
		SUM(totalcharges) AS lost_total_revenue
FROM churn_analysis
WHERE churn = 1 AND techsupport = 'No';

-- Financial Impact 4: The Critical Intersection (Fiber Optic + No Tech Support)
SELECT 
    	SUM(monthlycharges) AS lost_monthly_revenue,
    	SUM(totalcharges) AS lost_total_revenue
FROM churn_analysis
WHERE churn = 1 AND techsupport = 'No'  AND internetservice = 'Fiber optic’;