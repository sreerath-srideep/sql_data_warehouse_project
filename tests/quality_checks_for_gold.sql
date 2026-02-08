/+
==========================================================================================
QUALITY CHECKS
==========================================================================================
Script Purpose:
  This scripts ensures the integrity, consistency and accuracy of the Gold Layer.

Usage Notes:
  - Run this checks after data loading silver layer.
  - Investigate and resolve any issues found during checks.
===========================================================================================
+/  

-----------------------------------------------------------------------------------------
Subject: To check the uniquness of the customer_key in the gold.dim_customers.
Expectation: No results.
-----------------------------------------------------------------------------------------

SELECT
  customer_key,
  COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1

-----------------------------------------------------------------------------------------
Subject: To check for Foreign Key Integrity (Dimensions)
-----------------------------------------------------------------------------------------

SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
On c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL
