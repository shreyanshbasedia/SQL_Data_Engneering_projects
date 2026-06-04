SELECT
    job_id,
    job_title_short,
    job_location,
    salary_year_avg,
    company_id
FROM
    job_postings_fact
LIMIT
    20;

SELECT
    company_id,
    name
FROM
    company_dim
LIMIT 10;

SELECT *
FROM Information_schema.columns
WHERE table_catalog = 'data_jobs';
PRAGMA show_tables_expanded