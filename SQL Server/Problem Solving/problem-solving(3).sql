create database Employee;

/*Worker table*/
create table Worker(
worker_id int,
first_name varchar(20),
last_name varchar(20),
salary int,
joining_date varchar(20),
department varchar(20)
);


insert into Worker(worker_id, first_name,last_name, salary, joining_date, department)
values
(1, 'Rana', 'Hamid', 100000, '2014-02-20', 'HR'),
(2, 'Sanjoy', 'Saha', 80000, '2014-06-11', 'Admin'),
(3, 'Mahamudul', 'Hasan', 300000, '2014-02-20', 'HR'),
(4, 'Asad', 'Zaman', 500000, '2014-02-20', 'Admin'),
(5, 'Sajib', 'Mia', 500000, '2014-06-11', 'Admin'),
(6, 'Alamgir', 'Kabir', 200000, '2014-06-11', 'Account'),
(7, 'Foridul', 'Islam', 75000, '2014-01-20', 'Account'),
(8, 'Keshob' ,'Ray', 90000, '2014-04011' , 'Admin');

select * from Worker;


/*Bonus table*/
create table Bonus(
worker_id int,
bonus_date varchar(20),
bonus_amount int
);


insert into Bonus(worker_id, bonus_date, bonus_amount)
values
(1, '2019-02-20', 5000),
(2, '2019-06-11', 3000),
(3, '2019-02-20', 4000),
(4, '2019-02-20', 4500),
(5, '2019-06-11', 3500),
(6, '2019-06-12', NULL)

select * from Bonus;


/*Title table*/
create table Title(
worker_id int,
worker_title varchar(20),
affected_from varchar(20)
);


insert into Title(worker_id, worker_title, affected_from)
values
(1, 'Manager', '2019-02-20'),
(2, 'Executive', '2019-06-11'),
(8, 'Executive', '2019-06-11'),
(5, 'Manager', '2019-06-11'),
(4, 'Asst. Manager', '2019-06-11'),
(7, 'Executive', '2019-06-11'),
(6, 'Lead', '2019-06-11'),
(3, 'Lead', '2019-06-11')


select * from Worker;
select * from Bonus;
select * from Title;





/*---------
List all the employees except "Manager' & 'Asst. Manager'.
-----------*/
SELECT *
FROM Worker
INNER JOIN Title
ON Worker.worker_id = Title.worker_id
WHERE Title.worker_title NOT IN('Manager', 'Asst. Manager');


/*------
List the workers in the ascending order of Designations of those joined after April 2014.
----*/
SELECT *
FROM Worker
INNER JOIN Title
ON Worker.worker_id = Title.worker_id
WHERE Worker.joining_date > '2014-04-01'
ORDER BY Title.worker_title;



/*---------
Write an SQL query to fetch the number of employees working in the department
'Admin'.
--------*/
SELECT TotalAdmin
FROM
(SELECT department, COUNT(*) AS TotalAdmin
FROM Worker
GROUP BY department) AS AdminTable
WHERE department = 'Admin';



/*-------
Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000
------*/
SELECT first_name, last_name
FROM Worker
WHERE salary BETWEEN 50000 AND 100000



/*-------
Write an SQL query to fetch the no. of workers for each department in the descending
order
---------*/
SELECT department, TotalNo
FROM
(SELECT department, COUNT(*) AS TotalNo
FROM Worker
GROUP BY department) AS TempTable
ORDER BY department DESC


/*------
Write an SQL query to print details of the Workers who are also Managers.
-----*/
SELECT *
FROM Worker
INNER JOIN Title
ON Worker.worker_id = Title.worker_id
WHERE Title.worker_title IN('Manager');



/*-------
Write an SQL query to show only odd rows from a table.
---------*/
SELECT *
FROM Worker
WHERE (worker_id % 2 = 1);



/*-------
Write an SQL query to show only even rows from a table.
---------*/
SELECT *
FROM Worker
WHERE (worker_id % 2 = 0);


/*-----
Write an SQL query to clone a new table from another table
-----*/
SELECT *
INTO CloneTable
FROM Worker;

SELECT * FROM CloneTable;

/*If you want to clone only the structure (without data), you can do this*/
SELECT *
INTO CloneTable2
FROM Worker
WHERE 1 = 0;



/*-------
Write an SQL query to show the current date and time.
---------*/
SELECT GETDATE() AS CurrentDate;


