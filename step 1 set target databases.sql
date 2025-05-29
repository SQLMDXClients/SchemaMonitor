-- This code can be executed in the Snowflake Snowsight UI or in VS Code.

-- We make the assumption that the application is already installed
-- and the database is called SCHEMAMONITOR.

USE DATABASE SCHEMAMONITOR;

--------------------------------------------------------------------------------
--
-- Procedure Signature
--
-- _CODE.SNOWFLAKE_SET_TARGET_DATABASE(ORGANIZATION_NAME STRING, ACCOUNT_NAME STRING, FAMILY_NAME STRING, DATABASE_NAME STRING, ENVIRONMENT STRING, DEFAULT_PULL BOOLEAN)
--  ORGANIZATION_NAME - The name of the organization from Snowflake.
--  ACCOUNT_NAME - The name of the account from Snowflake.
--  FAMILY_NAME - The family name of the database.
--  DATABASE_NAME - The name of the database.
--  ENVIRONMENT - The environment of the database (DEV, UAT, PROD).
--  DEFAULT_PULL - If TRUE, the database will be included in the multi database pull
--                 in a future step.
--
--  This set of target databases are all related.  They all belong to the family SAMPLE_DATA
--  Different versions of the same database are used for different environments DEV, UAT, PROD.
--  Schema compare can compare the databases in the same family and tell you 
--  the differences between the databases.
--------------------------------------------------------------------------------

CALL _CODE.SNOWFLAKE_SET_TARGET_DATABASE(CURRENT_ORGANIZATION_NAME(), CURRENT_ACCOUNT_NAME(), 'SAMPLE_DATA', 'SAMPLE_DATA_DEV', 'DEV', TRUE);
CALL _CODE.SNOWFLAKE_SET_TARGET_DATABASE(CURRENT_ORGANIZATION_NAME(), CURRENT_ACCOUNT_NAME(), 'SAMPLE_DATA', 'SAMPLE_DATA_UAT', 'UAT', TRUE);
CALL _CODE.SNOWFLAKE_SET_TARGET_DATABASE(CURRENT_ORGANIZATION_NAME(), CURRENT_ACCOUNT_NAME(), 'SAMPLE_DATA', 'SAMPLE_DATA_PROD', 'PROD', TRUE);


-- SELECT FROM THIS VIEW TO SEE THE TARGET DATABASES
SELECT * FROM _METADATA.SNOWFLAKE_TARGET_DATABASES;