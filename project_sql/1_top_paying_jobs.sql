/*
    What are the top-paying data analyst jobs?
    - top 10 available remotely
    - remove salary nulls
    - why? Highlight the top-paying opportunities for Data Analyst, offering insights..
*/

SELECT 
    job_id,
    cd.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::date
FROM job_postings_fact jpf
LEFT JOIN company_dim cd
    ON jpf.company_id = cd.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_work_from_home = true
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
