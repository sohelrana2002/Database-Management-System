CREATE DATABASE ASSIGNMENT_2;

USE ASSIGNMENT_2;

CREATE TABLE Worker(
WORKER_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
SALARY INT,
JOINING_DATE VARCHAR(50),
DEPARTMENT VARCHAR(50)
);

CREATE TABLE Bonus(
WORKER_REF_ID INT PRIMARY KEY,
BONUS_DATE VARCHAR(50),
BONUS_AMOUNT INT
);

CREATE TABLE Title(
WORKER_REF_ID INT PRIMARY KEY,
WORKER_TITLE VARCHAR(50),
AFFECTED_FROM VARCHAR(50)
);

INSERT INTO Worker(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
(1, 'Rana', 'Hamid', 100000, '2014-02-20', 'HR'),
(2, 'Sanjoy', 'Saha', 80000, '2014-06-11', 'Admin'),
(3, 'Mahmudul', 'Hasan', 300000, '2014-02-20', 'HR'),
(4, 'Asad', 'Zaman', 500000, '2014-02-20', 'Admin'),
(5, 'Sajib', 'Mia', 500000, '2014-06-11', 'Admin'),
(6, 'Alamgir', 'Kabir', 200000, '2014-06-11', 'Account'),
(7, 'Foridul', 'Islam', 75000, '2014-01-20', 'Account'),
(8, 'Keshob', 'Ray', 90000, '2014-04-11', 'Admin');


SELECT *
FROM Worker;

INSERT INTO Bonus(WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT)
VALUES
(1, '2019-02-20', 5000),
(2, '2019-06-11', 3000),
(3, '2019-02-20', 4000),
(4, '2019-02-20', 4500),
(5, '2019-06-11', 3500),
(6, '2019-06-12', NULL);SELECT *FROM Bonus;INSERT INTO Title(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM )VALUES(1, 'Manager', '2019-02-20'),
(2, 'Executive', '2019-06-11'),
(8, 'Executive', '2019-06-11'),
(5, 'Manager', '2019-06-11'),
(4, 'Asst. Manager', '2019-06-11'),
(7, 'Executive', '2019-06-11'),
(6, 'Lead', '2019-06-11'),
(3, 'Lead', '2019-06-11');SELECT *FROM Title;

/*--
1. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case
---*/
SELECT UPPER(FIRST_NAME)
FROM Worker;


/*---
2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table
---*/
SELECT DISTINCT DEPARTMENT
FROM Worker


/*---
3. Write an SQL query to find the position of the alphabet (‘a’) in the first
name column ‘Sanjoy’ from Worker table
---*/
SELECT CHARINDEX('a', FIRST_NAME) AS Position
FROM Worker
WHERE FIRST_NAME = 'Sanjoy';


/*---
4. Write an SQL query to print details of the Workers whose FIRST_NAME
ends with ‘b’ and contains at least three alphabets
---*/
SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '%b' AND LEN(FIRST_NAME) >= 3;


/*---
5. Write an SQL query to print the FIRST_NAME from Worker table after
replacing 'a' with 'A'
---*/
SELECT FIRST_NAME, REPLACE(FIRST_NAME, 'a', 'A') AS After_Replacing
FROM Worker;


/*---
6. Write an SQL query to print details for Workers with the first name as 
"Asad" and "Sajib" from Worker table
---*/
SELECT *
FROM Worker
WHERE FIRST_NAME IN('Asad', 'Sajib');


/*---
7. Write an SQL query to print details of the Workers who have joined 6 months ago
---*/
SELECT *
FROM Worker
WHERE DATEDIFF(MONTH, JOINING_DATE, GETDATE()) >= 6;


/*---
8. Write an SQL query to show all departments along with the number of
people in there
---*/
SELECT DEPARTMENT, COUNT(*) AS Total_Person_In_Each_Department
FROM Worker
GROUP BY DEPARTMENT


/*---
9. Write an SQL query to fetch the departments that have less than five
people in it
---*/
SELECT DEPARTMENT, COUNT(*) AS Total_Person_In_Each_Department
FROM Worker
GROUP BY DEPARTMENT
HAVING COUNT(*) < 5;


/*---
10. Write an SQL query to print details of the Workers who are also
Managers
---*/
SELECT Worker.*, tempTitle.WORKER_TITLE, tempTitle.AFFECTED_FROM
FROM Worker
INNER JOIN 
(SELECT * FROM Title) AS tempTitle
ON Worker.WORKER_ID = tempTitle.WORKER_REF_ID
WHERE tempTitle.WORKER_TITLE = 'Manager';


*---
11. List all the employees except 'Manager' & 'Asst. Manager'
---*/
SELECT Worker.*, tempTitle.WORKER_TITLE, tempTitle.AFFECTED_FROM
FROM Worker
INNER JOIN 
(SELECT * FROM Title) AS tempTitle
ON Worker.WORKER_ID = tempTitle.WORKER_REF_ID
WHERE tempTitle.WORKER_TITLE NOT IN('Manager', 'Asst. Manager');


/*---
12. Write an SQL query to determine the nth (say n=5) highest salary from a table
---*/
SELECT DISTINCT SALARY
FROM Worker
ORDER BY SALARY DESC
OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;


/*---
13. Write an SQL query to fetch the last five records from a table
---*/
SELECT TOP 5 *
FROM Worker
ORDER BY WORKER_ID DESC;


/*---
14. Write an SQL query to print the name of employees having the highest
salary in each department
---*/
SELECT FIRST_NAME + ' ' + LAST_NAME AS Full_Name, tempTable.DEPARTMENT, 
tempTable.Max_Salary
FROM Worker
INNER JOIN
(SELECT DEPARTMENT, MAX(SALARY) AS Max_Salary
FROM Worker
GROUP BY DEPARTMENT) AS tempTable
ON Worker.DEPARTMENT = tempTable.DEPARTMENT 
	AND Worker.SALARY = tempTable.Max_Salary;


/*---
15. Write an SQL query to fetch three max salaries from table
---*/
SELECT DISTINCT TOP 3 SALARY
FROM Worker
ORDER BY SALARY DESC



/*---2nd part query----*/
CREATE TABLE Zone (
    Zone_Id VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(255)
);


CREATE TABLE Branch (
    Br_Id VARCHAR(50) PRIMARY KEY,
    Branch_Name VARCHAR(255),
);


CREATE TABLE Account_Detail(
    Account_no INT PRIMARY KEY,
    Acc_holder_name VARCHAR(255),
    Amount INT,
    Branch_Id VARCHAR(50) FOREIGN KEY REFERENCES Branch(Br_Id),
	Zone_Id VARCHAR(50) FOREIGN KEY REFERENCES Zone(Zone_Id)
); 


INSERT INTO Zone(Zone_Id, Name)
VALUES 
('Z-801','Sirajgonj' ),
('Z-802','Rajshahi'),
('Z-803','Dhaka'),
('Z-804','Chitagong');

SELECT *
FROM Zone;

INSERT INTO Branch(Br_Id, Branch_Name)
VALUES 
('B-101','Bonani'),
('B-102','Romna'),
('B-103', 'Shaheb bazar'),
('B-104', 'Ullapara');

SELECT *
FROM Branch;


INSERT INTO Account_Detail( Account_no, Acc_holder_name, Amount,Branch_Id, Zone_Id)
VALUES
(1992212,'Mr. Nazmuzzaman',200000,'B-101', 'Z-803'),
(1992213,'Mr. Jibon', 170000, 'B-102', 'Z-803'), 
(1882212, 'Bushra',180000,'B-103', 'Z-802'), 
(1882213, 'Sajib', 170000, 'B-104', 'Z-801');

SELECT *
FROM Account_Detail;


/*---
1. Create a simple stored procedure “SPdetails” to find Acc_holder_name, 
Amount, Branch_Name and Zone_Name
---*/
CREATE PROC SPdetails
AS
BEGIN
    SELECT Acc_holder_name,  Amount, tempBranch.Branch_Name, tempZone.Name
	FROM Account_Detail
	INNER JOIN
	(SELECT * FROM Branch) AS tempBranch
	ON Account_Detail.Branch_Id = tempBranch.Br_Id
	INNER JOIN
	(SELECT * FROM Zone) AS tempZone
	ON Account_Detail.Zone_Id = tempZone.Zone_Id
END;

EXEC SPdetails;


/*---
2. Create a simple stored procedure “SPaverage” to Branch _name and Amount of Branch
---*/
CREATE PROC SPaverage
AS
BEGIN
	SELECT tempBranch.Branch_Name,  Amount
	FROM Account_Detail
	INNER JOIN
	(SELECT * FROM Branch) AS tempBranch
	ON Account_Detail.Branch_Id = tempBranch.Br_Id
END;

EXEC SPaverage;

/*---
3. Create a simple stored procedure “SPbalance” to find Amount of each Account_no
---*/
CREATE PROC SPbanalce
AS
BEGIN
	SELECT Account_no, Amount
	FROM Account_Detail
END;

EXEC SPbanalce;


/*---
4. Create a simple stored procedure “SPamount” to Find all account holders name with 
their branch name and zone name whose name has substring 'Mr.' 
and Amount Less than Maximum Amount
---*/
CREATE PROC SPamount
AS
BEGIN
	SELECT Acc_holder_name, tempBranch.Branch_Name, tempZone.Name
	FROM Account_Detail
	INNER JOIN
	(SELECT * FROM Branch) AS tempBranch
	ON Account_Detail.Branch_Id = tempBranch.Br_Id
	INNER JOIN
	(SELECT * FROM Zone) AS tempZone
	ON Account_Detail.Zone_Id = tempZone.Zone_Id
	WHERE Acc_holder_name LIKE '%Mr%'
	AND Amount < (SELECT MAX(Amount) FROM Account_Detail)
END;

EXEC SPamount;


/*---
5. Create a simple stored procedure “SPdetailsInfo” to find Zone_name, 
number of customer of each Zone
---*/
CREATE PROC SPdetailsInfo
AS
BEGIN
	SELECT tempZone.Name, COUNT(*) AS No_Of_Customer_Each_Zone
	FROM Account_Detail
	INNER JOIN
	(SELECT * FROM Zone) AS tempZone
	ON Account_Detail.Zone_Id = tempZone.Zone_Id
	GROUP BY tempZone.Name
END;

EXEC SPdetailsInfo;