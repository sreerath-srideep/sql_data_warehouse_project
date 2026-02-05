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
Subject: To check whether the tables connect with each other.
Expectation: No results. 
-----------------------------------------------------------------------------------------

select * 
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key = f.customer_key
left join gold.dim_products p
on p.product_key = f.product_key
where p.product_key is null
