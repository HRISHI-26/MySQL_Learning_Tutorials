CREATE DATABASE university;
USE university;
CREATE TABLE Student(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_fname VARCHAR(100),
    student_lname VARCHAR(100),
    dob DATE,
    email VARCHAR(20),
    gender ENUM('male', 'female', 'other'),
    major VARCHAR(100),
    stipend INT
);