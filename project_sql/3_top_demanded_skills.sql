/*
    What are the most in-demand skills for Data Analyst
    - top 5

*/


SELECT 
    skills,
    COUNT(sjd.job_id) AS demanded_count
FROM job_postings_fact jpf
INNER JOIN skills_job_dim sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim sd
    ON sjd.skill_id = sd.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY demanded_count DESC
LIMIT 5