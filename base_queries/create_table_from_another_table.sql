-- -----------------------Problem 6-----------------------
--Create tables from other tables
--jan, feb and mar 2023 jobs

CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    --WHERE EXTRACT(MONTH FROM job_posted_date) IN (1, 2, 3);
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    --WHERE EXTRACT(MONTH FROM job_posted_date) IN (1, 2, 3);
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    --WHERE EXTRACT(MONTH FROM job_posted_date) IN (1, 2, 3);
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT *
FROM january_jobs;
-- ------------------------------------------------------