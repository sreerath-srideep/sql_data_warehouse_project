/+
--------------------------------------
Create Database and Schemas
--------------------------------------
Script Purpose:
  This script creates new database named 'DataWarehouse' after checking whether it exists or not.
  If the database exists then it is dropped and recreated. Additionally the script also creates three schemas in the database
  bronze, silver & gold.

Warning:
  Running this scrpt would permenantly delete the database alomg with the data present in it.
  Proceed with caution and ensure that you have proper backups before running this script.
/+

USE master;
GO

--To drop and recreate database **DataWarehouse**
If EXIST (Select * FROM sys.databases WHERE name = 'DateWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

--To create **Datawarehouse** DATABASE
CREATE DATABASE DataWarehouse;
GO

--To create Schemas within the DATABASE
CREATE SCHEMA Bronze;
GO

CREATE SCHEMA Silver;
GO

CREATE SCHEMA Gold;
GO