/*--------
Write an SQL query to show the top n (say 5) records of a table with Name and
Designation
----------*/
SELECT TOP 5 W.first_name, T.worker_title
FROM Worker W
JOIN Title T
ON W.worker_id = T.worker_id;



/*------
Write an SQL query to determine the nth (say n=5) highest salary from a table
------*/
SELECT TOP 5 *
FROM Worker
ORDER BY salary DESC


/*------
Write an SQL query to fetch the list of employees with the same salary
-----*/
---1st method---
SELECT Worker.*
FROM Worker
INNER JOIN (
	SELECT salary
	FROM Worker
	GROUP BY salary
	HAVING COUNT(*) > 1
) AS temp
ON Worker.salary = temp.salary;
 

----2nd method---
SELECT *
FROM Worker 
WHERE Salary IN (
    SELECT Salary
    FROM Worker
    GROUP BY Salary
    HAVING COUNT(*) > 1
);



/*-----
Write an SQL query to show the second highest salary from a table
-----*/
----1st method----
SELECT *
FROM Worker
INNER JOIN
(SELECT TOP 1 *
FROM (
	SELECT DISTINCT TOP 2 salary
	FROM Worker
	ORDER BY salary DESC
) AS temp
ORDER BY salary ASC
) 
AS temp2
ON Worker.salary = temp2.salary;


---2nd method----
SELECT DISTINCT Salary
FROM Worker
ORDER BY Salary DESC
OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;


/*
OFFSET 1 ROWS --skips the first (highest) salary.
FETCH NEXT 1 ROWS ONLY --retrieves the next salary, which is the second highest.
DISTINCT --is used to avoid duplicate salary values
*/



/*----
Write an SQL query to fetch the first 50% records from a table
-----*/
SELECT TOP 50 PERCENT *
FROM Worker;


/*----
Write an SQL query to fetch the first 50% records (without using PERCENT KEYWORD)
from a table
-----*/
SELECT TOP 
(SELECT COUNT(*)/2
FROM Worker) *
FROM Worker


/*----
Write an SQL query to fetch the departments that have less than 4 people in it
-----*/
SELECT Worker.*
FROM Worker
INNER JOIN (
	SELECT department
	FROM Worker
	GROUP BY department
	HAVING COUNT(*) < 4
) AS temp
ON Worker.department = temp.department;


/*----
Write an SQL query to show all departments along with the number of people in there
-----*/
SELECT department, COUNT(*) AS No_Of_People
FROM Worker
GROUP BY department


/*----
Write an SQL query to show the last record from table
-----*/
SELECT TOP 1 *
FROM Worker
ORDER BY worker_id DESC;


/*----
Write an SQL query to fetch the first row of a table
----*/
SELECT TOP 1 *
FROM Worker


/*-----
Write an SQL query to fetch the last five records from table-----*/SELECT TOP 5 *
FROM Worker
ORDER BY worker_id DESC;


/*----
Write an SQL query to print the name of employees having the highest salary in each
department
----*/
WITH temp AS (
	SELECT department, MAX(salary) AS Max_Salary
	FROM Worker
	GROUP BY department
)

SELECT Worker.first_name + ' ' + Worker.last_name AS Full_Name
FROM Worker
INNER JOIN temp
ON Worker.salary= temp.Max_Salary;



/*----
Write an SQL query to fetch three max salaries from table
----*/
SELECT TOP 3 *
FROM Worker
ORDER BY salary DESC



/*----
List all the employees who have maximum or minimum salary in each department
----*/
SELECT Worker.*
FROM Worker
INNER JOIN
(SELECT department, MAX(salary) AS Max_Salary, MIN(salary) AS Min_Salary
FROM Worker
GROUP BY department) AS temp
ON Worker.department = temp.department 
AND (Worker.salary= temp.Max_Salary OR Worker.salary = temp.Min_Salary)
ORDER BY department, salary;



WITH MaxMinSalaries AS (
    SELECT department, 
           MAX(salary) AS MaxSalary, 
           MIN(salary) AS MinSalary
    FROM Worker
    GROUP BY department
)
-- Join the original Employees table with the MaxMinSalaries CTE
SELECT Worker.*
FROM Worker 
JOIN MaxMinSalaries 
    ON Worker.department = MaxMinSalaries.department
    AND (Worker.salary = MaxMinSalaries.MaxSalary OR Worker.salary = MaxMinSalaries.MinSalary)
ORDER BY department, salary;