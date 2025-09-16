SELECT
    md5(
        coalesce(cast(experience_required as string), '') || '-' ||
        coalesce(cast(access_to_own_car as string), '') || '-' ||
        coalesce(cast(driving_license_required as string), '')
    ) as aux_attribute_id,
    experience_required,
    access_to_own_car,
    driving_license_required
FROM project_hr.staging.dim_auxiliary_attributes;
