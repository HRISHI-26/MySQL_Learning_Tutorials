DELIMITER $$

CREATE TRIGGER AfterEmployeeDelete
AFTER DELETE ON Employees
FOR EACH ROW
BEGIN
	INSERT INTO Deletelog (emp_name)
    VALUES (OLD.emp_name);
END $$

DELIMITER ;