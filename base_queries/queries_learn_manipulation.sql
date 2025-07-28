/* CREATE TABLE
 job_applied (
 job_id INT,
 application_sent_date DATE,
 custom_resume BOOLEAN,
 resume_file_name VARCHAR(255),
 cover_letter_sent BOOLEAN,
 cover_letter_file_name VARCHAR(255),
 status VARCHAR(50)
 ); */
/* INSERT INTO
 job_applied (
 job_id,
 application_sent_date,
 custom_resume,
 resume_file_name,
 cover_letter_sent,
 cover_letter_file_name,
 status
 )
 VALUES
 (
 1,
 '2025-07-25',
 true,
 'pitty_01.pdf',
 true,
 'pitty_cover_01.pdf',
 'submitted'
 ),
 (
 2,
 '2025-03-02',
 true,
 'Car_01.pdf',
 false,
 'car_cover_01.pdf',
 NULL
 ),
 (
 3,
 '2025-06-11',
 false,
 'babi_01.pdf',
 false,
 'babi_cover_01.pdf',
 NULL
 ),
 (
 5,
 '2025-01-31',
 False,
 'new_01.pdf',
 true,
 'new_cover_01.pdf',
 'rejected'
 );
 */
-- ALTER TABLE job_applied ADD contact VARCHAR(50);
/* UPDATE job_applied
 SET status = 'waiting'
 WHERE job_id = 2; */
/* UPDATE job_applied
 SET contact = 'Big Head'
 WHERE job_id = 1;
 
 UPDATE job_applied
 SET contact = 'Big Mouth'
 WHERE job_id = 2;
 
 UPDATE job_applied
 SET contact = 'Big Brain'
 WHERE job_id = 3;
 
 UPDATE job_applied
 SET contact = 'Small Head'
 WHERE job_id = 4; */
/* ALTER TABLE job_applied
 RENAME COLUMN contact TO contact_name; */
/* ALTER TABLE job_applied
 ALTER COLUMN contact_name TYPE TEXT; */
/* ALTER TABLE job_applied
 DROP COLUMN contact_name; */
/* DROP TABLE job_applied; */
/* SELECT *
 FROM job_applied
 ORDER BY job_id; */