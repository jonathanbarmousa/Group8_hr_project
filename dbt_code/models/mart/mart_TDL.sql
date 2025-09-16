USE DATABASE project_hr;
USE SCHEMA staging;

WITH 
    fct_table AS (SELECT * FROM fct_job_ads),
    dim_employer AS (SELECT * FROM dim_employer),
    dim_auxiliary AS (SELECT * FROM dim_auxiliary_attributes),
    dim_job_details AS (SELECT * FROM dim_job_details),
    dim_occupation AS (SELECT * FROM dim_occupation)

SELECT
    docc.occupation,
    docc.occupation_field,
    docc.occupation_group,
    dj.headline,
    dj.description,
    dj.employment_type,
    dj.duration,
    dj.salary_type,
    da.experience_required,
    da.access_to_own_car,
    da.driving_license_required,
    de.employer_name,
    de.employer_workplace,
    de.workplace_city,
    de.workplace_region,
    de.workplace_country,
    ft.vacancies,
    ft.application_deadline
FROM fct_table ft
LEFT JOIN dim_employer de ON de.employer_id = ft.employer_id
LEFT JOIN dim_auxiliary da ON da.aux_attribute_id = ft.aux_attribute_id
LEFT JOIN dim_job_details dj ON dj.job_details_id = ft.job_details_id
LEFT JOIN dim_occupation docc ON docc.occupation = ft.occupation
WHERE docc.occupation_field = 'Transport, distribution, lager';
