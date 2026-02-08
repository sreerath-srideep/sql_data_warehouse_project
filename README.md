**Data Warehouse and Analytics Project🌟**

Welcome to the Data Warehouse and Analytics Project repository!💫
This project provides a detailed insight about data warehousing and analytics solution from scratch. From building a data warehouse to generating useful insights. It showcases the industry best practices used in data engineering and analytics.

**👉Important Links & Tools.**

- [Datasets](https://github.com/sreerath-srideep/sql_data_warehouse_project/blob/main/files/datasets): Access to the project dataset  (csv files).
- [SQL Server Express](https://www.microsoft.com/sql-server/sql-server-downloads): Lightweight server for hosting your database.
- [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/ssms/install/install?redirectedfrom=MSDN): GUI for managing and interacting with datasets.
- [Git Repository](https://github.com/): Set up Github account and repository to manage, version and collaborate on your code efficiently.
- [Draw.io](https://app.diagrams.net/): Design data architecture, models and diagrams.
- [Notion](https://www.notion.so/): All-in-one tool for project management and organization.  

**⭐Project Requirements**

**Building a Data Warehouse**

Develop a modern data warehouse using SQL Server to consolidate sales data enabling analytical reporting and informed decision making.

**Specifications**

- Data Sources: Import data from two sources (ERP and CRM) provides as CSV files.
- Data Quality: Cleanse and resolve data quality issues prior to analysis.
- Integration: Combine both sources into a single user friendly data model designed for analytical queries.
- Scope: Focus on the latest dataset only (Historization of data is not required).
- Documentation: Provide clear documentation of the data model to support both business stakeholders and analytical teams

**Analysing and Reporting**

Develop a SQL based analytics to deliver detailed insights into:

- Customer Behavior
- Product Performance
- Sales Trends

These insights will enable stakeholders to take best decision...

**🏗️ Data Warehouse Design Architecture**

This diagram provides an overview of the end-to-end data pipeline — from source systems to final consumers — structured into layered stages for clarity and scalability

<img width="2345" height="1203" alt="Medallion Approach Diagram drawio" src="https://github.com/user-attachments/assets/56accbd2-48be-41cf-bb6a-7bc54ddd890e" />

📂 Sources
- CRM

- ERP

- CSV Files (stored in folders)

🥉 Bronze Layer (Raw Data)

- Object Type: Tables

- Load: Batch Processing, Full Load, Truncate & Insert

- Transformations: None (as-is ingestion)

- Data Model: None

🥈 Silver Layer (Cleaned & Standardized Data)

- Object Type: Tables

- Load: Batch Processing, Full Load, Truncate & Insert

- Transformations: Data Cleaning, Standardization, Normalization, Derived Columns, Enrichment

- Data Model: None

🥇 Gold Layer (Business-Ready Data)

- Object Type: Tables

- Load: No additional load (curated layer)

- Transformations: Data Integration, Aggregation, Business Logic

- Data Model: Star Schema, Flat Tables, Aggregated Tables

👥 Consumers

- BI & Reporting

- Ad-Hoc SQL Queries

- Machine Learning

🎯 Purpose

- This architecture ensures:

- Traceability in Bronze (raw data)

- Consistency in Silver (cleaned data)

- Business value in Gold (analytics-ready data)

**🪪License**

This project is licensed under [MIT License](MIT). Therefore you are free to makes changes and share the project.
