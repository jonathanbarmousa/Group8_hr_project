USE ROLE SYSADMIN;

CREATE WAREHOUSE IF NOT EXISTS g8
WITH
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = "Warehouse for analizing data from Jobtech API";

USE WAREHOUSE g8;
CREATE DATABASE IF NOT EXISTS project_hr;
USE DATABASE project_hr;
CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS warehouse;
CREATE SCHEMA IF NOT EXISTS mart;

DESC DATABASE project_hr;



USE DATABASE project_hr;
USE SCHEMA staging;

-- Faktatabell med annonser
CREATE OR REPLACE TABLE fct_job_ads (
    job_id INT AUTOINCREMENT,
    occupation STRING,
    occupation_field STRING,
    occupation_group STRING,
    employer_id STRING,
    job_details_id STRING,
    aux_attribute_id STRING,
    vacancies INT,
    application_deadline DATE
);

-- Arbetsgivare
CREATE OR REPLACE TABLE dim_employer (
    employer_id STRING,
    employer_name STRING,
    employer_workplace STRING,
    workplace_city STRING,
    workplace_region STRING,
    workplace_country STRING
);

-- Jobbdetaljer
CREATE OR REPLACE TABLE dim_job_details (
    job_details_id STRING,
    headline STRING,
    description STRING,
    employment_type STRING,
    duration STRING,
    salary_type STRING
);

-- Hjälpattribut
CREATE OR REPLACE TABLE dim_auxiliary_attributes (
    aux_attribute_id STRING,
    experience_required BOOLEAN,
    access_to_own_car BOOLEAN,
    driving_license_required BOOLEAN
);

-- Yrken
CREATE OR REPLACE TABLE dim_occupation (
    occupation_id STRING,
    occupation STRING,
    occupation_group STRING,
    occupation_field STRING
);

-- Lägg in lite exempeljobb inom hotell, restaurang och transport
INSERT INTO fct_job_ads (occupation, occupation_field, occupation_group, employer_id, job_details_id, aux_attribute_id, vacancies, application_deadline)
VALUES
('Servitör', 'Hotell, restaurang, storhushåll', 'Restaurang', 'E1', 'J1', 'A1', 5, '2025-10-01'),
('Kock', 'Hotell, restaurang, storhushåll', 'Kök', 'E2', 'J2', 'A2', 3, '2025-10-15'),
('Chaufför', 'Transport, distribution, lager', 'Transport', 'E3', 'J3', 'A3', 10, '2025-10-20');

-- Exempel arbetsgivare
INSERT INTO dim_employer VALUES
('E1', 'Restaurang AB', 'Kungsgatan 10', 'Stockholm', 'Stockholm', 'Sverige'),
('E2', 'Hotell City', 'Sveavägen 15', 'Göteborg', 'Västra Götaland', 'Sverige'),
('E3', 'Transportbolaget', 'Hamngatan 5', 'Malmö', 'Skåne', 'Sverige');

-- Exempel jobbdetaljer
INSERT INTO dim_job_details VALUES
('J1', 'Servitör på restaurang', 'Servera gäster', 'Heltid', 'Tillsvidare', 'Månadslön'),
('J2', 'Kock på hotell', 'Tillaga mat', 'Heltid', 'Tillsvidare', 'Månadslön'),
('J3', 'Chaufför lastbil', 'Köra lastbil', 'Heltid', 'Visstid', 'Timlön');

-- Exempel attribut
INSERT INTO dim_auxiliary_attributes VALUES
('A1', TRUE, FALSE, FALSE),
('A2', TRUE, FALSE, FALSE),
('A3', TRUE, TRUE, TRUE);

-- Exempel yrken
INSERT INTO dim_occupation VALUES
('O1', 'Servitör', 'Restaurang', 'Hotell, restaurang, storhushåll'),
('O2', 'Kock', 'Kök', 'Hotell, restaurang, storhushåll'),
('O3', 'Chaufför', 'Transport', 'Transport, distribution, lager');

SELECT * FROM project_hr.staging.fct_job_ads;
SELECT * FROM project_hr.staging.dim_employer;


