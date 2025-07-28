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
[
  {
    "skill_id": 8,
    "skills": "go",
    "demanded_count": "27",
    "avg_salary": "115319.89"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demanded_count": "11",
    "avg_salary": "114209.91"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demanded_count": "22",
    "avg_salary": "113192.57"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demanded_count": "37",
    "avg_salary": "112947.97"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demanded_count": "34",
    "avg_salary": "111225.10"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demanded_count": "13",
    "avg_salary": "109653.85"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demanded_count": "32",
    "avg_salary": "108317.30"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demanded_count": "17",
    "avg_salary": "106906.44"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demanded_count": "12",
    "avg_salary": "106683.33"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demanded_count": "20",
    "avg_salary": "104917.90"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demanded_count": "37",
    "avg_salary": "104533.70"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demanded_count": "49",
    "avg_salary": "103795.30"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demanded_count": "13",
    "avg_salary": "101413.73"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demanded_count": "236",
    "avg_salary": "101397.22"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demanded_count": "148",
    "avg_salary": "100498.77"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demanded_count": "16",
    "avg_salary": "99936.44"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demanded_count": "13",
    "avg_salary": "99630.81"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demanded_count": "230",
    "avg_salary": "99287.65"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demanded_count": "14",
    "avg_salary": "99171.43"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demanded_count": "13",
    "avg_salary": "99076.92"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demanded_count": "11",
    "avg_salary": "98958.23"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demanded_count": "63",
    "avg_salary": "98902.37"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demanded_count": "63",
    "avg_salary": "98902.37"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demanded_count": "35",
    "avg_salary": "97785.73"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demanded_count": "20",
    "avg_salary": "97587.00"
  }
]
*/