CREATE DATABASE ASSIGNMENT;

USE ASSIGNMENT;


CREATE TABLE Registration (
  user_id INT PRIMARY KEY IDENTITY(1, 1),
  username VARCHAR(255),
  password VARCHAR(255),
  email VARCHAR(255),
  full_name VARCHAR(255),
  date_of_birth DATE,
  role VARCHAR(255),
  registration_date DATE
);


CREATE TABLE Log_In (
  login_id INT PRIMARY KEY IDENTITY(1, 1),
  email VARCHAR(255),
  password VARCHAR(255),
  role VARCHAR(255),
  login_ref_id INT FOREIGN KEY REFERENCES Registration(user_id)
);


CREATE TABLE Admin (
  admin_id INT PRIMARY KEY,
  role INT DEFAULT 0,
  admin_ref_id INT FOREIGN KEY REFERENCES Log_In(login_id),
);


CREATE TABLE Job_Seekers (
  job_seeker_id INT PRIMARY KEY,
  resume TEXT,
  skills TEXT,
  experience TEXT,
  role TEXT DEFAULT 2,
  job_seeker_ref_id1 INT FOREIGN KEY REFERENCES Log_In(login_id),
  job_seeker_ref_id2 INT FOREIGN KEY REFERENCES Admin(admin_id)
);


CREATE TABLE Recruiters (
  recruiter_id INT PRIMARY KEY,
  position VARCHAR(255),
  role INT DEFAULT 3,
  recruiter_ref_id1 INT FOREIGN KEY REFERENCES Log_In(login_id),
  recruiter_ref_id2 INT FOREIGN KEY REFERENCES Admin(admin_id)
);


CREATE TABLE Companies (
  company_id INT PRIMARY KEY IDENTITY(1, 1),
  name VARCHAR(255),
  address VARCHAR(255),
  industry VARCHAR(255),
  website VARCHAR(255),
  companies_ref_id1 INT FOREIGN KEY REFERENCES Recruiters(recruiter_id),
);


CREATE TABLE Jobs (
  job_id INT PRIMARY KEY IDENTITY(1, 1),
  title VARCHAR(255),
  description TEXT,
  requirements TEXT,
  salary DECIMAL,
  location VARCHAR(255),
  post_date DATETIME,
  status VARCHAR(255),
  jobs_ref_id1 INT FOREIGN KEY REFERENCES Companies(company_id)
);


CREATE TABLE Applications (
  application_id INT PRIMARY KEY IDENTITY(1, 1),
  application_date DATETIME,
  status VARCHAR(255),
  applications_ref_id1 INT FOREIGN KEY REFERENCES Job_Seekers(job_seeker_id),
  applications_ref_id2 INT FOREIGN KEY REFERENCES Jobs(job_id)
);


CREATE TABLE Job_Category_Assignments (
  assignment_id INT PRIMARY KEY IDENTITY(1, 1),
  job_Category_Assignments_ref_id2 INT FOREIGN KEY REFERENCES Jobs(job_id)
);


CREATE TABLE Job_Categories (
  category_id INT PRIMARY KEY IDENTITY(1, 1),
  name VARCHAR(255),
  description TEXT,
  job_Categories_ref_id2 INT FOREIGN KEY REFERENCES Job_Category_Assignments(assignment_id)
);


CREATE TABLE Saved_Jobs (
  saved_job_id INT PRIMARY KEY IDENTITY(1, 1),
  saved_date DATETIME,
  saved_Jobs_ref_id1 INT FOREIGN KEY REFERENCES Jobs(job_id),
  saved_Jobs_ref_id2 INT FOREIGN KEY REFERENCES Job_Seekers(job_seeker_id)
);


CREATE TABLE INTerviews (
  INTerview_id INT PRIMARY KEY IDENTITY(1, 1),
  INTerview_date DATETIME,
  INTerview_TIME TIME,
  location VARCHAR(255),
  status VARCHAR(255),
  INTerviews_ref_id INT FOREIGN KEY REFERENCES Applications(application_id),
  INTerviews_ref_id2 INT FOREIGN KEY REFERENCES Companies(company_id)
);


CREATE TABLE Job_Alerts (
  alert_id INT PRIMARY KEY IDENTITY(1, 1),
  location VARCHAR(255),
  created_date DATETIME,
  job_Alerts_ref_id2 INT FOREIGN KEY REFERENCES Job_Seekers(job_seeker_id)
);
