CREATE OR REPLACE TABLE staging.priority_roles (
        role_id INT PRIMARY KEY,
        role_name VARCHAR,
        priority_lvl INT
    );
INSERT INTO staging.priority_roles (role_id, role_name, priority_lvl)
VALUES (1, 'Data Engineer', 1),
    (2, 'Senior Data Engineer', 1),
    (3, 'Software Engineer', 3),
    (4, 'Data Scientist', 2),
    (5, 'Machine Learning Engineer', 2);
SELECT *
FROM staging.priority_roles;
-- .read Lessons/1.24/priority_roles.sql