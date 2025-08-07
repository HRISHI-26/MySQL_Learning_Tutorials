DELIMITER $$
CREATE PROCEDURE AddEmployee(
	IN empName VARCHAR(50),
    IN empSalary INT,
    IN empDept INT
)
BEGIN
	INSERT INTO Employee(emp_name, salary, dept_id)
    VALUES (empName, empSalary, empDept);
    
    INSERT INTO Logtable (action_type, description)
    VALUES ('Insert', CONCATE('Added Employee: ',empName));
END $$
DELIMITER ;

CALL AddEmployee('John', 75000, 2);