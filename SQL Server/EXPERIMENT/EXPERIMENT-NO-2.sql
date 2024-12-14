create database Employee;

USE Employee;


/*----LAB ASSIGNMENT 1: ----*/

/* ---
1. Create a table Employee with following schema:
(WORKER_ID(PK), FIRST_NAME, LAST_NAME, SALARY, DEPT_NAME)
---- */
create table employee(
worker_id int primary key,
first_name varchar(20),
last_name varchar(20),
salary int,
dept_name varchar(20),
);

DROP TABLE employee

/* ---
2. Add a new column; JOINING_DATE to the existing relation
--- */
alter table employee add joining_date varchar(20);

/* ---
3.Change the datatype of SALARY
---- */
alter table employee alter column salary varchar(20);


/*---
Change the name of column/field DEPT_NAME to DEPARTMENT
---*/
EXEC sp_rename 'employee.Department',  'dept_name', 'COLUMN';

/* ---
5. Modify the column width of the DEPARTMENT field of EMPLOYEE table
---- */
alter table employee alter column dept_name varchar(30);


/*----LAB ASSIGNMENT 2: ----*/
/*---
1. Allow NULL for all columns except WORKER_ID
----*/
insert into employee (worker_id)
values(222311057);

select * from employee;

/*-----
2. Add constraints to check, while entering the SALARY value (i.e) SALARY > 100
----*/
alter table employee add check(salary > 100);

insert into employee (salary)
values(50);

insert into employee (salary)
values(150);

/* ----
3. Define the field FIRST_NAME as UNIQUE
--- */
alter table employee add unique(first_name);


insert into employee(first_name)
values('SOHEL');

truncate table employee;


/*----LAB ASSIGNMENT 3: ----*/
insert into employee(worker_id, first_name,last_name, salary, dept_name, joining_date)
values
(1, 'Rana', 'Hamid', 100000, 'HR', '2014-02-20 09:00:00'),
(2, 'Sanjoy', 'Saha', 80000, 'Admin', '2014-06-11 09:00:00'),
(3, 'Mahmudul', 'Hasan', 300000, 'HR', '2014-02-20 09:00:00'),
(4, 'Asad', 'Zaman', 500000, 'Admin', '2014-02-20 09:00:00'),
(5, 'Sajib', 'Mia', 500000, 'Admin', '2014-06-11 09:00:00'),
(6, 'Alamgir', 'Kabir', 200000, 'Account', '2014-06-11 09:00:00'),
(7, 'Foridul', 'Islam', 75000, 'Account', '2014-01-20 09:00:00'),
(8, 'Keshob' ,'Ray', 90000, 'Admin' , '2014-04-11 09:00:00');



/*---
2. Display all the information of EMPLOYEE table
---*/
SELECT *
FROM employee;


/*-----
3. Display all the information of 1st 5 employees of EMPLOYEE table with
FIRST_NAME+LASTNAME as FULL_NAME
----------*/
SELECT TOP 5 worker_id, first_name + ' ' + last_name AS FullName, salary, dept_name,
joining_date
FROM employee;


/*-----------
4. Display the complete record of employees working in Admin Department
-------------*/
SELECT *
FROM employee
WHERE dept_name = 'Admin';


/*------------
5. Find the name of employees whose salary is greater than 200000
---------*/
SELECT first_name + ' ' + last_name AS FullName
FROM employee
WHERE salary > 200000;


/*---
6. Write down the SQL Query to find out whose salary is greater than Sanjoy
---*/
SELECT *
FROM employee
WHERE salary > (SELECT salary  FROM employee WHERE first_name = 'Sanjoy');


/*----------
7. Update the Salary of Worker by 95000 whose ID is 8 .
-------------*/
UPDATE employee
SET salary = 95000
WHERE worker_id = 8;


/*---------
8. Delete the record of employee whose FIRST_NAME is Asad.
-----------*/
DELETE FROM employee