
-- This code can be executed in the Snowflake Snowsight UI or in VS Code.

-- We make the assumption that the application is already installed
-- and the database is called SCHEMAMONITOR.

USE DATABASE SCHEMAMONITOR;

-- There are 3 types of execution:

-- https://sqlmdx.com/SchemaMonitor/SchemaMonitorVersions

-- 1. BASIC - The application monitors basic parameters of the database.
-- 2. STANDARD - The application monitors standard parameters of the database.
-- 3. EXTENDED - The application monitors extended parameters of the database.

-- 4*. TRIAL - The application monitors extended parameters of the database for a trial period.


-- Following the documentation the APP_ADMIN ROLE can authorize the application 
-- using the general authorization.  This means that the APP_USER ROLE can choose
-- any database to monitor.  

-- This procedure authorizes the application to use a database for a specific execution type.

-- _CODE.APP_AUTHORIZE_DATABASE(EXECUTION_TYPE STRING, DATABASE_NAME STRING, SIGNATURE STRING)

-- In this example we will authorize the application for the STANDARD execution type
-- allowing 3 databases to be monitored.  Change your signature accordingly.
CALL _CODE.APP_AUTHORIZE_GENERAL('STANDARD', 3, '<<SIGNATURE>>');


-- Alternatively you can authorize the application for a specific database
-- allowing the application to monitor only that database.  In this case 
-- the ADMIN will authorize a TRIAL execution type for the application
-- on each of the three databases.  If someone tries to monitor a database
-- that is not authorized, the application will not allow it.

CALL _CODE.APP_AUTHORIZE_DATABASE('TRIAL', '<<DATABASE NAME>>', '<<SIGNATURE>>');


-- The authorization remains in effect until you revoke the authorization.
-- After the subscription exires if the database remains authorized the application
-- will request a new token and generate a new billing event.



-- Prior to running Schema Monitor you can check if the application
-- is authorized to monitor the database.  This will return TRUE if the application
-- is authorized for the database and FALSE if it is not authorized.

CALL _CODE.APP_IS_TOKEN_AVAILABLE('SNOWFLAKE', 'STANDARD', '<<DATABASE NAME>>');
