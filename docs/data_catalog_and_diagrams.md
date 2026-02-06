
****Data Dictionary for Gold Layer****

**Overview**

This Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. It consists of 
dimension tables and fact tables for specific business needs.

---------------------------------------------------------------------------------------------------------------------------------------------
**1.gold.dim_customers**

*-Purpose: Stores customers details.*


| Column Name  | Data Type |     Description    |
| ------------ | --------- | ------------------ |
| customer_key | INT       | Surrogate key uniquely indentifying each customer record in the dimension table. |
| customer_id  | INT       | Unique numerical identifier assigned to each customer. |
| customer_number | NVARCHAR(50) | Alphanumeric identifier representing the customer, used for tracking and referencing. |
| first_name | NVARCHAR(50) | Customers first name. |
| last_name | NVARCHAR(50) | Customers last name. |
| Country | NVARCHAR(50) | The country of residence for the customer (eg: 'Australia'). |
| marital_status | NVARCHAR(50) | The marital status of the customer. |
| gender | NVARCHAR(50) | The gender of the customer. |
| birthdate | DATE | The date of birth of the customer (ie: 'YYYY-MM-DD'). |
| create_date | DATE | The date and time when the customer record was created in the system. |

**2.gold.dim_products**

*-Purpose: Provides information about the products.*


| Column Name  | Data Type |     Description    |
| ------------ | --------- | ------------------ |
| product_key | INT | Surrogate key uniquely identifying each product record in the product dimension table. |
| product_id | INT | A unique identifier for tracking and recording products. |
| product_number | NVARCHAR(50) | A structured alphanumeric code representing the product, often used for categorization. |
| product_name | NVARCHAR(50) | Descriptive name of the product. |
| category_id | NVARCHAR(50) | A unique identifier for the product's category |
| category | NVARCHAR(50) | Broader classifaction of the product. |
| sub_category | NVARCHAR(50) | A more detailed information about the product within the category. |
| maintenance | NVARCHAR(50) | Indicates whether the product requires maintenance. |
| cost | INT | The base price of the product. |
| product_line | NVARCHAR(50) | The specific product line or series to which the product belongs. |
| start_date | DATE | The date when the product became available for sale or use, stored in. |

**3.gold.fact_sales**

*-Purpose: Stores transactional data for analytical purpose.*


| Column Name  | Data Type |     Description    |
| ------------ | --------- | ------------------ |
| order_number | NVARCHAR(50) | A unique alphanumeric identifier for each sales order. |
| product_key | INT | Surrogate key linking the order to the product dimension table. |
| customer_key | INT | Surrogate key linking the order to the customer dimension table. |
| order_date | DATE | The date when the order was placed. |
| shipping_date | DATE | The date when the order was shipped to the customer. |
| due_date | DATE | The date when the order payment was due. |
| sales_amount | INT | The total monetary value of the sale for the line item. |
| quantity | INT | The number of units of the product ordered for the line item. |
| price | INT | The price per unit of the product for the line item. |

============================================================================================

**Data Flow Diagram (ETL Pipeline)**

============================================================================================

This diagram represents the data pipeline architecture from source systems to the final curated Data Warehouse tables.
It highlights the Bronze → Silver → Gold layered approach commonly used in modern data engineering

<img width="1604" height="1144" alt="Data Flow Diagram drawio" src="https://github.com/user-attachments/assets/a49350aa-b54a-48a5-a82f-ffc7c0eaa773" />

📂 Sources

- CRM (Sales, Product, Customer data)
- ERP (Customer location, Customer info, Product categories)

🥉 Bronze Layer (Raw Data)

- crm_sales_details
- crm_prd_info
- crm_cust_info

- erp_cust_az12
- erp_loc_a101
- erp_px_cat_g1v2

🥈 Silver Layer (Cleaned & Transformed Data)

- crm_sales_details (multiple transformations/joins)
- erp_cust_az12
- erp_loc_a101

🥇 Gold Layer (Curated Data for Analytics)

- fact_sales
- dim_customers
- dim_products

🎯 Purpose

This layered design ensures:

- Bronze → Raw ingestion for traceability
- Silver → Standardized, cleaned data for consistency
- Gold → Business-ready tables for BI dashboards and reporting

============================================================================================

**Data Integration Model (CRM - ERP)**

============================================================================================

This diagram illustrates how CRM and ERP systems are connected through shared keys, enabling smooth data flow across platforms.

<img width="1969" height="1280" alt="Integration Model (Silver Layer) drawio" src="https://github.com/user-attachments/assets/58e6ef8e-262f-4e66-bc6d-9ce5e0cc662b" />

📂 CRM Tables
*- SALES*

sales_info, sls_prd_key, sls_cust_id

*- PRODUCT*

prd_info, prd_id

*- CUSTOMER*

cust_info, cst_id, cst_key

📂 ERP Tables

*- PRODUCT*

px_cat_g1v2, id

*- CUSTOMER (Location)*

loc_a101, cid

*- CUSTOMER (Information)*

cust_az12, cid

🔑 Integration Points

- CRM prd_id → ERP id

- CRM cst_id → ERP cid

🎯 Purpose

This integration model shows how sales, product, and customer data from CRM can be aligned with ERP records to support:

- Unified reporting
- Consistent customer information
- Streamlined product management

============================================================================================

**Data Mart**

============================================================================================

This diagram demonstrates a sales-focused Data Mart using a Star Schema design.
The schema is built to enable efficient analytical queries and reporting.

<img width="1626" height="1106" alt="Data Mart drawio" src="https://github.com/user-attachments/assets/ad9744ce-16a7-4363-b9c8-bd771e193ec2" />


**⚡ Schema Overview**
*Fact Table:* gold_fact_sales  
Contains transactional data such as order details, quantity, price, and calculated sales amount.

- Foreign keys link to customer and product dimensions.

- Sales calculation: Sales = Quantity × Price.

*Dimension Table:* gold_dim_customers  
Stores customer attributes including name, country, demographics, and identifiers.

*Dimension Table:* gold_dim_products  
Holds product details such as category, sub-category, cost, and product line.

**🎯 Purpose**

This schema supports analysis of:

-Customer behavior
-Product performance
-Sales trends
