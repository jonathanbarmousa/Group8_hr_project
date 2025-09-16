USE DATABASE project_hr;
USE SCHEMA staging;

WITH src_job_details AS (
    SELECT * FROM dim_job_details
)

SELECT
    
    md5(coalesce(cast(headline as string), '')) as job_details_id,
    headline,
    description,
    employment_type,
    duration,
    salary_type
FROM src_job_details;
