SELECT
skills,
COUNT(job_postings_fact.job_id) AS skill_count
FROM
job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
job_postings_fact.job_title_short = 'Data Analyst' AND
job_postings_fact.job_work_from_home = 'TRUE'
GROUP BY
skills
ORDER BY
skill_count DESC
LIMIT
5;



/*1. Core Insight: SQL is the undisputed foundation
SQL (3083) is far ahead of everything else
👉 ~44% higher than Excel (2nd place)

Interpretation:

SQL is non-negotiable for data roles
It’s the gateway skill — almost every job requires it

👉 If someone lacks SQL, they’re effectively filtered out early

📊 2. The “Core Stack” Cluster (High Demand Skills)

These form the backbone of most data roles:

Skill	Count	Role
SQL	3083	Data extraction / querying
Excel	2143	Quick analysis / reporting
Python	1840	Automation / advanced analysis
Tableau	1659	Visualization
Power BI	1044	Visualization
Insight:

This shows a clear workflow pattern in industry:

SQL → Excel/Python → Tableau/Power BI

SQL gets the data
Excel/Python processes it
BI tools present it

👉 This is the modern data stack pipeline

📈 3. Visualization Tools: Tableau vs Power BI
Tableau: 1659
Power BI: 1044
Insight:
Tableau leads by ~60%
But both are highly relevant → not “either/or”

👉 Market signal:

Tableau = more common in tech/data-heavy companies
Power BI = strong in corporate/Microsoft environments
🧠 4. Programming vs Analytics Divide
Python (1840) >> R (1073)
Insight:
Python dominates R by ~70%

👉 Interpretation:

Python is now the industry standard
R is still relevant but more niche (research, statistics-heavy roles)
*/