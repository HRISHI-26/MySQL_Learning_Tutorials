DROP DATABASE IF EXISTS Job_Recruiter_System;
CREATE DATABASE Job_Recruiter_System;
USE Job_Recruiter_System;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    location VARCHAR(100),
    resume TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    industry VARCHAR(100),
    location VARCHAR(100),
    website VARCHAR(255)
);

CREATE TABLE Jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(100),
    salary_range VARCHAR(50),
    job_type ENUM('Full-time', 'Part-time', 'Internship', 'Contract'),
    available_positions INT DEFAULT 5,
    posted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (company_id) REFERENCES Companies(company_id) ON DELETE CASCADE
);

CREATE TABLE Applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    job_id INT,
    applied_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Applied', 'Reviewed', 'Interviewed', 'Offered', 'Rejected') DEFAULT 'Applied',
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id) ON DELETE CASCADE,
    UNIQUE (user_id, job_id)  -- Prevent duplicate applications
);

CREATE TABLE Interviews (
    interview_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT,
    interview_date DATETIME NOT NULL,
    mode ENUM('Online', 'Offline', 'Phone'),
    interviewer VARCHAR(100),
    notes TEXT,
    FOREIGN KEY (application_id) REFERENCES Applications(application_id) ON DELETE CASCADE
);


CREATE TABLE Skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE UserSkills (
    user_id INT,
    skill_id INT,
    proficiency ENUM('Beginner', 'Intermediate', 'Advanced') DEFAULT 'Beginner',
    PRIMARY KEY (user_id, skill_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id) ON DELETE CASCADE
);

-- Users ───< Applications >─── Jobs >─── Companies  
--   │                             
--   └──< UserSkills >─── Skills  

-- Applications ───< Interviews
