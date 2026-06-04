INSERT INTO job_applied
            (job_id ,
            application_sent_Date ,
            coustum_resume ,
            cover_letter_sent ,
            cover_letter_file_name,
            contact, 
            status)
VALUES      (1,
            '2026-1-3',
            true,
            false,
            'cover_letter_1',
            'submitted'),
            (2,
            '2026-3-13',
            true,
            true,
            'cover_letter_2',
            'submitted'),
            (3,
            '2026-5-13',
            true,
            false,
            'cover_letter_3',
            'submitted'),
            (4,
            '2026-03-13',
            true,
            true,
            'cover_letter_4',
            'submitted'),
            (5,
            '2026-3-15',
            true,
            false,
            'cover_letter_5',
            'submitted');

ALTER TABLE job_applied
ADD CONTACT VARCHAR(50);

UPDATE job_applied
SET    contact = 'shrey basedi'
WHERE  job_id  = 1;

UPDATE job_applied
SET    contact = 'pari basedi'
WHERE  job_id  = 2;

UPDATE job_applied
SET    contact = 'hardik tam'
WHERE  job_id  = 3;

UPDATE job_applied
SET    contact = 'shrey yoyo'
WHERE  job_id  = 4;

UPDATE job_applied
SET    contact = 'jp basedi'
WHERE  job_id  = 5;

ALTER TABLE job_applied
RENAME COLUMN CONTACT TO CONTACT_NAME;

ALTER TABLE job_applied
ALTER COLUMN CONTACT_NAME TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN CONTACT_NAME;

SELECT*
FROM job_applied;
