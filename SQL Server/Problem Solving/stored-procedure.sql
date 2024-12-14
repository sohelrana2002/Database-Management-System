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
(222311051, 'SABIT RAIHAN', 'sabit51@gmail.com', 'Uposhohor, Rajshahi'),
(222311051, 'SABIT RAIHAN', 'sabit51@gmail.com', 'Cposhohor, Rajshahi');

SELECT *
FROM student;

DROP TABLE student;

/*---create culustered index----*/
CREATE CLUSTERED INDEX student_id
ON student (id ASC, address ASC);

/*---check any index have or not----*/
EXEC sp_helpindex student;


/*---drop index---*/
DROP INDEX student.student_id;

/*---composite clustered index ---*/
CREATE CLUSTERED INDEX IX_student
ON student(address ASC, id ASC);


TRUNCATE TABLE student;

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
EXEC sp_helptext spStudent;
/* NOTE: output : The text for object 'spStudent' is encrypted.*/


/*----output parameter stored procedure----*/
CREATE PROC outputParameterStudent
@Email VARCHAR(50),
@StudentCount INT OUTPUT
AS
BEGIN
	SELECT @StudentCount = COUNT(*)
	FROM student
	WHERE email = @Email
END;


/* -----execution stored procedure----*/
DECLARE @TotalCount INT
EXEC outputParameterStudent 'sohelrana110979@gmail.com', @TotalCount OUTPUT
PRINT @TotalCount;

/* -----execution stored procedure with condition----*/
DECLARE @TotalCount INT
EXEC outputParameterStudent 'sohelrana110979@gmail.com', @TotalCount 

IF(@TotalCount IS NULL)
	PRINT 'Empty'
ELSE
	PRINT @TotalCount;

/*Note: if we cant use OUTPUT KEYWORD when EXEC then get null value*/
/* result: Empty*/

/*--using sp_help view the information about stored procedure---*/
EXEC sp_help outputParameterStudent;


/*--view the dependency of the stored procedure---*/
EXEC sp_depends outputParameterStudent;

/* ----RETURN VALUE---*/
CREATE PROC returnStudent
AS
BEGIN
	RETURN(SELECT COUNT(*) FROM student)
END


/*---execute return value procedure--*/
DECLARE @result INT
EXEC @result = returnStudent
PRINT @result


/*---output parameter----*/
CREATE PROC outStudent
@id INT,
@Name VARCHAR(50) OUTPUT
AS
BEGIN
	SELECT @Name = name
	FROM student
	WHERE id = @id
END

/*--execute output parameter--*/
DECLARE @StudentName VARCHAR(50)
EXEC outStudent 222311057, @StudentName OUTPUT
PRINT 'Student Name Is: ' + @StudentName