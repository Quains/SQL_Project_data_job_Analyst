SELECT
skills,
ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM
job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
job_postings_fact.job_title_short = 'Data Analyst' AND
job_postings_fact.job_work_from_home = 'TRUE' AND
job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
skills
ORDER BY
avg_salary DESC;

/*1. The top-paying “analyst” roles are NOT typical analysts

Look at your top skills:

pyspark ($208k)
databricks
airflow
kubernetes
elasticsearch

👉 These are not analyst tools

💡 Trend:

The highest salaries come from hybrid roles:

Analytics Engineer
Data Engineer (with analyst responsibilities)
ML-focused Analyst
🚀 2. Clear Trend Clusters
🟥 A. Big Data = Highest Pay Tier

Skills:

pyspark
hadoop
spark
databricks

💡 What it means:

Analysts working with massive datasets get paid the most

👉 Difference:

Normal analyst → Excel / SQL
High-paid analyst → distributed systems
☁️ B. Cloud Data Stack is a MUST for high pay

Skills:

gcp, aws, azure
bigquery, snowflake, redshift

💡 Insight:

Modern analysts don’t just query data — they work inside cloud ecosystems

⚙️ C. Pipeline & Automation Skills = Salary Boost

Skills:

airflow
jenkins
linux
shell

💡 Trend:

Analysts are expected to:

automate workflows
build pipelines
schedule jobs

👉 This is Analytics Engineering

🤖 D. ML Skills = Premium Layer (but not top)

Skills:

scikit-learn
pandas
numpy
datarobot

💡 Insight:

ML helps increase salary, BUT:

only when combined with engineering skills
🔧 E. DevOps / Collaboration Tools show up (important signal)

Skills:

gitlab, bitbucket, github
atlassian, jira, confluence

💡 Insight:

High-paying analysts work in:

structured engineering teams
production environments
📉 3. Traditional Analyst Tools = Lower Ceiling

Skills:

excel ($87k)
tableau ($99k)
power bi ($97k)
sql ($97k)

💡 Important:

These are entry-to-mid level tools

They:

are necessary
but don’t differentiate you
⚠️ 4. Hidden Truth: Title inflation

Many “Data Analyst” jobs in this dataset are likely:

“Senior Data Analyst”
“Analytics Engineer”
“Data Scientist (light)”

💡 That’s why you see:

pyspark
kubernetes
golang

👉 These are NOT beginner roles

🧭 5. Career Ladder (Based on YOUR data)
🟢 Level 1 — Traditional Analyst ($80K–$100K)
SQL
Excel
Tableau / Power BI
🟡 Level 2 — Advanced Analyst ($100K–$130K)
Python (pandas, numpy)
PostgreSQL
Looker / BI tools
🟠 Level 3 — Analytics Engineer ($120K–$150K)
dbt (not listed but implied)
Airflow
Cloud (AWS/GCP)
Data modeling
🔴 Level 4 — High-Pay Tier ($150K–$200K+)
PySpark
Databricks
Kubernetes
Distributed systems
*/


