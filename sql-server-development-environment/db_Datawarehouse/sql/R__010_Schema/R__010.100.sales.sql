IF SCHEMA_ID('sales') IS NULL
	EXEC ('CREATE SCHEMA [sales] AUTHORIZATION dbo'); 
