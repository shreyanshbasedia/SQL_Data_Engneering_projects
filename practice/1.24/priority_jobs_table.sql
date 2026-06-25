-- CREATE TEMP TABLE
CREATE OR REPLACE TEMP TABLE src_priority_jobs AS 
SELECT 
    jpf.job_id,
    jpf.job_title_short,
    cd.name AS company_name,
    jpf.job_posted_date,
    jpf.salary_year_avg,
    r.priority_lvl,
    CURRENT_TIMESTAMP AS update_at
FROM
    data_jobs.job_postings_fact AS jpf
LEFT JOIN data_jobs.company_dim AS cd
    ON jpf.company_id = cd.company_id
INNER JOIN staging.priority_roles AS r
    ON jpf.job_title_short = r.role_name;

-- UPDATE TABLE
-- UPDATE main.priority_jobs_snapshots AS tgt
-- SET 
--     priority_lvl = src.priority_lvl,
--     update_at = src.update_at
-- FROM src_priority_jobs AS src
-- WHERE tgt.job_id = src.job_id
--     AND tgt.priority_lvl IS DISTINCT FROM src.priority_lvl;

-- -- INSECRT STATEMENT
-- INSERT OR REPLACE INTO main.priority_jobs_snapshots(
--     job_id ,
--     job_title_short ,
--     company_name ,
--     job_posted_date ,
--     salary_year_avg ,
--     priority_lvl ,
--     update_at
-- )
-- SELECT 
--     src.job_id ,
--     src.job_title_short ,
--     src.company_name ,
--     src.job_posted_date ,
--     src.salary_year_avg ,
--     src.priority_lvl ,
--     src.update_at
-- FROM src_priority_jobs AS src
-- WHERE NOT EXISTS (
--     SELECT 1
--     FROM main.priority_jobs_snapshots AS tgt
--     WHERE tgt.job_id = src.job_id
-- ) ;
-- -- DELETE STATEMENT
-- DELETE FROM main.priority_jobs_snapshots AS tgt
-- WHERE NOT EXISTS(
--     SELECT 1
--     FROM src_priority_jobs AS src
--     WHERE src.job_id = tgt.job_id
-- );



-- merge into 
MERGE INTO main.priority_jobs_snapshots AS tgt
USING src_priority_jobs AS src
ON tgt.job_id = src.job_id
WHEN MATCHED AND tgt.priority_lvl IS DISTINCT FROM src.priority_lvl THEN 
    UPDATE SET 
        priority_lvl = src.priority_lvl,
        update_at = src.update_at
WHEN NOT MATCHED THEN 
    INSERT (
        job_id ,
        job_title_short ,
        company_name ,
        job_posted_date ,
        salary_year_avg ,
        priority_lvl ,
        update_at
    )
    VALUES (
        src.job_id ,
        src.job_title_short ,
        src.company_name ,
        src.job_posted_date ,
        src.salary_year_avg ,
        src.priority_lvl ,
        src.update_at
    )
WHEN NOT MATCHED BY SOURCE THEN DELETE;

-- final query
SELECT 
    job_title_short,
    COUNT(*) AS job_count,
    MIN(priority_lvl) AS priority_lvl,
    MIN(update_at) AS update_at
FROM priority_jobs_snapshots
GROUP BY job_title_short 
ORDER BY job_count DESC;