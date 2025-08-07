-- ALTER TABLE Students
-- ADD COLUMN phone_number INT; 

-- ALTER TABLE Students
-- MODIFY COLUMN email VARCHAR (50) NOT NULL;

-- ALTER TABLE Students
-- MODIFY COLUMN age SMALLINT;

-- ALTER TABLE Courses
-- RENAME COLUMN course_name TO title;

-- ALTER TABLE Enrollments
-- MODIFY COLUMN grade VARCHAR(10) DEFAULT 'N/A';

-- ALTER TABLE Enrollments
-- ADD CONSTRAINT unique_id UNIQUE(student_id, course_id);

-- ALTER TABLE Students
-- DROP INDEX email; (drops UNIQUE constraint)

