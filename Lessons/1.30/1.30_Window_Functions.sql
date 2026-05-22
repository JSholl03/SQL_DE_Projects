-- Count Rows - Aggregation Only
SELECT COUNT(*)
FROM job_postings_fact;
--- Count Rows - Window Function
SELECT job_posting_id,
    COUNT(*) OVER ()
FROM job_postings_fact;
SELECT job_id,
    job_title_short,
    company_id,
    AVG(salary_hour_avg) OVER (
        PARTITION BY job_title_short,
        company_id
    )
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL
ORDER BY RANDOM()
LIMIT 20;
-- ORDER BY - Ranking hourly salary
SELECT job_id,
    job_title_short,
    salary_hour_avg,
    RANK() OVER (
        ORDER BY salary_hour_avg DESC
    ) AS salary_rank_hourly
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL
ORDER BY salary_hour_avg DESC
LIMIT 10;
-- PARTITION BY & ORDER BY - Running Average Hourly Salary
SELECT job_id,
    job_title_short,
    salary_hour_avg,
    DENSE_RANK() OVER (
        ORDER BY salary_hour_avg DESC
    ) AS salary_rank_hourly
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL
ORDER BY salary_hour_avg DESC
LIMIT 140;
-- ROW_NUMBER() - Providing a new job_id
SELECT *,
    ROW_NUMBER() OVER (
        ORDER BY job_posted_date
    )
FROM job_postings_fact
ORDER BY job_posting_date
LIMIT 10;