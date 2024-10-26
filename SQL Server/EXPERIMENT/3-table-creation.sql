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