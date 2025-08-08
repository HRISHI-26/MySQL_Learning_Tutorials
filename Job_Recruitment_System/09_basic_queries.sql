SELECT COUNT(*) AS total_jobs FROM Jobs;

SELECT COUNT(*) AS total_users FROM Users;

SELECT COUNT(*) AS total_applications from Applications;


SELECT company_id, COUNT(*) AS total_jobs
FROM Jobs
GROUP BY company_id;

-- Jobs with the Most Applicants
SELECT 
    j.job_id,
    j.title,
    COUNT(a.application_id) AS total_applications
FROM Applications a
JOIN Jobs j ON a.job_id = j.job_id
WHERE a.applied_at >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH)
GROUP BY j.job_id, j.title
HAVING total_applications > 3
ORDER BY total_applications DESC;


