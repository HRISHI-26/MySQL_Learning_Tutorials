-- 1:Show employees with their department names. (INNER JOIN)
SELECT E.emp_id, E.emp_fname, E.emp_lname, D.dept_name
FROM Employees E
INNER JOIN Departments D
ON E.dept_id = D.dept_id;

-- 2: List all departments and any employees in them. (LEFT JOIN)
SELECT D.dept_id, D.dept_name, E.emp_fname, E.emp_lname
FROM Departments D
LEFT JOIN Employees E
ON D.dept_id = E.dept_id;

-- 3: Show projects along with department names. (JOIN Projects & Departments)
SELECT P.proj_name, D.dept_name
FROM Projects P
INNER JOIN Departments D
ON D.dept_id = P.dept_id;

-- 4: Show all employees who are not part of any department. (RIGHT JOIN or LEFT JOIN with NULL filter)
SELECT E.emp_fname, E.emp_lname
FROM Employees E
LEFT JOIN Departments D
ON E.dept_id = D.dept_id
WHERE D.dept_id IS NULL;

