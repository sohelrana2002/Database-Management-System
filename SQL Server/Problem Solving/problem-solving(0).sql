create database Employee;

create table employee(
worker_id int primary key,
first_name varchar(20),
last_name varchar(20),
salary int,
dept_name varchar(20),
)

alter table employee add joining_date varchar(20);

alter table employee alter column salary varchar(20)

alter table employee alter column dept_name varchar(30)



insert into employee (worker_id)
values(222311057)

select * from employee;

alter table employee add check(salary > 100);

insert into employee (salary)
values(50)

insert into employee (salary)
values(150)


alter table employee add unique(first_name);


insert into employee(first_name)
values('SOHEL')

truncate table employee;



insert into employee(worker_id, first_name,last_name, salary, dept_name, joining_date)
values
(222311057, 'SOHEL', 'RANA', 20000, 'CSE', '20 SEPT 2024'),
(222311053, 'FAHIM', 'RAHMAN', 20000, 'CSE', '20 SEPT 2024'),
(222311076, 'SABIT', 'RAIHAN', 30000, 'CSE', '10 OCT 2023'),
(2223110354, 'TAHSIN', 'SIDDIK', 424443, 'CSE', '2 OCT 2023'),
(2231164, 'AKIB', 'AHMED', 32221, 'EEE', '3 JAN 1993'),
(223123234, 'SOMRAT', 'BOY', 73554, 'BSC', '6 JUN 1971'),
(222321, 'SHOWRAB', 'KHORMOKAR', 73554, 'DRUG D', '21 JAN 100'),
(2221334, 'BIJOY' ,'MOHOITRO', 73534, 'M K' , '23 JAN 1932')