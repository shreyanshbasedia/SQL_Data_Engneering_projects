CREATE DATABASE job_mart;
SHOW DATABASE;
CREATE SCHEMA "staging";

CREATE SCHEMA staging;

CREATE TABLE staging.preferred_role(
    job_id INTEGER PRIMARY KEY ,
    role_name VARCHAR
);
CREATE TABLE staging.job_posting_flat(
    
);

SELECT*
FROM information_schema.schemata;

SELECT*
FROM information_schema.tables
WHERE table_catalog = 'job__mart';

INSERT INTO staging.preferred_role(job_id , role_name)
VALUES
    (1,'DATA ENGINEER'),
    (2,'Senoir data engineer');

 

--DROP TABLE staging.perferred_table;
INSERT INTO staging.preferred_role(job_id , role_name)
VALUES
    (3,'SOFTWARE ENGINEER');
    
ALTER TABLE staging.preferred_role
ADD COLUMN preferred_roles BOOLEAN;

UPDATE staging.preferred_role
SET preferred_roles = TRUE
WHERE job_id = 1 OR job_id = 2;
UPDATE staging.preferred_role
SET preferred_roles = FALSE
WHERE job_id = 3;

SELECT * 
FROM staging.priority_role;

ALTER table staging.preferred_role
RENAME TO priority_role;
ALTER table staging.priority_role
RENAME COLUMN preferred_roles TO priority_lvl;

SELECT 
        jpf.*
FROM staging.job_postings_flat AS jpf
JOIN staging.priority_role AS r
    ON jpf.job_title_short = r.role_name
WHERE job_title_short = 'Senior Data Engineer';

UPDATE staging.priority_role
SET role_name = 'Software Engineer'
WHERE job_id = 3;