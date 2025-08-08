-- Find the highest-paying job in a given company (e.g., 'TechNova')
SELECT job_id, title, salary_range
FROM Jobs
WHERE company_id = (
	SELECT company_id
    FROM Companies
    WHERE name = 'Technova'
)
ORDER BY salary_range DESC
LIMIT 1;

-- Find users who applied for jobs in a specific company (e.g. 'TechNova')
SELECT full_name, email
FROM Users
WHERE user_id IN (
	SELECT a.user_id
    FROM Applications a 
    JOIN Jobs j ON a.job_id = j.job_id
    JOIN Companies c ON j.company_id = c.company_id
    WHERE c.name = 'Technova'
);

-- Find jobs with more than 5 applications
SELECT job_id, title
FROM Jobs j
WHERE (
	SELECT COUNT(*)
    FROM Applications a
    WHERE a.job_id = j.job_id
) > 5;
