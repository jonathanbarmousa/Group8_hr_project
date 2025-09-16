USE ROLE USERADMIN;


CREATE ROLE IF NOT EXISTS jobtech_team_role;
CREATE ROLE IF NOT EXISTS jobtech_dlt_role;      
CREATE ROLE IF NOT EXISTS jobtech_dbt_role;      
CREATE ROLE IF NOT EXISTS jobtech_streamlit_role; 

GRANT USAGE ON WAREHOUSE g8 TO ROLE jobtech_team_role;
GRANT OPERATE ON WAREHOUSE g8 TO ROLE jobtech_team_role;
GRANT MONITOR ON WAREHOUSE g8 TO ROLE jobtech_team_role;

GRANT USAGE ON DATABASE project_hr TO ROLE jobtech_team_role;
GRANT CREATE SCHEMA ON DATABASE project_hr TO ROLE jobtech_team_role;

GRANT ALL ON SCHEMA project_hr.staging TO ROLE jobtech_team_role;
GRANT ALL ON SCHEMA project_hr.warehouse TO ROLE jobtech_team_role;
GRANT ALL ON SCHEMA project_hr.mart TO ROLE jobtech_team_role;
GRANT ALL ON SCHEMA project_hr.public TO ROLE jobtech_team_role;

GRANT ALL ON ALL TABLES IN DATABASE project_hr TO ROLE jobtech_team_role;
GRANT ALL ON FUTURE TABLES IN DATABASE project_hr TO ROLE jobtech_team_role;

GRANT USAGE ON WAREHOUSE g8 TO ROLE jobtech_dlt_role;
GRANT USAGE ON DATABASE project_hr TO ROLE jobtech_dlt_role;
GRANT CREATE SCHEMA ON DATABASE project_hr TO ROLE jobtech_dlt_role;
GRANT ALL ON SCHEMA project_hr.staging TO ROLE jobtech_dlt_role;
GRANT ALL ON FUTURE TABLES IN SCHEMA project_hr.staging TO ROLE jobtech_dlt_role;

GRANT USAGE ON WAREHOUSE g8 TO ROLE jobtech_dbt_role;
GRANT USAGE ON DATABASE project_hr TO ROLE jobtech_dbt_role;
GRANT USAGE ON SCHEMA project_hr.staging TO ROLE jobtech_dbt_role;
GRANT SELECT ON ALL TABLES IN SCHEMA project_hr.staging TO ROLE jobtech_dbt_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA project_hr.staging TO ROLE jobtech_dbt_role;
GRANT ALL ON SCHEMA project_hr.warehouse TO ROLE jobtech_dbt_role;
GRANT ALL ON SCHEMA project_hr.mart TO ROLE jobtech_dbt_role;
GRANT ALL ON FUTURE TABLES IN SCHEMA project_hr.warehouse TO ROLE jobtech_dbt_role;
GRANT ALL ON FUTURE VIEWS IN SCHEMA project_hr.warehouse TO ROLE jobtech_dbt_role;
GRANT ALL ON FUTURE TABLES IN SCHEMA project_hr.mart TO ROLE jobtech_dbt_role;
GRANT ALL ON FUTURE VIEWS IN SCHEMA project_hr.mart TO ROLE jobtech_dbt_role;
GRANT CREATE SCHEMA ON DATABASE project_hr TO ROLE jobtech_dbt_role;

GRANT USAGE ON WAREHOUSE g8 TO ROLE jobtech_streamlit_role;
GRANT USAGE ON DATABASE project_hr TO ROLE jobtech_streamlit_role;
GRANT USAGE ON SCHEMA project_hr.mart TO ROLE jobtech_streamlit_role;
GRANT SELECT ON ALL TABLES IN SCHEMA project_hr.mart TO ROLE jobtech_streamlit_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA project_hr.mart TO ROLE jobtech_streamlit_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA project_hr.mart TO ROLE jobtech_streamlit_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA project_hr.mart TO ROLE jobtech_streamlit_role;

GRANT ROLE jobtech_team_role TO USER JONATHANBARMOUSA;
GRANT ROLE jobtech_team_role TO USER JONATHAN_USER;
GRANT ROLE jobtech_team_role TO USER ABBEFAHMI_USER;
GRANT ROLE jobtech_team_role TO USER ABBEAZEEZ_USER;
GRANT ROLE jobtech_dlt_role TO USER DLT_role;
GRANT ROLE jobtech_dbt_role TO USER DBT_role;
GRANT ROLE jobtech_streamlit_role TO USER Streamlit_role;

ALTER USER JONATHANBARMOUSA SET DEFAULT_ROLE = 'jobtech_team_role';
ALTER USER JONATHAN_USER SET DEFAULT_ROLE = 'jobtech_team_role';
ALTER USER ABBEFAHMI_USER SET DEFAULT_ROLE = 'jobtech_team_role';
ALTER USER ABBEAZEEZ_USER SET DEFAULT_ROLE = 'jobtech_team_role';
ALTER USER DLT_role SET DEFAULT_ROLE = 'jobtech_dlt_role';
ALTER USER DBT_role SET DEFAULT_ROLE = 'jobtech_dbt_role';
ALTER USER Streamlit_role SET DEFAULT_ROLE = 'jobtech_streamlit_role';

USE ROLE SYSADMIN;
USE DATABASE project_hr;

USE ROLE SYSADMIN;
SHOW SCHEMAS IN DATABASE project_hr;

SHOW TABLES IN SCHEMA project_hr.STAGING;


SHOW GRANTS TO USER JONATHANBARMOUSA;
SHOW GRANTS TO USER JONATHAN_USER;