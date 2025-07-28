/*
    What are the most optimal skills to learn
    - high demanded and high avg salary
    - remote jobs
*/

WITH skills_demand AS (
    SELECT 
        sd.skill_id,
        sd.skills,
        COUNT(sjd.job_id) AS demanded_count
    FROM job_postings_fact jpf
    INNER JOIN skills_job_dim sjd
        ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim sd
        ON sjd.skill_id = sd.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = true
    GROUP BY
        sd.skill_id
), avg_salary AS(
    SELECT 
        sd.skill_id,
        sd.skills,
        ROUND(AVG(salary_year_avg), 2) AS avg_salary
    FROM job_postings_fact jpf
    INNER JOIN skills_job_dim sjd
        ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim sd
        ON sjd.skill_id = sd.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = true
    GROUP BY
        sd.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demanded_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN avg_salary
    ON skills_demand.skill_id = avg_salary.skill_id
WHERE demanded_count > 10
ORDER BY  avg_salary DESC, demanded_count DESC
LIMIT 25


/*

*/