SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS Salary_median,
    COUNT(jpf.*) AS actual_demand,
    ROUND(LN(COUNT(jpf.*)) ,1 )AS LN_demand,
    ROUND(MEDIAN(jpf.salary_year_avg)*LN(COUNT(jpf.*))/1_00_000,2) AS Optimal_score
FROM 
    job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
        ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY
    sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY
    Optimal_score DESC
LIMIT 25;


/*
┌────────────┬───────────────┬───────────────┬───────────┬───────────────┐
│   skills   │ Salary_median │ actual_demand │ LN_demand │ Optimal_score │
│  varchar   │    double     │     int64     │  double   │    double     │
├────────────┼───────────────┼───────────────┼───────────┼───────────────┤
│ terraform  │      184000.0 │           193 │       5.3 │          9.68 │
│ python     │      135000.0 │          1133 │       7.0 │          9.49 │
│ aws        │      137320.0 │           783 │       6.7 │          9.15 │
│ sql        │      130000.0 │          1128 │       7.0 │          9.14 │
│ airflow    │      150000.0 │           386 │       6.0 │          8.93 │
│ spark      │      140000.0 │           503 │       6.2 │          8.71 │
│ snowflake  │      135500.0 │           438 │       6.1 │          8.24 │
│ kafka      │      145000.0 │           292 │       5.7 │          8.23 │
│ azure      │      128000.0 │           475 │       6.2 │          7.89 │
│ java       │      135000.0 │           303 │       5.7 │          7.71 │
│ scala      │      137290.0 │           247 │       5.5 │          7.56 │
│ kubernetes │      150500.0 │           147 │       5.0 │          7.51 │
│ git        │      140000.0 │           208 │       5.3 │          7.47 │
│ databricks │      132750.0 │           266 │       5.6 │          7.41 │
│ redshift   │      130000.0 │           274 │       5.6 │           7.3 │
│ gcp        │      136000.0 │           196 │       5.3 │          7.18 │
│ hadoop     │      135000.0 │           198 │       5.3 │          7.14 │
│ nosql      │      134415.0 │           193 │       5.3 │          7.07 │
│ pyspark    │      140000.0 │           152 │       5.0 │          7.03 │
│ docker     │      135000.0 │           144 │       5.0 │          6.71 │
│ mongodb    │      135750.0 │           136 │       4.9 │          6.67 │
│ go         │      140000.0 │           113 │       4.7 │          6.62 │
│ r          │      134775.0 │           133 │       4.9 │          6.59 │
│ github     │      135000.0 │           127 │       4.8 │          6.54 │
│ bigquery   │      135000.0 │           123 │       4.8 │           6.5 │
└────────────┴───────────────┴───────────────┴───────────┴───────────────┘
  25 rows                                                      5 columns
*/