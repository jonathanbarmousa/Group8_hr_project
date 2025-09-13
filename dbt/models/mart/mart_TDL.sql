with 
    fct_table as (select * from fct_table),
    dim_employer as (select * from dim_employer),
    dim_auxiliary as (select * from dim_auxiliary_attributes),
    dim_job_details as (select * from dim_job_details),
    dim_occupation as (select * from dim_occupation)

select
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
    de.workplace_street_address,
    de.workplace_region,
    de.workplace_city,
    de.workplace_postcode,
    de.workplace_country,
    ft.vacancies,
    ft.application_deadline
from fct_table ft
left join dim_employer de on de.employer_id = ft.employer_id
left join dim_auxiliary da on da.auxiliary_attribute_id = ft.auxiliary_attribute_id
left join dim_job_details dj on dj.job_details_id = ft.job_details_id
left join dim_occupation docc on docc.occupation_id = ft.occupation_id
where docc.occupation_field = 'Transport, distribution, lager'