-- UNION
-- Combine results from two or more SELECT statements
-- They need to have the same amount of columns, and the data type must match.
-- Does not return duplicates

SELECT
    job_title_short,
    company_id,
    job_location
FROM january_jobs
UNION
SELECT
    job_title_short,
    company_id,
    job_location
FROM february_jobs
UNION
SELECT
    job_title_short,
    company_id,
    job_location
FROM march_jobs

-- ------------------------
-- UNION ALL
-- Combine results from two or more SELECT statements
-- They need to have the same amount of columns, and the data type must match.
-- Does return duplicates.

SELECT
    job_title_short,
    company_id,
    job_location
FROM january_jobs
UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM february_jobs
UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM march_jobs

-- ------------------PROBLEM------------------
/*
    Find job postings from the first quarter that have a salary greater than $70K
    - Combine job posting tables from first quarter of 2023 (jan-mar)
    - Gets job postings with an average yearly salary > $70k
*/
SELECT 
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.job_posted_date::date,
    quarter1_job_postings.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings
WHERE quarter1_job_postings.salary_year_avg > 70000
    AND quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY quarter1_job_postings.salary_year_avg desc