SELECT *
FROM job_postings_fact;

SELECT '2023-02-19'::DATE,
    '123'::INTEGER,
    'true'::BOOLEAN,
    '3.14'::REAL;

-- concat DATE
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM job_postings_fact;

-- TIME ZONE
SELECT 
    job_title_short AS title,
    job_location AS location,
    --The first AT TIME ZONE is from what time zone and the second is TO time zone.
    -- It will calculates from UTC to EST(-5h)
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date 
FROM job_postings_fact;

-- EXTRACT -> gets the info (year, month, day)
-- -EXTRACT(MONTH FROM column_name)
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM job_postings_fact;

-- --------------------------------
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date
FROM 
    job_postings_fact;

SELECT 
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;

-- ---------------PRACTICE-------------------
SELECT 
    job_title_short AS title,
    AVG(salary_year_avg) AS avg_salary,
    AVG(salary_hour_avg) AS avg_hour,
    job_schedule_type
FROM
    job_postings_fact
WHERE
    job_posted_date::DATE > '2023-06-01' 
GROUP BY job_schedule_type, 1;


SELECT
    COUNT(job_id) AS job_count,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'AEDT' AS job_date_nsw,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    EXTRACT(YEAR FROM job_posted_date) = '2023'
GROUP BY
    month,job_date_nsw;

