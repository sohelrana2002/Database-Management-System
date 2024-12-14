CREATE DATABASE UDF;

USE UDF;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50),
dateOfBirth VARCHAR(50)
);

INSERT INTO student(id, name, dateOfBirth)
VALUES
(1, 'SOHEL RANA', '2002-06-03'),
(2, 'FAHIM RAHMAN', '2003-01-16'),
(3, 'SABIT RAIHAN', '2004-12-09');

SELECT *
FROM student;

DROP TABLE student;

/* scalar funstion */
CREATE FUNCTION CalculationSalary(@salary FLOAT)
RETURNS FLOAT
AS
BEGIN
	DECLARE @MaxSalary FLOAT
	SET @MaxSalary = MAX(@salary) * 100
	RETURN @MaxSalary
END;

/* scalar funstion calling */
SELECT dbo.CalculationSalary(50) AS Max_Salary;

/* drop syntax in function  */
DROP FUNCTION CalculationSalary;


/*---calcute age from date of birth fom tabl---*/
CREATE FUNCTION CalculateAge(@dateOfBirth VARCHAR(50))
RETURNS FLOAT
AS
BEGIN
	DECLARE @age FLOAT
	SET @age = DATEDIFF(YEAR, @dateOfBirth, GETDATE())
	RETURN @age
END;

/* ---get result ----*/
SELECT name, dateOfBirth, dbo.CalculateAge(dateOfBirth) AS Age
FROM student;



/*---inline table valued function*/
CREATE FUNCTION fnID(@id INT)
RETURNS TABLE
AS
RETURN(SELECT * FROM student WHERE id = @id)

/*call the function*/
SELECT *
FROM fnID(1);



/*---inline table valued function*/
CREATE FUNCTION fnTable()
RETURNS TABLE
AS
RETURN(SELECT name, dateOfBirth, dbo.CalculateAge(dateOfBirth) AS Age
FROM student)

/*call the function*/
SELECT *
FROM fnTable();



/*---Multi-Statement Table valued function---*/
CREATE FUNCTION fnMSTVF()
RETURNS @fnTable TABLE(id INT, name VARCHAR(50), dateOfBirth DATE)
AS
BEGIN
	INSERT INTO @fnTable
	SELECT id, name, CAST(dateOfBirth AS DATE)
	FROM student

	RETURN
END;

/*---Execution MSTVF---*/
SELECT *
FROM fnMSTVF();