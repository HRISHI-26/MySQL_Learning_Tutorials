INSERT INTO Users (full_name, email, password, phone, location, resume)
VALUES 
('Alice Sharma', 'alice@example.com', 'hashed_password1', '9876543210', 'Mumbai', 'Resume content...'),
('Rahul Mehta', 'rahul@example.com', 'hashed_password2', '9123456789', 'Delhi', 'Resume content...');

INSERT INTO Companies (name, industry, location, website)
VALUES
('TechNova', 'Software', 'Bangalore', 'https://technova.com'),
('GreenLogix', 'Renewable Energy', 'Hyderabad', 'https://greenlogix.in');

INSERT INTO Jobs (company_id, title, description, location, salary_range, job_type)
VALUES
(1, 'Frontend Developer', 'Build UI with React.js', 'Remote', '6-10 LPA', 'Full-time'),
(1, 'Backend Developer', 'Develop APIs with Node.js', 'Bangalore', '8-12 LPA', 'Full-time'),
(2, 'Energy Analyst', 'Analyze solar efficiency data', 'Hyderabad', '5-8 LPA', 'Full-time');

INSERT INTO Applications (user_id, job_id)
VALUES
(1, 1),  -- Alice applies for Frontend Developer
(2, 2);  -- Rahul applies for Backend Developer

INSERT INTO Interviews (application_id, interview_date, mode, interviewer, notes)
VALUES
(1, '2025-08-10 10:00:00', 'Online', 'John Smith', 'Good communication, needs stronger JS skills'),
(2, '2025-08-11 14:30:00', 'Offline', 'Priya Verma', 'Strong backend experience');

INSERT INTO Skills (name)
VALUES
('JavaScript'),
('Python'),
('React.js'),
('SQL');

INSERT INTO UserSkills (user_id, skill_id, proficiency)
VALUES
(1, 1, 'Advanced'),   -- Alice - JavaScript
(1, 3, 'Intermediate'), -- Alice - React.js
(2, 2, 'Advanced'),   -- Rahul - Python
(2, 4, 'Intermediate'); -- Rahul - SQL

-- ########################################################################################################

UPDATE Jobs
SET salary_range = '7-11 LPA', 
    description = 'Build UI with React.js and Tailwind CSS'
WHERE job_id = 1;

UPDATE Users
SET location = 'Pune', 
    phone = '9988776655'
WHERE user_id = 1;

-- ########################################################################################################

DELETE FROM Jobs
WHERE posted_at < DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH);

DELETE FROM Applications
WHERE user_id = 2 AND job_id = 2;

-- ########################################################################################################

SELECT j.job_id, j.title, j.location, j.salary_range
FROM Jobs j
JOIN Companies c ON j.company_id = c.company_id
WHERE c.name = 'TechNova';

SELECT job_id, title, location, salary_range
FROM Jobs
WHERE description LIKE '%React%' OR title LIKE '%React%';

