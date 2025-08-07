CREATE DATABASE university;
USE university;

CREATE TABLE Students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    email VARCHAR(50),
	enroll_date DATE
);


CREATE TABLE Courses(
	course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    dept_name VARCHAR(100),
    credits INT DEFAULT 3
);

CREATE TABLE Enrollments(
	enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade VARCHAR(10),
    CONSTRAINT f_const10 FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT f_const11 FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
