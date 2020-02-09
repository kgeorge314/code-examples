-- File Name : ./path2initsqlfiles/master/create-db.sql
--       
-- Create a database named `Datawarehouse` and set it to `SIMPLE` recovery model.

DECLARE @DySQL NVARCHAR(MAX) 
DECLARE @DatabaseName sysname ='Datawarehouse'


IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = @DatabaseName)
    BEGIN
        SET @DySQL = 'CREATE DATABASE '+QUOTENAME(@DatabaseName)
        EXEC (@DySQL)
    END

SET @DySQL = 'ALTER DATABASE '+QUOTENAME(@DatabaseName) + ' SET RECOVERY SIMPLE '

IF EXISTS (SELECT * FROM sys.databases WHERE name = @DatabaseName)
    EXEC (@DySQL)

--
-- Disclaimer: This is NOT a recommended or correct way 
--             to create a database, please use an appropriate
--             method for your environment.

