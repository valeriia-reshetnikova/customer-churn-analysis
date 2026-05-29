-- STAGE 2: DATA QUALITY VALIDATION

-- DQ Check 1: Duplicates
SELECT
	COUNT(*) AS total_rows,
 	COUNT(DISTINCT customerid) AS unique_customers
FROM churn_analysis;

-- DQ Check 2: Missing Values in Totalcharges
SELECT
	customerid, tenure, monthlycharges, totalcharges
FROM churn_analysis
WHERE totalcharges IS NULL;

--DQ Check 3: Business Logic Consistency Check
SELECT
	COUNT(*) AS anomaly_count
FROM churn_analysis
WHERE tenure = 0 AND totalcharges > 0;
