/+
==========================================================================================
QUALITY CHECKS
==========================================================================================
Script Purpose:
  This scripts ensures the integrity, consistency and accuracy of the Silver Layer.

Usage Notes:
  - Run this checks after data loading in bronze layer.
  - Investigate and resolve any issues found during checks.
===========================================================================================
+/  


===crm_cust_info Table===

-- To check duplicates or nulls in Primary Key
EXPECTATION : NO RESULT

SELECT cst_id, COUNT(*)
FROM silver.crm_cst_info
GROUP BY cst_id
HAVING COUNT(*) > 1 or cst_id IS NULL

-- Check for unwanted spaces
EXPECTATION : NO RESULT

SELECT cst_firstname
FROM silver.crm_cst_info
WHERE cst_key != TRIM(cst_key)

===crm_prd_info Table==

-- To check duplicates or nulls in Primary Key
EXPECTATION : NO RESULT

SELECT prd_id, COUNT(*)
FROM silver.crm_prd_info
GROUP BY cst_id
HAVING COUNT(*) > 1 or prd_id IS NULL

-- Data Standardization & Consistency

SELECT DISTINCT prd_line
FROM silver.crm_prd_info

-- To check for Negative or Nulls
EXPECTATION : NO RESULT

SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

-- To check for invalid Date Order

SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt

===crm_sales_details Table===

-- Check for Invalid Sales

SELECT sls_order_dt
FROM silver.crm_sales_details
WHERE sls_order_dt <= 0 
  OR LEN(sls_order_dt) != 8 
  OR sls_order_dt > 20500101 
  OR sls_order_dt < 19000101

-- Check Invalid Date Order

SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_order_dt > sls_due_dt

-- Check Data Consistency : Between Sales, Quantity and Price
-- Sales = Quantity * Price
-- Values must not be null, zero or negative

SELECT sls_quantity, sls_price, sls_sales
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
   OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sales_price, sls_quantity, sls_price

===erp_cust_az12===

-- To identify Out of Range Dates

SELECT DISTINCT bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

-- Data Standardization & Consistency

SELECT DISTINCT gen
FROM silver.erp_cust_az12

===erp_loc_a101===

-- Data Standardization & Consistency

SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry

===erp_px_cat_g1v2===

-- To Check for unwanted spaces

SELECT * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat)

-- Data Standardization & Consistency

SELECT DISTINCT cat
FROM silver.erp_px_cat_g1v2
