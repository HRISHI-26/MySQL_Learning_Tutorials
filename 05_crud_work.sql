							-- INSERT
-- 1:  Insert 3 more employees into the Employees table.
INSERT INTO Employees (emp_id, emp_fname, emp_lname, dept_id, salary, hire_date)
VALUES (5, 'James', 'Killer', 103, 58000, '2020-12-20'),
(6, 'Karl', 'Smith', 101, 65000, '2021-08-04'),
(7, 'George', 'Will', 102, 51500, '2022-04-04');

-- 2: Insert a new project assigned to dept_id = 102.
INSERT INTO Projects (proj_id, proj_name, dept_id, start_date, end_date)
VALUES (4, 'Sales Forecasting', 102, '2023-01-15', '2023-07-10');

-- 3: Add a new employee named Samantha Carter to the Engineering department with a salary of 65000 and hire date '2022-08-01'.
INSERT INTO Employees (emp_id, emp_fname, emp_lname, dept_id, salary, hire_date)
VALUES (8, 'Samantha', 'Carter', 102, 65000, '2022-08-01');

-- 4: Insert two new departments: Finance (id: 104) and Support (id: 105).
INSERT INTO Departments (dept_id, dept_name)
VALUES (104, 'Finance'),
(105, 'Support');

-- 5: Add a project named Cloud Migration for the Finance department, starting on '2023-01-01'.
INSERT INTO Projects (proj_id, proj_name, dept_id, start_date, end_date)
VALUES (5, 'Cloud Migration', 104, '2023-01-01', NULL);

-- 6: Insert an employee without a department (set dept_id as NULL) to test JOINs later.
INSERT INTO Employees (emp_id, emp_fname, emp_lname, dept_id, salary, hire_date)
VALUES (9, 'Will', 'Smith', NULL, 48500, '2022-11-05');


							-- SELECT 
-- 1: Select all employees.
SELECT * FROM Employees;

-- 2: Select the first and last name of employees with salary more than 50,000.
SELECT emp_fname, emp_lname 
FROM Employees
WHERE salary > 50000;

-- 3:Display all departments.
SELECT * FROM Departments;

-- 4: List only first_name, last_name, and salary of all employees.
SELECT emp_fname, emp_lname, salary
FROM Employees;

-- 5: Display all employees who earn more than 55,000.
SELECT * FROM Employees
WHERE salary > 55000;

-- 6: Show all employees hired after '2020-01-01'.
SELECT * FROM Employees
WHERE hire_date > '2020-01-01';

-- 7: Find employees in the Marketing department.
SELECT emp_fname, emp_lname FROM Employees
WHERE dept_id = (
	SELECT dept_id 
    FROM Departments
    WHERE dept_name = 'Marketing'
);

-- 8: Find employees who don't belong to any department.
SELECT emp_fname, emp_lname 
FROM Employees
WHERE dept_id IS NULL;

-- 9: List employees with salary between 50,000 and 60,000.
SELECT * FROM Employees
WHERE salary BETWEEN 50000 AND 60000;

-- 10: Show all employees whose first name starts with "J".
SELECT * FROM Employees
WHERE emp_fname LIKE 'J%';

-- 11: List employees ordered by salary descending.
SELECT * FROM Employees
ORDER BY salary DESC;

-- 12: Retrieve top 2 highest paid employees.
SELECT * FROM Employees
ORDER BY salary DESC
LIMIT 2;


							-- UPDATE
-- 1: Update the salary of 'Alice' to 60000.
UPDATE Employees 
SET salary = 60000
WHERE emp_fname = 'Alice';

-- 2: Set end_date for project "New App Dev" to '2022-12-31'.
UPDATE Projects
SET end_date = '2022-12-31'
WHERE proj_name = 'New App Dev';

-- 3: Increase salary of all employees by 10%.
UPDATE Employees
SET salary = salary + (salary *0.1);

-- 4:Change the department of Bob Brown to Finance.
UPDATE Employees
SET dept_id = (
	SELECT dept_id 
	FROM Departments
	WHERE dept_name = 'Finance'
    )
WHERE emp_fname = 'Bob' AND emp_lname = 'Brown';

-- 5: Set end_date of project 'New App Dev' to '2023-12-31'.
UPDATE Projects
SET end_date = '2023-12-31'
WHERE proj_name = 'New App Dev';

-- 6: Update all NULL end dates in the Projects table to '2024-01-01'.
UPDATE Projects
SET end_date = '2024-01-01'
WHERE end_date IS NULL;

-- 7: Rename project 'Ad Campaign' to 'Digital Ad Campaign'.
UPDATE Projects
SET proj_name = 'Digital Ad Campaign'
WHERE proj_name = 'Ad Campaign';

-- 8: Increase salary by 5000 for all employees in HR.
UPDATE Employees
SET salary = salary + 5000
WHERE dept_id = (
	SELECT dept_id
    FROM Departments
    WHERE dept_name = 'HR'
);


							-- DELETE
-- 1: Delete employees hired before 2019.
DELETE FROM Employees
WHERE hire_date < '2019-01-01';

-- 2: Delete the employee named 'John Doe'.
DELETE FROM Employees
WHERE emp_fname = 'John' AND emp_lname = 'Doe';

-- 3: Delete all employees in the Marketing department.
DELETE FROM Employees
WHERE dept_id = (
	SELECT dept_id
    FROM Departments
    WHERE dept_name = 'Marketing'
);

-- 4: Remove all projects that ended before '2022-01-01'.
DELETE FROM Projects
WHERE end_date < '2022-01-01';

-- 5: Delete all records from Employees who were hired before '2019-01-01'.
DELETE FROM Employees
WHERE hire_date < '2019-01-01';

-- 6: Delete all departments where no employees are assigned.
DELETE FROM Departments
WHERE dept_id NOT IN (
	SELECT dept_id
    FROM Employees
	WHERE dept_id IS NOT NULL
);


								-- MIXED TYPE QNS
-- 1: Insert a new department called IT, then assign all NULL-department employees to this new department.
INSERT INTO Departments (dept_id, dept_name)
VALUES (104, 'IT');
UPDATE Employees
SET dept_id = (
	SELECT dept_id
    FROM Departments
    WHERE dept_name = 'IT'
)
WHERE dept_id IS NULL;

-- 2: Promote employees earning less than 50,000 by assigning them to Engineering and raising salary to 55,000.
UPDATE Employees
SET dept_id = 102, salary = 55000
WHERE salary < 50000 AND (dept_id != 102 OR salary != 55000);