/*create database. database name is: sohel*/
create database sohelinfo;

/*create table. table name is student*/
create table student (
id int,
st_name varchar(20),
mobile varchar(20)
);

/*insert data in a table's column*/
insert into student (id, st_name, mobile)
values (222311057, 'MD. SOHEL RANA', '01751070854');

/*show all data from table*/
select * from student;

/*delete all data from table.(not affected in table columns). empties a table completely*/
truncate table student;

/*delete all data from table.(not affected in table columns)*/
delete from student;

/*delete data from table(specified by id)*/
delete from student where id=222311057;

/*permanently remove a table*/
drop table student;