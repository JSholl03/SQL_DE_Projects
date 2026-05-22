-- .read Lessons/1.21/1.21_DDL_DML_Pt1.sql
USE data_jobs;
DROP DATABASE jobs_mart;
CREATE DATABASE jobs_mart;
SELECT *
FROM information_schema.schemata;
USE jobs_mart;
CREATE SCHEMA IF NOT EXISTS staging;
CREATE TABLE staging.preferred_roles (role_id INTEGER PRIMARY KEY, role_name VARCHAR);
SELECT *
FROM information_schema.tables
WHERE table_catalog = 'jobs_mart';
INSERT INTO staging.preferred_roles (role_id, role_name)
VALUES (1, 'Data Engineer'),
    (2, 'Senior Data Engineer');
INSERT INTO staging.preferred_roles (role_id, role_name)
VALUES (3, 'Software Engineer'),
    (4, 'Senior Software Engineer');
SELECT *
FROM staging.preferred_roles;
ALTER TABLE staging.preferred_roles
ADD COLUMN preferred_role BOOLEAN;
UPDATE staging.preferred_roles
SET preferred_role = TRUE
WHERE role_id = 1
    OR role_id = 2;
UPDATE staging.preferred_roles
SET preferred_role = FALSE
WHERE role_id = 4;
ALTER TABLE staging.preferred_roles
    RENAME TO priority_roles;
SELECT *
FROM staging.priority_roles;
ALTER TABLE staging.priority_roles
    RENAME COLUMN is_priority_lvl TO priority_lvl;
ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INTEGER;
UPDATE staging.priority_roles
SET priority_lvl = 4
WHERE role_id = 4;