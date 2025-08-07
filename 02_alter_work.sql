ALTER TABLE Employees
ADD COLUMN is_correct BOOLEAN;

ALTER TABLE Employees
MODIFY COLUMN is_correct INT;

ALTER TABLE Employees
RENAME COLUMN is_correct TO is_active;

RENAME TABLE Employees TO Employee;
RENAME TABLE Employee TO Employees;

ALTER TABLE Employees
DROP COLUMN is_active;