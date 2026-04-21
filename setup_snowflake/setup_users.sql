USE ROLE USERADMIN;

CREATE USER IF NOT EXISTS jonathansnow
    PASSWORD = "Jonathansnow110"
    DEFAULT_WAREHOUSE = job_analysis_wh;
CREATE USER IF NOT EXISTS Abbefahmi
    PASSWORD = "1234"
    DEFAULT_WAREHOUSE = job_analysis_wh;
CREATE USER IF NOT EXISTS Abbeazeez
    PASSWORD = "1234"
    DEFAULT_WAREHOUSE = job_analysis_wh;
CREATE USER IF NOT EXISTS DLT_role
    PASSWORD = "1234"
    DEFAULT_WAREHOUSE = job_analysis_wh;
CREATE USER IF NOT EXISTS DBT_role
    PASSWORD = "1234"
    DEFAULT_WAREHOUSE = job_analysis_wh;
CREATE USER IF NOT EXISTS Streamlit_role
    PASSWORD = "1234"
    DEFAULT_WAREHOUSE = job_analysis_wh;

SHOW USERS;

