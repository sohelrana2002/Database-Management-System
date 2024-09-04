create database Employee;

/*Create a table employee*/
create table employee(
worker_id int primary key,
first_name varchar(20),
last_name varchar(20),
salary int,
dept_name varchar(20),
)

/*Add a new column; JOINING_DATE to the existing relation.*/
alter table employee add joining_date varchar(20);

/*Change the datatype of SALARY.*/
alter table employee alter column salary varchar(20)

/*Modify the column width of the DEPARTMENT field of EMPLOYEE table*/
alter table employee alter column dept_name varchar(30)


/*Allow NULL for all columns except WORKER_ID.*/
insert into employee (worker_id)
values(222311057)

select * from employee;

/*Add constraints to check, while entering the SALARY value (i.e) SALARY > 100.*/
alter table employee add check(salary > 100);

insert into employee (salary)
values(50)

insert into employee (salary)
values(150)

/*Define the field FIRST_NAME as UNIQUE. */
alter table employee add unique(first_name);


insert into employee(first_name)
values('SOHEL')

truncate table employee;



insert into employee(worker_id, first_name,last_name, salary, dept_name, joining_date)
values
(1, 'SOHEL', 'RANA', 20000, 'CSE', '20 SEPT 2024'),
(2, 'FAHIM', 'RAHMAN', 20000, 'CSE', '20 SEPT 2024'),
(3, 'SABIT', 'RAIHAN', 30000, 'CSE', '10 OCT 2023'),
(4, 'TAHSIN', 'SIDDIK', 424443, 'CSE', '2 OCT 2023'),
(5, 'AKIB', 'AHMED', 32221, 'EEE', '3 JAN 1993'),
(6, 'SOMRAT', 'BOY', 73554, 'BSC', '6 JUN 1971'),
(7, 'SHOWRAB', 'KHORMOKAR', 73554, 'DRUG D', '21 JAN 100'),
(8, 'BIJOY' ,'MOHOITRO', 73534, 'M K' , '23 JAN 1932')