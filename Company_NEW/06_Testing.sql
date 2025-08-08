-- Testing Stored Procedure
CALL AddEmployee('Frank', 80000, 3);

-- Testing Functions
SELECT emp_name, salary,CalculateBonus(salary) AS Bonus
FROM Employees;

-- Testing Trigger
DELETE FROM Employees WHERE emp_id = 3;



SELECT * FROM Employees;
SELECT * FROM Logtable;
SELECT * FROM DeleteLog;