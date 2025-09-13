USE ROLE USERADMIN;


CREATE ROLE IF NOT EXISTS jobtech_team_role;

CREATE ROLE IF NOT EXISTS jobtech_dlt_role;      
CREATE ROLE IF NOT EXISTS jobtech_dbt_role;      
CREATE ROLE IF NOT EXISTS jobtech_streamlit_role; 


GRANT USAGE ON WAREHOUSE job_analysis_wh TO ROLE jobtech_team_role;
GRANT OPERATE ON WAREHOUSE job_analysis_wh TO ROLE jobtech_team_role;
GRANT MONITOR ON WAREHOUSE job_analysis_wh TO ROLE jobtech_team_role;

GRANT USAGE ON DATABASE Jobtech_analysis TO ROLE jobtech_team_role;
GRANT CREATE SCHEMA ON DATABASE Jobtech_analysis TO ROLE jobtech_team_role;



GRANT ALL ON SCHEMA Jobtech_analysis.staging TO ROLE jobtech_team_role;
GRANT ALL ON SCHEMA Jobtech_analysis.warehouse TO ROLE jobtech_team_role;
GRANT ALL ON SCHEMA Jobtech_analysis.mart TO ROLE jobtech_team_role;
GRANT ALL ON SCHEMA Jobtech_analysis.public TO ROLE jobtech_team_role;


GRANT ALL ON ALL TABLES IN DATABASE Jobtech_analysis TO ROLE jobtech_team_role;


GRANT ALL ON FUTURE TABLES IN DATABASE Jobtech_analysis TO ROLE jobtech_team_role;


GRANT USAGE ON WAREHOUSE job_analysis_wh TO ROLE jobtech_dlt_role;
GRANT USAGE ON DATABASE Jobtech_analysis TO ROLE jobtech_dlt_role;
GRANT CREATE SCHEMA ON DATABASE Jobtech_analysis TO ROLE jobtech_dlt_role;
GRANT ALL ON SCHEMA Jobtech_analysis.staging TO ROLE jobtech_dlt_role;
GRANT ALL ON FUTURE TABLES IN SCHEMA Jobtech_analysis.staging TO ROLE jobtech_dlt_role;


GRANT USAGE ON WAREHOUSE job_analysis_wh TO ROLE jobtech_dbt_role;
GRANT USAGE ON DATABASE Jobtech_analysis TO ROLE jobtech_dbt_role;
GRANT USAGE ON SCHEMA Jobtech_analysis.staging TO ROLE jobtech_dbt_role;
GRANT SELECT ON ALL TABLES IN SCHEMA Jobtech_analysis.staging TO ROLE jobtech_dbt_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA Jobtech_analysis.staging TO ROLE jobtech_dbt_role;
GRANT ALL ON SCHEMA Jobtech_analysis.warehouse TO ROLE jobtech_dbt_role;
GRANT ALL ON SCHEMA Jobtech_analysis.mart TO ROLE jobtech_dbt_role;
GRANT ALL ON FUTURE TABLES IN SCHEMA Jobtech_analysis.warehouse TO ROLE jobtech_dbt_role;
GRANT ALL ON FUTURE VIEWS IN SCHEMA Jobtech_analysis.warehouse TO ROLE jobtech_dbt_role;
GRANT ALL ON FUTURE TABLES IN SCHEMA Jobtech_analysis.mart TO ROLE jobtech_dbt_role;
GRANT ALL ON FUTURE VIEWS IN SCHEMA Jobtech_analysis.mart TO ROLE jobtech_dbt_role;
GRANT CREATE SCHEMA ON DATABASE Jobtech_analysis TO ROLE jobtech_dbt_role;


GRANT USAGE ON WAREHOUSE job_analysis_wh TO ROLE jobtech_streamlit_role;
GRANT USAGE ON DATABASE Jobtech_analysis TO ROLE jobtech_streamlit_role;
GRANT USAGE ON SCHEMA Jobtech_analysis.mart TO ROLE jobtech_streamlit_role;
GRANT SELECT ON ALL TABLES IN SCHEMA Jobtech_analysis.mart TO ROLE jobtech_streamlit_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA Jobtech_analysis.mart TO ROLE jobtech_streamlit_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA Jobtech_analysis.mart TO ROLE jobtech_streamlit_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA Jobtech_analysis.mart TO ROLE jobtech_streamlit_role;




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
USE DATABASE Jobtech_analysis;


USE ROLE SYSADMIN;
SHOW SCHEMAS IN DATABASE Jobtech_analysis;

SHOW TABLES IN SCHEMA Jobtech_analysis.STAGING;

SHOW ROLES;
SHOW USERS;

