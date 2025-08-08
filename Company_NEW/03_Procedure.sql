DELIMITER $$
CREATE PROCEDURE AddEmployee(
	IN empName VARCHAR(50),
    IN empSalary INT,
    IN empDept INT
)
BEGIN
	INSERT INTO Employees(emp_name, salary, dept_id)
    VALUES (empName, empSalary, empDept);
    
    INSERT INTO Logtable (action_type, description)
    VALUES ('Insert', CONCAT('Added Employee: ', empName));
END $$
DELIMITER ;

