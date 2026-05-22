SELECT CHAR_LENGTH('SQL');
SELECT LOWER('SQL');
SELECT LEFT('SQL', 2);
SELECT RIGHT('SQL', 2);
SELECT SUBSTRING('SQL', 2, 2);
SELECT CONCAT('SQL', '-', 'Functions');
SELECT TRIM('   SQL   ');
SELECT LTRIM('   SQL');
SELECT RTRIM('SQL   ');
SELECT REPLACE('SQL Functions', 'Functions', 'Language');
SELECT NULLIF(10, 10);
SELECT salary_year_avg,
    salary_hour_avg,
    COALESCE(salary_year_avg, salary_hour_avg * 2080)
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL
    OR salary_year_avg IS NOT NULL
LIMIT 10;
-- Final Example -> Simplify with Coalesce
SELECT job_title_short,
    salary_year_avg,
    salary_hour_avg,
    COALESCE(salary_year_avg, salary_hour_avg * 2080) AS standardized_salary,
    CASE
        WHEN COALESCE(salary_year_avg, salary_hour_avg * 2080) IS NULL THEN 'Missing'
        WHEN COALESCE(salary_year_avg, salary_hour_avg * 2080) < 75_000 THEN 'Low'
        WHEN COALESCE(salary_year_avg, salary_hour_avg * 2080) < 150_000 THEN 'Mid'
        ELSE 'High'
    END AS salary_bucket
FROM job_postings_fact
ORDER BY standardized_salary DESC;