
# [EDA](/1_EDA/) Exploratory Data Analysis W/ SQL: Job market Analysis
![project 1 overview](1_1_Project1_EDA.png)
A SQL-based project exploring the data engineering job landscape using real-world job posting data. **This project demonstrates my ability to design efficient analytical queries, model relational data, and extract actionable insights for career and business decisions.**
## 🚀 Executive Summary

- Project Scope: Built analytical SQL queries to uncover trends in job demand, salary distribution, and skill optimization for data engineers.

- Data Modeling: Combined fact and dimension tables to create a clean analytical schema for exploration.

- Analytics: Applied joins, aggregations, and window functions to identify high-demand and high-paying skills.

- Outcomes: Revealed insights on emerging technologies (e.g., Snowflake, Databricks), regional salary variations, and the growing importance of cloud-native tools.

## 📊 Key Queries
- [01_top_demanded_skills](01_TOP_DEMANDED_SKILLS.sql) — Finds the most frequently requested skills in job postings.

- [02_salary_trends](02_the_highest_paying_skills.sql) — Analyzes salary ranges by skill and region.

- [03_skill_value_index](03_the_most_optimal_skills.sql) — Combines demand and salary metrics to rank skills by overall market value.

## Problem & Context
### Job market analysts need to answer questions like:
![alt text](1_2_Data_Warehouse.png)


🎯 Most in-demand: Which skills are most in-demand for data engineers?
💰 Highest paid: Which skills command the highest salaries?
⚖️ Best trade-off: What is the optimal skill set balancing demand and compensation?
This project analyzes a data warehouse built using a star schema design. The warehouse structure consists of:



## 🧩 Tools & Technologies
- SQL Engine: PostgreSQL

- Data Source: Job postings dataset (cleaned and normalized)

- Visualization: Power BI / Tableau for dashboards

- Environment: VS Code + pgAdmin

## Tech Stack
#### 🐤 Query Engine: DuckDB for fast OLAP-style analytical queries
#### 🧮 Language: SQL (ANSI-style with analytical functions)
#### 📊 Data Model: Star schema with fact + dimension + bridge tables
#### 🛠️ Development: VS Code for SQL editing + Terminal for DuckDB CLI
#### 📦 Version Control: Git/GitHub for versioned SQL scripts
## Analysis Overview
- Query Structure
- [Top Demanded Skills](01_TOP_DEMANDED_SKILLS.sql) – Identifies the 10 most in-demand skills for remote data engineer positions
- [Top Paying Skills](02_the_highest_paying_skills.sql) – Analyzes the 25 highest-paying skills with salary and demand metrics
- [Optimal Skills](03_the_most_optimal_skills.sql) – Calculates an optimal score using natural log of demand combined with median salary to identify the most valuable skills to learn
## Key Insights
- 🧠 Core languages: SQL and Python each appear in ~29,000 job postings, making them the most demanded skills
- ☁️ Cloud platforms: AWS and Azure are critical for modern data engineering  roles-
- 🧱 Infra & tooling: Kubernetes, Docker, and Terraform are associated with premium salaries
- 🔥 Big data tools: Apache Spark shows strong demand with competitive compensation

## SQL Skills Demonstrated
### Query Design & Optimization
- Complex Joins: Multi-table INNER JOIN operations across job_postings_fact, skills_job_dim, and skills_dim
- Aggregations: COUNT(), MEDIAN(), ROUND() for statistical analysis
- Filtering: Boolean logic with WHERE clauses and multiple conditions (job_title_short, job_work_from_home, salary_year_avg IS NOT NULL)
- Sorting & Limiting: ORDER BY with DESC and LIMIT for top-N analysis
### Data Analysis Techniques
- Grouping: GROUP BY for categorical analysis by skill
- Conditional Logic: CASE WHEN statements for derived metrics
- Mathematical Functions: LN() for natural logarithm transformation to normalize demand metrics
- Calculated Metrics: Derived optimal score combining log-transformed demand with median salary
- HAVING Clause: Filtering aggregated results (skills with >= 100 postings)
- NULL Handling: Proper filtering of incomplete records (salary_year_avg IS NOT NULL)
=======
>>>>>>> 3351fe884801d4389f5b1be16b50b81d3b097953

