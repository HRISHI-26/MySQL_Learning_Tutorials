-- INDEXING
CREATE INDEX idx_emp_id
ON Employees (emp_id, emp_fname);

-- SHOW PLAN
EXPLAIN SELECT * FROM Employee WHERE emp_id = 1;
-- RUN AND SHOW PLAN
EXPLAIN ANALYZE SELECT * FROM Employee WHERE emp_id = 1;

-- MYSQL
DROP INDEX idx_emp_id ON Employee;
-- POSTGRESQL ONLY
-- DROP INDEX idx_emp_id;
