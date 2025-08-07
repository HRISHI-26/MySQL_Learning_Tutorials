-- CREATE DATABASE companyA;
-- USE companyA;
-- CREATE TABLE Employee(
-- 	emp_id INT PRIMARY KEY,
--     emp_name VARCHAR(100),
--     salary INT,
--     dept VARCHAR(100)
-- );

-- ALTER TABLE Employee
-- ADD COLUMN joined_on DATE;

-- INSERT INTO Employee (emp_id, emp_name, salary, dept, joined_on)
-- VALUES (1, 'John', 10000, 'HR', '2025-01-01'),
-- (2, 'Alex', 20000, 'Developer', '2025-03-01'),
-- (3, 'Bob', 25000, 'Developer', '2025-03-04');

-- UPDATE Employee
-- SET salary = 30000
-- WHERE emp_id = 2;

-- SELECT AVG(salary)
-- FROM Employee
-- GROUP BY dept;

-- SELECT dept, AVG(salary)
-- FROM Employee
-- GROUP BY dept
-- HAVING COUNT(emp_name) >= 5;

SELECT emp_name, salary
FROM Employee E
WHERE salary > (
	SELECT AVG(salary)
    FROM Employee 
    WHERE dept = E.dept
);