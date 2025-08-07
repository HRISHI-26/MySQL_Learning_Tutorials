CREATE DATABASE work;
USE work;

CREATE TABLE Departments(
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);
CREATE TABLE Employees(
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_fname VARCHAR(100),
    emp_lname VARCHAR(100),
    dept_id INT,
    salary INT,
    hire_date date,
    CONSTRAINT fk_const FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
CREATE TABLE Projects(
	proj_id INT PRIMARY KEY,
    proj_name VARCHAR(100),
    dept_id INT,
    start_date DATE,
    end_date DATE,
    CONSTRAINT fk_const FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- TRUNCATE TABLE Employees;
-- TRUNCATE TABLE Departments;
-- TRUNCATE TABLE Projects;

-- DROP TABLE Employees;
-- DROP TABLE Departments;
-- DROP TABLE Projects;
-- DROP DATABASE work;