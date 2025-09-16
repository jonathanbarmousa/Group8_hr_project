USE DATABASE project_hr;
USE SCHEMA staging;

WITH 
    fct AS (SELECT * FROM fct_job_ads),
    emp AS (SELECT * FROM dim_employer),
    aux AS (SELECT * FROM dim_auxiliary_attributes),
    job AS (SELECT * FROM dim_job_details),
    occ AS (SELECT * FROM dim_occupation)

SELECT
    occ.occupation,
    occ.occupation_field,
    occ.occupation_group,
    job.headline,
    job.description,
    job.employment_type,
    job.duration,
    job.salary_type,
    aux.experience_required,
    aux.access_to_own_car,
    aux.driving_license_required,
    emp.employer_name,
    emp.employer_workplace,
    emp.workplace_city,
    emp.workplace_region,
    emp.workplace_country,
    fct.vacancies,
    fct.application_deadline
FROM fct
LEFT JOIN emp ON emp.employer_id = fct.employer_id
LEFT JOIN aux ON aux.aux_attribute_id = fct.aux_attribute_id
LEFT JOIN job ON job.job_details_id = fct.job_details_id
LEFT JOIN occ ON occ.occupation = fct.occupation
WHERE occ.occupation_field = 'Hotell, restaurang, storhushåll';
