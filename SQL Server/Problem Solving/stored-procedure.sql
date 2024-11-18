USE TESTING;

CREATE TABLE student(
id INT,
name VARCHAR(50),
email VARCHAR(50),
address VARCHAR(50)
);

INSERT INTO student(id, name, email, address)
VALUES 
(222311057, 'SOHEL RANA', 'sohelrana110979@gmail.com', 'Godagari, Rajshahi'),
(222311063, 'FAHIM RAHMAN', 'fahim0073@gmail.com', 'Chuadanga, Kushtia'),
(222311051, 'SABIT RAIHAN', 'sabit51@gmail.com', 'Uposhohor, Rajshahi');

SELECT *
FROM student;

DROP TABLE student;

/*----create stored procedure-------*/
CREATE PROC spStudent
AS
BEGIN
 SELECT * 
 FROM student
END;

/*-----execute stored procedure------*/
EXEC spStudent;

/*---------alter stored procedure--------*/
ALTER PROC spStudent
AS
BEGIN
 SELECT * 
 FROM student 
 ORDER BY id;
END;

/*-----execute stored procedure------*/
EXEC spStudent;


/*-------drop stored procedure----------*/
DROP PROC spStudent;


/*---------view stored procedure-------*/
sp_helptext spStudent;


/*-----encrypted stored procedure------*/
ALTER PROC spStudent
WITH ENCRYPTION
AS
BEGIN
 SELECT * 
 FROM student 
 ORDER BY id;
END;

/*-----execute stored procedure------*/
EXEC spStudent;


/*---------view stored procedure-------*/
sp_helptext spStudent;
/* NOTE: output : The text for object 'spStudent' is encrypted.*/