-- DELIMITER $$

-- CREATE TRIGGER after_user_insert
-- AFTER INSERT ON Employee
-- FOR EACH ROW
-- BEGIN
-- 	INSERT INTO emp_log(emp_id, name)
--     VALUES (NEW.emp_id, NEW.emp_name); 
-- END $$

-- DELIMITER ;

-- INSERT INTO Employee(emp_id, emp_name, salary, dept, joined_on) 
-- VALUES(5, 'Helen', 25000, 'HR', '2025-01-25');


DELIMITER $$
CREATE PROCEDURE GetEmployeeByDept(IN dept_id INT)
BEGIN
    SELECT * FROM Employees WHERE DepartmentID = dept_id;
END $$
DELIMITER ;

CALL GetEmployeeByDept(2);
SELECT * FROM emp_log;
