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

-- Lägg in fler exempeljobb inom hotell, restaurang, transport och installation
INSERT INTO fct_job_ads (occupation, occupation_field, occupation_group, employer_id, job_details_id, aux_attribute_id, vacancies, application_deadline)
VALUES
-- Hotell & Restaurang
('Servitör', 'Hotell, restaurang, storhushåll', 'Restaurang', 'E1', 'J1', 'A1', 5, '2025-10-01'),
('Kock', 'Hotell, restaurang, storhushåll', 'Kök', 'E2', 'J2', 'A2', 3, '2025-10-15'),
('Hotellreceptionist', 'Hotell, restaurang, storhushåll', 'Hotell', 'E4', 'J4', 'A4', 2, '2025-11-01'),

-- Transport
('Chaufför', 'Transport, distribution, lager', 'Transport', 'E3', 'J3', 'A3', 10, '2025-10-20'),
('Lagerarbetare', 'Transport, distribution, lager', 'Lager', 'E5', 'J5', 'A5', 8, '2025-11-05'),

-- Installation, drift & underhåll
('Elektriker', 'Installation, drift, underhåll', 'El', 'E6', 'J6', 'A6', 4, '2025-11-10'),
('VVS-montör', 'Installation, drift, underhåll', 'VVS', 'E7', 'J7', 'A7', 6, '2025-11-20'),
('Fastighetsskötare', 'Installation, drift, underhåll', 'Fastighet', 'E8', 'J8', 'A8', 2, '2025-11-30');

-- Exempel arbetsgivare
INSERT INTO dim_employer VALUES
('E1', 'Restaurang AB', 'Kungsgatan 10', 'Stockholm', 'Stockholm', 'Sverige'),
('E2', 'Hotell City', 'Sveavägen 15', 'Göteborg', 'Västra Götaland', 'Sverige'),
('E3', 'Transportbolaget', 'Hamngatan 5', 'Malmö', 'Skåne', 'Sverige'),
('E4', 'Hotell Nord', 'Storgatan 20', 'Uppsala', 'Uppsala län', 'Sverige'),
('E5', 'Lager & Logistik AB', 'Industrigatan 7', 'Örebro', 'Örebro län', 'Sverige'),
('E6', 'Elfirma Elkraft', 'Elektrikergatan 3', 'Västerås', 'Västmanland', 'Sverige'),
('E7', 'VVS & Rör AB', 'Rörgatan 12', 'Linköping', 'Östergötland', 'Sverige'),
('E8', 'Fastighetsbolaget Sverige', 'Husgatan 8', 'Karlstad', 'Värmland', 'Sverige');

-- Exempel jobbdetaljer
INSERT INTO dim_job_details VALUES
('J1', 'Servitör på restaurang', 'Servera gäster', 'Heltid', 'Tillsvidare', 'Månadslön'),
('J2', 'Kock på hotell', 'Tillaga mat', 'Heltid', 'Tillsvidare', 'Månadslön'),
('J3', 'Chaufför lastbil', 'Köra lastbil', 'Heltid', 'Visstid', 'Timlön'),
('J4', 'Receptionist på hotell', 'Ta emot gäster', 'Deltid', 'Tillsvidare', 'Månadslön'),
('J5', 'Lagerarbetare', 'Plock och pack', 'Heltid', 'Visstid', 'Timlön'),
('J6', 'Elektriker inom bygg', 'Installera el i fastigheter', 'Heltid', 'Tillsvidare', 'Månadslön'),
('J7', 'VVS-montör', 'Installera rör och vatten', 'Heltid', 'Tillsvidare', 'Månadslön'),
('J8', 'Fastighetsskötare', 'Underhålla fastigheter', 'Deltid', 'Visstid', 'Timlön');

-- Exempel attribut
INSERT INTO dim_auxiliary_attributes VALUES
('A1', TRUE, FALSE, FALSE),
('A2', TRUE, FALSE, FALSE),
('A3', TRUE, TRUE, TRUE),
('A4', FALSE, FALSE, FALSE),
('A5', TRUE, FALSE, FALSE),
('A6', TRUE, FALSE, TRUE),
('A7', TRUE, FALSE, FALSE),
('A8', FALSE, FALSE, FALSE);

-- Exempel yrken
INSERT INTO dim_occupation VALUES
('O1', 'Servitör', 'Restaurang', 'Hotell, restaurang, storhushåll'),
('O2', 'Kock', 'Kök', 'Hotell, restaurang, storhushåll'),
('O3', 'Chaufför', 'Transport', 'Transport, distribution, lager'),
('O4', 'Hotellreceptionist', 'Hotell', 'Hotell, restaurang, storhushåll'),
('O5', 'Lagerarbetare', 'Lager', 'Transport, distribution, lager'),
('O6', 'Elektriker', 'El', 'Installation, drift, underhåll'),
('O7', 'VVS-montör', 'VVS', 'Installation, drift, underhåll'),
('O8', 'Fastighetsskötare', 'Fastighet', 'Installation, drift, underhåll');

-- Kolla så allt laddats in
SELECT * FROM project_hr.staging.fct_job_ads;



