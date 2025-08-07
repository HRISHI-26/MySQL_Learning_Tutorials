CREATE DATABASE companyDB;
USE companyDB;

CREATE TABLE Employee(
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary INT NOT NULL,
    dept_id INT NOT NULL
);

CREATE TABLE Logtable(
	log_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(50),
    description TEXT,
    log_text TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Deletelog(
	log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

