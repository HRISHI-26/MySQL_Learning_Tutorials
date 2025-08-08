								-- PROCEDURE
Post a Job
DELIMITER $$
CREATE PROCEDURE PostJob(
	IN p_company_id INT,
    IN p_title VARCHAR(100),
    IN p_description TEXT,
    IN p_location VARCHAR(100),
    IN p_salary_range VARCHAR(50),
    IN p_job_type ENUM('Full-time', 'Part-time', 'Internship', 'Contract')
)
BEGIN
	INSERT INTO Jobs (company_id, title, description, location, salary_range, job_type)
    VALUES (p_company_id, p_title, p_description, p_location, p_salary_range, p_job_type);
END $$
DELIMITER ;

-- Apply for a Job (with validation to prevent duplicate application)
DELIMITER $$
CREATE PROCEDURE ApplyforJob(
	IN p_user_id INT,
    IN p_job_id INT
)
BEGIN
	IF NOT EXISTS(
		SELECT 1 FROM Applications WHERE user_id = p_user_id AND job_id = p_job_id
    ) THEN
		INSERT INTO Applications (user_id, job_id)
        VALUES (p_user_id, p_job_id);
	ELSE
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User has already applied for this job.';
	END IF;
END$$
DELIMITER ;

-- Schedule an Interview
DELIMITER $$
CREATE PROCEDURE ScheduleInterview(
	IN p_application_id INT,
    IN p_interview_date DATETIME,
    IN p_mode ENUM('Online', 'Offline', 'Phone'),
    IN p_interviewer VARCHAR(100),
    IN p_notes TEXT
)
BEGIN
	INSERT INTO Interviews(application_id, interview_date, mode, interviewer, notes)
    VALUES (p_application_id, p_interview_date, p_mode, p_interviewer, p_notes);
END $$
DELIMITER ;

								-- FUNCTIONS
-- Calculate Total Applications for a Job
DELIMITER $$
CREATE FUNCTION TotalApplications(p_job_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM Applications
    WHERE job_id = p_job_id;
    RETURN total;
END $$
DELIMITER ;

-- Return Full Name of a Job Seeker from user_id
DELIMITER $$
CREATE FUNCTION GetUserName(p_user_id INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE name VARCHAR(100);
    SELECT full_name INTO name
    FROM Users
    WHERE user_id = p_user_id;
    RETURN name;
END $$
DELIMITER ;


-- #############################################################################

CALL PostJob(1, 'DevOps Engineer', 'Manager CI/CD Pipelines', 'Chennai', '10-15 LPA', 'Full-time');

CALL ApplyforJob(1, 2);

CALL ScheduleInterview(1, '2025-08-15 10:30:00', 'Online', 'HR Manager', 'Candidate is promising.');

SELECT TotalApplications(2);
SELECT GetUserName(1);