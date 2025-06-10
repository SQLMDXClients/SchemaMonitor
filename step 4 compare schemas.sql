-- Schema Monitor has several procedures to compare schemas.  Please see the
-- documentation for more information on the differences between these procedures.

-- The assumption will have been made that step 3 push multiple databases has been 
-- completed several times over a period of time.   We will compare database to
-- themselves to see what has changed over that time.   We will also compare 
-- different databases in a family to make sure that they are in sync.

-- This will be our base procedure for comparing schemas.

-- _CODE.SCHEMA_COMPARE( BASE_DATABASE_NAME STRING, BASE_SCHEMA_DATE TIMESTAMP_TZ,
--                      TARGET_DATABASE_NAME STRING, TARGET_SCHEMA_DATE TIMESTAMP_TZ,
--                      DEBUG_TO_LOG BOOLEAN DEFAULT FALSE)

--    FAMILY_NAME        DATABASE_NAME     ENVIRONMENT
--    SAMPLE_DATA       SAMPLE_DATA_DEV       DEV
--    SAMPLE_DATA       SAMPLE_DATA_UAT       UAT
--    SAMPLE_DATA       SAMPLE_DATA_PROD      PROD


-- What objects changed in SAMPLE_DATA_DEV between 2024-05-01 and 2024-05-10?
CALL _CODE.SCHEMA_COMPARE(<<YOUR DATABASE NAME>>, '2024-05-01 00:00:00', <<YOUR DATABASE NAME>>, '2024-05-10 00:00:00', FALSE);


-- Compare SAMPLE_DATA_DEV and SAMPLE_DATA_UAT on 2024-05-10?
CALL _CODE.SCHEMA_COMPARE(<<YOUR DATABASE NAME>>, '2024-05-10 00:00:00', <<YOUR DATABASE NAME>>, '2024-05-10 00:00:00', FALSE);


-- Record the Report ID that is returned from the procedure.  You will need it to get the details.
