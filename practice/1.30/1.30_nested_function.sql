-- Array Intro
SELECT ['python','sql','r'] AS skills;

WITH skills AS(
    SELECT 'python' AS skill
    UNION ALL
    SELECT 'sql'
    UNION ALL 
    SELECT 'r'
),  Skills_array AS (
    SELECT ARRAY_AGG(skill ORDER BY skill) AS skills
    FROM skills
)
SELECT 
    skills[1] AS First_skill,
    skills[2] AS second_skill,
    skills[3] AS Third_skill
FROM skills_array;

-- struct

SELECT {skills : 'python',type:'programming'} AS skill_struct;


WITH Skill_struct AS (
    SELECT 
        STRUCT_PACK(
            skill := 'python',
            type := 'programning'
        ) AS s
)
SELECT
    s.skill,
    s.type
FROM skill_struct;

WITH Skills_table AS (
    SELECT 'python' AS skills ,'programming' AS types
    UNION ALL 
    SELECT 'sql' ,'quary language'
    UNION ALL 
    SELECT 'r' , 'programming'
)
SELECT
    STRUCT_PACK(
        Skill:= skills,
        type := types 
    )
FROM Skills_table;


-- Array of struct

WITH Skills_table AS (
    SELECT 'python' AS skills ,'programming' AS types
    UNION ALL 
    SELECT 'sql' ,'quary language'
    UNION ALL 
    SELECT 'r' , 'programming'
), Skills_array_struct AS (
    SELECT
        ARRAY_AGG(
            STRUCT_PACK(
                Skill:= skills,
                type := types 
            )
        ) array_struct
    FROM Skills_table
)
SELECT 
    array_struct[1] AS First_skill,
    array_struct[2] AS second_skill,
    array_struct[3] AS Third_skill
FROM Skills_array_struct;


-- MAP 
WITH skill_map AS(
    SELECT MAP{'skill': 'python','type' : 'programming'} AS skill_type
)
SELECT
    skill_type['skill'],
    skill_type['type']
FROM
    skill_map;
-- JSON
WITH row_json AS (
    SELECT
        '{"skill":"python","type":"programmiing"}'::JSON AS skill_json
)
SELECT
    STRUCT_PACK(
        skill := json_extract_string(skill_json,'$.skill'),
        type := json_extract_string(skill_json,'$.type')
    )
FROM row_json;

-- json to array of struct

-- array - final example
-- build s flat skill for co worker to access job title , salary and skills in one table

CREATE OR REPLACE TEMP TABLE job_skills_Array AS
SELECT 
    jpf.job_id,
    jpf.job_title_short,
    jpf.salary_year_avg,
    ARRAY_AGG(sd.skills) AS skills_array
FROM job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd
    ON sd.skill_id = sjd.skill_id
GROUP BY ALL;


-- Free the perspective of data analyst,analysis the median salary per type of skill
WITH flat_skills AS(
    SELECT 
        job_id ,
        job_title_short,
        salary_year_avg,
        UNNEST(skills_array) AS skill
    FROM
        job_skills_Array
)
SELECT
    skill,
    MEDIAN(salary_year_avg) AS median_salary
FROM flat_skills
GROUP BY skill
ORDER BY median_salary DESC
LIMIT 50;


CREATE OR REPLACE TEMP TABLE job_skills_Struct_Array AS

SELECT 
    jpf.job_id,
    jpf.job_title_short,
    jpf.salary_year_avg,
    ARRAY_AGG(
        STRUCT_PACK(
            skill_type:= sd.type,
            skill_name:= sd.skills
        )
    ) AS skills_array
FROM job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd
    ON sd.skill_id = sjd.skill_id
GROUP BY ALL;


-- from the perpective of a data analyst , analyz the median salary per type of skill

SELECT 
    job_id,
    job_title_short,
    salary_year_avg,
    UNNEST(skills_array).skill_type AS skill_type,
    UNNEST(skills_array).skill_name AS skill_name
FROM 
    job_skills_Struct_Array;


WITH flat_skills AS(
    SELECT 
        job_id,
        job_title_short,
        salary_year_avg,
        UNNEST(skills_array).skill_type AS skill_type,
        UNNEST(skills_array).skill_name AS skill_name
    FROM 
        job_skills_Struct_Array
)
SELECT
    skill_type,
    MEDIAN(salary_year_avg) AS median_salary
FROM flat_skills
GROUP BY skill_type
ORDER BY median_salary DESC;
