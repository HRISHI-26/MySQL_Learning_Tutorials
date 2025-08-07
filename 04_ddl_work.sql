-- 1: Alter the Employees table to add a column email.
ALTER TABLE Employees
ADD COLUMN email VARCHAR(100) UNIQUE NOT NULL;

-- 2: Drop the Projects table.
DROP TABLE Projects;

-- 3: Rename the Departments table to Depts.
RENAME TABLE Departments TO Depts;
RENAME TABLE Depts TO Departments;

-- 4: Change the datatype of salary column to FLOAT.
ALTER TABLE Employees
MODIFY COLUMN salary FLOAT;
