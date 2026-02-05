
****Data Dictionary for Gold Layer****

**Overview**

This Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. It consists of 
dimension tables and fact tables for specific business needs.

---------------------------------------------------------------------------------------------------------------------------------------------
**1.gold.dim_customers**

*-Purpose:* Stores customers details.
*-Columns:*

| Column Name  | Data Type |     Description    |
| ------------ | --------- | ------------------ |
| customer_key | INT       | Surrogate key uniquely indentifying each customer recor in the dimension table. |
| customer_id  | INT       | Unique numerical identifier assigned to each customer. |
| customer_number | NVARCHAR(50) | Alphanumeric identifier representing the customer, used for tracking and referencing. |
| first_name | NVARCHAR(50) | Customers first name. |
| last_name | NVARCHAR(50) | Customers last name. |
| Country | NVARCHAR(50) | The country of residence for the customer (eg: 'Australia'). |
| marital_status | NVARCHAR(50) | The marital status of the customer. |
| gender | NVARCHAR(50) | The gender of the customer. |
| birthdate | DATE | The date of birth of the customer (ie: 'YYYY-MM-DD'). |
| create_date | DATE | The date and time when the customer reord was created in the system. |
