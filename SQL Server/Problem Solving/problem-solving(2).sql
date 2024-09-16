CREATE DATABASE Worker;

CREATE TABLE workerInfo(
worker_id int primary key,
first_name varchar(20),
last_name varchar(20),
salary int,
dept_name varchar(20),
joining_date varchar(20)
);

SELECT * 
FROM workerInfo;

TRUNCATE TABLE workerInfo;



INSERT INTO workerInfo(worker_id, first_name,last_name, salary, dept_name, joining_date)
VALUES
(1, 'Rana', 'Hamid', 100000, 'HR', '2014-02-20 09:00:00'),
(2, 'Sanjoy', 'Saha', 80000, 'Admin', '2014-06-11 09:00:00'),
(3, 'Mahmudul', 'Hasan', 300000, 'HR', '2014-02-20 09:00:00'),
(4, 'Asad', 'Zaman', 500000, 'Admin', '2014-02-20 09:00:00'),
(5, 'Sajib', 'Mia', 500000, 'Admin', '2014-06-11 09:00:00'),
(6, 'Alamgir', 'Kabir', 200000, 'Account', '2014-06-11 09:00:00'),
(7, 'Foridul', 'Islam', 75000, 'Account', '2014-01-20 09:00:00'),
(8, 'Keshob' ,'Ray', 90000, 'Admin' , '2014-04-11 09:00:00');


/*------
Write an SQL query to print first three characters of FIRST_NAME from Worker table.
-------*/
SELECT SUBSTRING(first_name, 1,3) AS FirstThreeChar
FROM workerInfo;


/*------
Write an SQL query to print details of the Workers who have joined from Feb 2014 to
March 2014.
-------*/
SELECT *
FROM workerInfo
WHERE joining_date 
BETWEEN '2014-02-01' AND '2014-03-01';


/*------
Write an SQL query to print details of the Workers who have served for at least 6 months.
--------*/
SELECT *
FROM workerInfo
WHERE DATEDIFF(MONTH, joining_date, GETDATE()) >= 6;


/*----------
Write an SQL query to update all worker salary 10% whose dept is Admin.
----------*/
UPDATE workerInfo
SET salary = salary + (salary * 0.1)
WHERE dept_name = 'Admin';


/*--------
Write an SQL query to update all worker bonus 10% whose joining_date before �2014-
04-11 09:00:00� otherwise bonus update 5% and also check department name is �Admin�.
---------*/
UPDATE workerInfo
SET salary = salary *
	CASE
		WHEN joining_date < '2014-04-11 09:00:00' THEN 1.10
		ELSE 1.05
	END
WHERE dept_name = 'Admin';


/*-----------
Write an SQL query to print details for Workers with the first name �Rana� and �Sajib�
from Worker table.
---------*/
--1ST method
SELECT * 
FROM workerInfo
WHERE first_name BETWEEN 'Rana' AND 'Sajib';

--2nd method
SELECT * 
FROM workerInfo
WHERE first_name = 'Rana' OR first_name = 'Sajib';

--3rd method
SELECT * 
FROM workerInfo
WHERE first_name IN('Rana', 'Sajib');


/*------
Write an SQL query to print details of workers excluding first names, �Rana� and �Sajib�
from Worker table.
---------*/
SELECT *
FROM workerInfo
WHERE first_name NOT IN('Rana', 'Sajib');


/*----------
Write an SQL query to print details of the Workers whose FIRST_NAME contains �a�
-----------*/
SELECT *
FROM workerInfo
WHERE first_name LIKE '%a%';


/*--------
Write an SQL query to print details of the Workers whose FIRST_NAME starts with "k".
----------*/
SELECT *
FROM workerInfo
WHERE first_name LIKE 'k%';


/*
Write an SQL query to print details of the Workers whose FIRST_NAME ends with "r" and contains seven alphabets
*/
SELECT *
FROM workerInfo
WHERE first_name LIKE '%r'
AND DATALENGTH(first_name) = 7;


/*-------
Write an SQL query to find the position of the alphabet (n) in the FIRST_NAME column "Sanjoy" from Worker table
---------*/
SELECT CHARINDEX('n', first_name) AS PositionOfN
FROM workerInfo
WHERE first_name = 'Sanjoy'


/*-----------
Find the average salary of employees for each department
-----------*/
SELECT dept_name, 
AVG(salary) AS AverageSalary
FROM workerInfo
GROUP BY dept_name;


/*----------
List all the employees who have maximum or minimum salary in each department
----------*/

SELECT dept_name,
MAX(salary) AS MaxSalary,
MIN(salary) AS MinSalary
FROM workerInfo
GROUP BY dept_name;


/*---------
Write an SQL query to find the position of the alphabet (�r�) in the FIRST_NAME
column �Rana� from Worker table.
---------*/
SELECT CHARINDEX('r', first_name) AS PosotionOfR
FROM workerInfo
WHERE first_name = 'Rana';


/*--------
Write an SQL query to print the FIRST_NAME from Worker table after removing white
spaces from the right side.
----------*/
SELECT RTRIM(first_name) AS RemoveWhiteSpaceFromRighSide
FROM workerInfo;


/*---------
Write an SQL query that fetches the unique values of FIRST_NAME from Worker table
and prints its length.
-----------*/
SELECT DISTINCT first_name, LEN(first_name) AS First_name_Length
FROM workerInfo;


/*---------
Write an SQL query to print the FIRST_NAME from Worker table after replacing �a�
with �A�.
----------*/
SELECT first_name,
REPLACE(first_name, 'a', 'A') AS AfterReplacing
FROM workerInfo;