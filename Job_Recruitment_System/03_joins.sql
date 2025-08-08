-- INNER JOIN
-- Show all job applications with user and job details
SELECT
	a.application_id,
    u.full_name AS applicant_name,
    j.title AS job_title,
    j.location AS job_location,
    a.applied_at,
    a.status
FROM Applications a
INNER JOIN Users u ON a.user_id = u.user_id
INNER JOIN Jobs j ON a.job_id = j.job_id;

-- Show all jobs with their applicants (including jobs with no applicants)
SELECT
	j.job_id,
    j.title,
    j.location,
    a.application_id,
	u.full_name AS applicant_name
FROM Jobs j
LEFT JOIN Applications a ON j.job_id = a.job_id
LEFT JOIN Users u ON a.user_id = u.user_id;

-- Show all companies and their jobs (even if a company has no jobs yet)
SELECT
	c.company_id,
    c.name AS company_name,
    j.job_id,
    j.title AS job_title,
    j.location
FROM Jobs j
RIGHT JOIN Companies c ON j.company_id = c.company_id;

-- User referrals: Track who referred whom
ALTER TABLE Users ADD COLUMN referred_by INT;

SELECT 
	u.user_id,
    u.full_name AS refered_user,
    r.full_name AS referrer_name
FROM Users u
LEFT JOIN Users r ON U.referred_by = r.user_id;