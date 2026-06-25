-- count the row - Aggregation Only
SELECT
    COUNT(*)
FROM
    job_postings_fact;


-- sount rows - Window Funtion
SELECT
    job_id,
    COUNT(*) OVER ()
FROM
    job_postings_fact;

-- PARTITION BY - BY hourly salary 
SELECT
    job_id,
    job_title_short,
    company_id,
    salary_hour_avg,
    AVG(salary_hour_avg) OVER (PARTITION BY job_title_short , company_id)

FROM 
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL
ORDER BY 
    RANDOM()
LIMIT 10;

SELECT
    job_id,
    job_title_short,
    salary_hour_avg,
    RANK() OVER(ORDER BY salary_hour_avg DESC ) AS rank_hour_salary

FROM 
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL
ORDER BY 
    salary_hour_avg DESC
LIMIT 10;


SELECT
    job_posted_date,
    job_title_short,
    salary_hour_avg,
    RANK() OVER (PARTITION BY job_title_short ORDER BY salary_hour_avg DESC) AS rank_hourly_salary

FROM 
    job_postings_fact
WHERE 
    salary_hour_avg IS NOT NULL
ORDER BY 
    job_title_short,
    salary_hour_avg DESC
LIMIT 10;