/*craete a database. database name: Employee*/
create database Employee;

/*create table under Employee database. syntax is (use database_name)*/
use Employee;

/*table creation*/
create table employee(
worker_id int,
first_name varchar(20),
last_name varchar(20),
salary int,
dept_name varchar(20)
);

/*create a extra field after existing the table field*/
alter table employee add joining_date varchar(20);

/*change variable type after existing table*/
alter table employee modify column salary varchar(20);

alter table employee modify column salary int;
/*change width(length) after existing table*/
alter table employee modify column dept_name varchar(30);



/*insert one worker id field*/
insert into employee (worker_id)
values(222311057);

/*show all result from table*/
select * from employee;

/*salary checking statement*/
alter table employee add check(salary > 100);

/*insert value less than 100. result is false*/
insert into employee (salary)
values(50);

/*insert value greater than 100. result is true*/
insert into employee (salary)
values(150);

/*check statement first name must be unique*/
alter table employee add unique(first_name);


/*insert values and checking name unique or not*/
insert into employee(first_name)
values('SOHEL');

truncate table employee;


/*insert multiple values*/
insert into employee(worker_id, first_name,last_name, salary, dept_name, joining_date)
values
(222311057, 'SOHEL', 'RANA', 2000, 'CSE', '20 SEPT 2024'),
(222311053, 'FAHIM', 'RAHMAN', 2000, 'CSE', '20 SEPT 2024'),
(222311076, 'SABIT', 'RAIHAN', 3000, 'CSE', '10 OCT 2023'),
(222311035, 'TAHSIN', 'SIDDIK', 4243, 'CSE', '2 OCT 2023'),
(2231164, 'AKIB', 'AHMED', 3222, 'EEE', '3 JAN 1993'),
(223123234, 'SOMRAT', 'BOY', 7355, 'BSC', '6 JUN 1971'),
(222321, 'SHPWRAB', 'KHORMOKAR', 7355, 'DRUG D', '21 JAN 100'),
(2221334, 'BIJOY' ,'MOHOITRO', 7353, 'M K' , '23 JAN 1932');


/*when i check the input value then i got wrong spelling then I'm update it like this syntax*/
update employee set first_name = 'SHOWRAB' 
where worker_id = 222321;




