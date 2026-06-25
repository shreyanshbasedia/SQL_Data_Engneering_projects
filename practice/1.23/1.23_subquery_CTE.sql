-- subquery
SELECT *
FROM(
    SELECT *
    FROM data_jobs.job_postings_fact
    WHERE salary_year_avg IS NOT NULL
        OR salary_hour_avg IS NOT NULL
)
LIMIT 10;

-- CTE
WITH valid_salaries AS (
    SELECT *
    FROM data_jobs.job_postings_fact
    WHERE salary_year_avg IS NOT NULL
        OR salary_hour_avg IS NOT NULL
)
SELECT *
FROM valid_salaries; 

-- show each jobs median salary next to the overall markit median:

SELECT 
    job_title_short,
    salary_year_avg,
    (
        SELECT MEDIAN(salary_year_avg)
        FROM job_postings_fact
    )AS market_median_salary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
LIMIT 10;

-- subquery in FROM 
-- Stage only jobs that are remote before aggregation:

SELECT 
    job_title_short,
    MEDIAN(salary_year_avg),
    (
        SELECT MEDIAN(salary_year_avg)
        FROM job_postings_fact
        WHERE job_work_from_home = TRUE
    )AS market_median_salary
FROM (
    SELECT 
        job_title_short,
        salary_year_avg
    FROM job_postings_fact
    WHERE job_work_from_home = TRUE
) AS clean_jobs
GROUP BY job_title_short
LIMIT 10;

--subquery in having
-- keep only job title whose median salary is above the overall median

SELECT 
    job_title_short,
    MEDIAN(salary_year_avg),
    (
        SELECT MEDIAN(salary_year_avg)
        FROM job_postings_fact
        WHERE job_work_from_home = TRUE
    )AS market_median_salary
FROM (
    SELECT 
        job_title_short,
        salary_year_avg
    FROM job_postings_fact
    WHERE job_work_from_home = TRUE
) AS clean_jobs
GROUP BY job_title_short
HAVING MEDIAN(salary_year_avg) > (
        SELECT MEDIAN(salary_year_avg)
        FROM job_postings_fact
        WHERE job_work_from_home = TRUE)
LIMIT 10;

--CTE

WITH title_median AS (
    SELECT 
        job_title_short,
        job_work_from_home,
        MEDIAN(salary_year_avg) :: INT AS median_salary
    FROM job_postings_fact
    WHERE job_country = 'India'
    GROUP BY
        job_title_short,
        job_work_from_home
)

SELECT 
    r.job_title_short,
    r.median_salary AS indoor_median_salary,
    o.median_salary AS outdoor_median_salary
FROM title_median AS r
INNER JOIN title_median AS o
    ON r.job_title_short = o.job_title_short
WHERE r.job_work_from_home = TRUE
    AND o.job_work_from_home = FALSE;


SELECT * 
FROM RANGE(3) AS src(key)
WHERE NOT EXISTS(
    SELECT 1
    FROM RANGE(2) AS tgt(key)
    WHERE tgt.key = src.key
);

-- final example 
-- identify job posting that have no associated skills before loading them into them into data mart

SELECT *
FROM job_postings_fact
ORDER BY job_id
LIMIT 10;

SELECT * 
FROM skills_job_dim
ORDER BY job_id
LIMIT 40;

SELECT *
FROM job_postings_fact AS tgt
WHERE  EXISTS(
    SELECT 1
    FROM skills_job_dim AS src
    WHERE tgt.job_id = src.job_id
)
ORDER BY job_id;

