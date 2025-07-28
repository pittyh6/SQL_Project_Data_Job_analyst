-- subqueries
SELECT *
FROM(
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;

-- CTEs
WITH job_february AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2
)

Select *
FROM job_february

---------------------------------------------------
 
SELECT
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
    ORDER BY company_id
);

------

WITH company_job_count AS (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
)

SELECT 
    cd.name,
    company_job_count.total_jobs
FROM company_dim cd
LEFT JOIN company_job_count
    ON company_job_count.company_id = cd.company_id
ORDER BY total_jobs DESC

-- ------------------------Problem--------------------------
/*
Find the count of the number of remote job posting per skills
    - display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skills
*/
WITH remote_job_skills AS (
    SELECT
        --skills_to_job.job_id,
        skills_to_job.skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job 
    INNER JOIN job_postings_fact jpf
        ON skills_to_job.job_id = jpf.job_id
    WHERE jpf.job_work_from_home = true
        AND jpf.job_title_short = 'Data Analyst'
    GROUP BY skills_to_job.skill_id
)
SELECT 
    skill.skill_id,
    skill.skills,
    remote_job_skills.skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skill
    ON skill.skill_id = remote_job_skills.skill_id
ORDER BY remote_job_skills.skill_count DESC
LIMIT 5