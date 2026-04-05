
SELECT 

skills,
COUNT(job_postings_fact.job_id) AS job_count,
ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM
job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
job_title_short = 'Data Analyst' AND
job_work_from_home = 'TRUE' AND
salary_year_avg IS NOT NULL
GROUP BY
skills
HAVING
COUNT(job_postings_fact.job_id)> 100
ORDER BY
ROUND(AVG(job_postings_fact.salary_year_avg),0) DESC,
COUNT(job_postings_fact.job_id) DESC