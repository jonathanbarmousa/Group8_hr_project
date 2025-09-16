USE DATABASE project_hr;
USE SCHEMA staging;

DESC TABLE dim_employer;

SELECT 
    md5(coalesce(cast(employer_name as string), '')) as employer_id,
    employer_name,
    employer_workplace,
    workplace_city,
    workplace_region,
    workplace_country
FROM dim_employer;
