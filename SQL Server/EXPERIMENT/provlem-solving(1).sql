create database Employee;

USE Employee;


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

/*Write an SQL query to fetch the number of employees working in the department �Admin�.*/
select count(department) from Worker where department= 'Admin';

/*Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.*/
SELECT first_name, last_name 
FROM Worker 
WHERE salary 
BETWEEN 50000 AND 100000;


/*Write an SQL query to fetch the no. of workers for each department in the descending order.*/
SELECT department, COUNT(*) AS Total_Emp
FROM Worker
GROUP BY department
ORDER BY Total_Emp DESC;

/*Write an SQL query to show only odd rows from a table*/
select * from Worker where (worker_id % 2) = 1;

/*Write an SQL query to show only even rows from a table.*/
select * from Worker where (worker_id % 2) = 0;

/* Write an SQL query to show the top 4 records of a table with Name and Department*/
select top 4 first_name, department from Worker;

/*Write an SQL query to fetch the departments that have less than three people in it.*/
SELECT department
FROM Worker
GROUP BY department
HAVING COUNT(*) <3

/*Write an SQL query to show all departments along with the number of people in there.*/
select department, count(department) as department from Worker group by department;

/*Write an SQL query to show the last record from table.*/
SELECT TOP 1 * 
FROM Worker
ORDER BY worker_id DESC;