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
select * from Title





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
Write an SQL query to print details of the Workers who are also Managers
-----*/
SELECT *
FROM Worker
INNER JOIN Title
ON Worker.worker_id = Title.worker_id
WHERE Title.worker_title IN('Manager');



/*-------
Write an SQL query to show only odd rows from a table
---------*/
SELECT *
FROM Worker
WHERE (worker_id % 2 = 1);



/*-------
Write an SQL query to show only even rows from a table
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
Write an SQL query to show the current date and time
---------*/
SELECT GETDATE() AS CurrentDate