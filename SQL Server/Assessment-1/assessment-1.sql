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


select * from Title


/*problem solving from here*/

/*1. write an SQL query to print details of the workers whose first_name 
	ends with 'r' and contains at least 3 alphabets without and operator

explanation:
	Therefore, LIKE '%r' means:
	Match any string of characters (%), as long as it ends with the letter 'r'.
*/
select * from Worker where (first_name like '%r') and datalength(first_name) >=3;


/*2. find the average salary of employees for each department that has at least
	4 people as worker*/

select department, avg(salary) as avg_salary from Worker group by department
having count(*) <= 4;


/*3. List all the employee expect 'Manager' & 'Asst. Manager'*/
select * from Worker inner join Title on Worker.worker_id = Title.worker_id 
where (worker_title) not in('Manager', 'Asst. Manager');


/*4(extra). write an SQL query to fetch the first 50% records from a table using
	percent keyword*/
select top 50 percent * from Worker;


/*4. write an SQL query to fetch the first 50% records from a table without using
	percent keyword*/
select top (select floor(count(*)/2) from Worker) * from Worker;


/*how to count total rows in a table*/
select count(*) as totle_count from Worker;


/*5. write an SQL query to print details of the workers who are also Managers*/



/*6. write an SQL query to print the name of employees having the highest salary in
each department*/
select first_name, last_name from Worker 
select department, max(salary) as max_salary from Worker group by department

SELECT w.first_name, w.last_name, w.department, w.salary
FROM Worker w
JOIN (
  SELECT department, MAX(salary) AS max_salary
  FROM Worker
  GROUP BY department
) AS dept_max
ON w.department = dept_max.department AND w.salary = dept_max.max_salary;



/*----
7. Update the salary of workers by 15% whose deptname is 'HR'. otherwise update 
by 10% salary
-----*/
UPDATE Worker
SET salary = salary * (
		CASE
			WHEN department = 'HR' THEN 1.15
			ELSE 1.10
		END
);



/*----
8. Write a query to find firstname and lastname as fullname , deptname whose 
salary is maximum
-----*/
SELECT TOP 1 first_name + ' ' + last_name AS Full_Name, department
FROM Worker
INNER JOIN
(SELECT MAX(salary) AS Max_salary
FROM Worker) AS temp
ON Worker.salary = temp.Max_salary;



/*-----
9. Write a query to find workerid, firstname whose salary is less than average salary
----*/
SELECT worker_id, first_name
FROM Worker
WHERE salary < (
	SELECT AVG(salary)
	FROM Worker
);



/*----
10. find min salary from worker for each dept where min salary is less then 
average salary
----*/
SELECT Worker.*
FROM Worker
INNER JOIN
(SELECT department, MIN(salary) AS Min_Salary
FROM Worker
GROUP BY department) AS temp
ON Worker.salary = temp.Min_Salary
WHERE salary < (
	SELECT AVG(salary)
	FROM Worker
)
ORDER BY salary, department;



/*----
10. write an SQL query to print the name of employee having the highest salary
in each department
----*/
SELECT Worker.*
FROM Worker
INNER JOIN
(SELECT department, MAX(salary) AS Max_Salary
FROM Worker
GROUP BY department) AS temp
ON Worker.salary = temp.Max_Salary
ORDER BY salary DESC, department;