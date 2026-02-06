
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

===========================================================================================================================
**Data Integration Model**
===========================================================================================================================

This image shows how different tables from the ERP system and CRM databases.

<img width="1969" height="1280" alt="Integration Model (Silver Layer) drawio" src="https://github.com/user-attachments/assets/58e6ef8e-262f-4e66-bc6d-9ce5e0cc662b" />

===========================================================================================================================
