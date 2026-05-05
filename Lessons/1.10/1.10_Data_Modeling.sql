SELECT job_id,
    job_title_short,
    salary_year_avg,
    company_id
FROM job_postings_fact
LIMIT 10;
SELECT *
FROM skills_dim
LIMIT 5;
SELECT table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_catalog = 'data_jobs';
SELECT