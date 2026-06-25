-- Buket data
-- < 25 (low)
-- 25-50 (Medium)
-- ? 50 (High)

SELECT 
    job_title_short,
    salary_hour_avg,
    CASE 
        WHEN salary_hour_avg < 25 THEN 'Low'
        WHEN salary_hour_avg < 50 THEN 'Medium'
        ELSE 'High'
    END AS salary_category
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL
LIMIT 10;

-- Handling (null) DATA
-- Filter null salary value

SELECT 
    job_title_short,
    salary_hour_avg,
    CASE 
        WHEN salary_hour_avg < 25 THEN 'Low'
        WHEN salary_hour_avg < 50 THEN 'Medium'
        ELSE 'High'
    END AS salary_category
FROM job_postings_fact
WHERE salary_hour_avg IS NOT NULL
LIMIT 10;

-- Categorizing categorical values
-- Classify the 'job_tile' column values as;
        -- 'Data Analytic'
        -- 'Data engineer'
        -- 'Data Scientist'

SELECT 
    job_title,
    CASE
        WHEN job_title LIKE '%Data%' AND job_title LIKE '%Analyst%' THEN 'Data Analyst'
        WHEN job_title LIKE '%Data%' AND job_title LIKE '%Engineer%' THEN 'Data Engineer'
        WHEN job_title LIKE '%Data%' AND job_title LIKE '%Scientist%' THEN 'Data Scientist'
        ELSE 'OTHER'
    END AS job_title_catgory,
    job_title_short
FROM job_postings_fact
ORDER BY RANDOM()
LIMIT 20;

-- conditional aggregation
-- calculate medium salary for different buckets
        -- < 100k
        -- >= $ 100k\

SELECT 
    job_title_short,
    COUNT(*) AS total_posting ,
    MEDIAN(
        CASE
            WHEN salary_year_avg < 100_000 THEN salary_year_avg
        END
    ) AS median_low_salary,
    MEDIAN(
        CASE
            WHEN salary_year_avg >= 100_00 THEN salary_year_avg
        END
    ) AS median_high_ssalary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
GROUP BY job_title_short;

-- candisnal calculation
-- compute a standardized_salary using yearly salary and adjusted hourly salary (e.g. 2000 hour/year)
-- categories salary into tier of;
    -- <75 'Low'
    -- 75k - 150 'high'
    -- >= 150 'high'


WITH salaries AS (
    SELECT 
        job_title_short,
        salary_hour_avg,
        salary_year_avg,
        CASE
            WHEN salary_year_avg IS NOT NULL THEN salary_year_avg
            WHEN salary_hour_avg IS NOT NULL THEN salary_hour_avg * 2000
        END AS categorised_salary
    FROM job_postings_fact
)
SELECT
    *,
    CASE
        WHEN categorised_salary IS NOT NULL THEN 'MISSING'
        WHEN categorised_salary < 75_000 THEN 'Low'
        WHEN categorised_salary < 150_000 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS salary_bucket
FROM salaries
ORDER BY categorised_salary 
LIMIT 10;
