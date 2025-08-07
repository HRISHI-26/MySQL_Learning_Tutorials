INSERT INTO Departments (dept_id, dept_name) VALUES
(101, 'HR'),
(102, 'Engineering'),
(103, 'Marketing');

INSERT INTO Employees (emp_id, emp_fname, emp_lname, dept_id, salary, hire_date) VALUES
(1, 'John', 'Doe', 101, 50000, '2020-01-15'),
(2, 'Jane', 'Smith', 102, 60000, '2019-03-10'),
(3, 'Alice', 'Johnson', 101, 55000, '2021-06-01'),
(4, 'Bob', 'Brown', 103, 48000, '2018-11-20');

INSERT INTO Projects (proj_id, proj_name, dept_id, start_date, end_date) VALUES
(1, 'Website Revamp', 101, '2022-01-01', '2022-06-30'),
(2, 'New App Dev', 102, '2022-02-15', NULL),
(3, 'Ad Campaign', 103, '2021-09-01', '2022-01-31');
