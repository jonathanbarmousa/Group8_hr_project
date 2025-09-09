-- Byt till rätt roll för att skapa andra roller
USE ROLE USERADMIN;
SELECT CURRENT_USER;

-- Skapa roller om de inte finns
CREATE ROLE IF NOT EXISTS dlt_dev_role;
CREATE ROLE IF NOT EXISTS dlt_readonly_role;

-- Byt till en lämplig roll för att ge privilegier till roller och tilldela roller till användare
USE ROLE SECURITYADMIN;

CREATE USER IF NOT EXISTS jonathan_user PASSWORD = '123';
CREATE USER IF NOT EXISTS abbefahmi_user PASSWORD = '1234';
CREATE USER IF NOT EXISTS abbeazeez_user PASSWORD = '12345';


-- Tilldela roller till användare
GRANT ROLE dlt_dev_role TO USER jonathan_user;
GRANT ROLE dlt_dev_role TO USER abbefahmi_user;
GRANT ROLE dlt_dev_role TO USER abbeazeez_user;

-- Ge åtkomst till warehouse, databas och schema för dlt_dev_role
GRANT USAGE ON WAREHOUSE group_wh TO ROLE dlt_dev_role;
GRANT USAGE ON DATABASE project_HR TO ROLE dlt_dev_role;
GRANT USAGE ON SCHEMA project_HR.staging TO ROLE dlt_dev_role;

-- Byt till ACCOUNTADMIN för att ge ACCOUNTADMIN-rollen till användare
USE ROLE ACCOUNTADMIN;

-- Ge ACCOUNTADMIN-rollen till användare
GRANT ROLE ACCOUNTADMIN TO USER jonathan_user;
GRANT ROLE ACCOUNTADMIN TO USER abbefahmi_user;

-- Återgå till SECURITYADMIN för att ge åtkomst till warehouse, databas och schema
USE ROLE SECURITYADMIN;

-- ======================================
-- 1️⃣ Warehouse access
-- ======================================
GRANT USAGE ON WAREHOUSE group_wh TO ROLE dlt_dev_role;
GRANT USAGE ON WAREHOUSE group_wh TO ROLE dlt_readonly_role;

-- ======================================
-- 2️⃣ Database access
-- ======================================
GRANT USAGE ON DATABASE project_HR TO ROLE dlt_dev_role;
GRANT USAGE ON DATABASE project_HR TO ROLE dlt_readonly_role;

-- ======================================
-- 3️⃣ Schema access
-- ======================================
GRANT USAGE ON SCHEMA project_HR.staging TO ROLE dlt_dev_role;
GRANT USAGE ON SCHEMA project_HR.staging TO ROLE dlt_readonly_role;

-- Ge dlt_dev_role rätt att skapa tabeller i schema
GRANT CREATE TABLE ON SCHEMA project_HR.staging TO ROLE dlt_dev_role;

-- ======================================
-- 4️⃣ Table privileges
-- ======================================
-- Dev role → full CRUD
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA project_HR.staging TO ROLE dlt_dev_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA project_HR.staging TO ROLE dlt_dev_role;

-- Readonly role → read-only
GRANT SELECT ON ALL TABLES IN SCHEMA project_HR.staging TO ROLE dlt_readonly_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA project_HR.staging TO ROLE dlt_readonly_role;
GRANT SELECT ON FUTURE TABLES IN DATABASE project_HR TO ROLE dlt_readonly_role;

-- Visa de aktuella behörigheterna för varje roll
SHOW GRANTS TO ROLE dlt_readonly_role;
SHOW GRANTS TO ROLE dlt_dev_role;
