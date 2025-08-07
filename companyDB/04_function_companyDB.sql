DELIMITER $$

CREATE FUNCTION cal_bonus(salary INT)
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN salary * 0.2;
END $$

DELIMITER ;

SELECT emp_name, salary, cal_bonus(salary) AS bonus
FROM Employee;