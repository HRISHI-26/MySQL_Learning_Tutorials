-- 1: Find the employee(s) with the highest salary. (Subquery in WHERE)
SELECT * FROM Employees
WHERE salary = (
	SELECT MAX(salary) 
    FROM Employees
);

-- 2: List employees who earn more than the average salary. (Subquery with AVG)
SELECT * FROM Employees
WHERE salary > (
	SELECT AVG(salary) 
    FROM Employees
);

-- 3: Get departments where no employee is assigned. (Subquery with NOT IN)
SELECT dept_name
FROM Departments
WHERE dept_id NOT IN(
	SELECT dept_id 
    FROM Employees
    WHERE dept_id IS NOT NULL
);

-- 4:Find employees who joined after the employee with emp_id = 1. (Correlated subquery)
SELECT * FROM Employees
WHERE hire_date > (
	SELECT hire_date 
    FROM Employees
    WHERE emp_id = 1
);
