SELECT * FROM _REPORTS.SNOWFLAKE_REPORTS;
SELECT * FROM _REPORTS.SNOWFLAKE_REPORT_OBJECTS;
SELECT * FROM _REPORTS.SNOWFLAKE_REPORT_OBJECT_DETAILS;
SELECT * FROM _REPORTS.SNOWFLAKE_REPORTS_STATISTICS;



SELECT *
FROM _REPORTS.SNOWFLAKE_REPORTS R
JOIN _REPORTS.SNOWFLAKE_REPORT_OBJECTS O ON O.REPORT_ID = R.REPORT_ID
JOIN _REPORTS.SNOWFLAKE_REPORT_OBJECT_DETAILS D ON D.REPORT_OBJECT_ID = O.REPORT_OBJECT_ID
WHERE REPORT_ID = '00000000-0000-0000-0000-000000000001';