-- DELIMITER $$
-- CREATE PROCEDURE p_name()
-- BEGIN
-- 	SELECT * FROM Employee;
-- END $$
-- DELIMITER ;

-- CALL p_name();
-- ====================================================================

-- DELIMITER $$
-- CREATE PROCEDURE p_insert(
-- 	IN id INT,
--     IN e_name VARCHAR(100),
--     IN sal INT
-- )
-- BEGIN
-- 	INSERT INTO Employee (emp_id, emp_name, salary)
--     VALUES(
-- 			id,
--         e_name,
--         sal
--     );
-- END $$
-- DELIMITER ;

-- CALL p_insert(6, 'Milan', 35000);
-- ====================================================================

-- DROP PROCEDURE p_name;
-- DROP PROCEDURE p_insert;