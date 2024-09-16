create database Customers;

create table CustomersInfo(
CustomerID int,
CustomerName varchar(30),
ContactName varchar(30),
Address varchar(30),
City varchar(30),
PostalCode int,
Country varchar(30)
);

insert into CustomersInfo
(CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
values
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', 12209, 'Germany'),
(2, 'Ana Trujillo Emparedados', 'Ana Trujillo', 'Avda. de la Constitución 2222',
'México D.F.', 05021, 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', 05023,
'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 13008, 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå ', 68306,
'Germany '),
(6, 'Blondel père et fils', 'Frédérique Citeaux', '24, place Kléber', 'Strasbourg',
67000, 'France');

select * from CustomersInfo;

/*---Select all the different countries from the "Customers" table: 
The SELECT DISTINCT statement is used to return only distinct (different) values.
---*/
select distinct Country as CountryName from CustomersInfo;

/*----By using the DISTINCT keyword in a function called COUNT, we can return the number
of different countries.----*/
select count(distinct Country) as TotalCountry from CustomersInfo;

/*----Select all customers from Mexico:---
The WHERE clause is not only used in SELECT statements, it is also used in UPDATE,
DELETE, etc.!
*/
select * from CustomersInfo where Country = 'Mexico';


/*--select all customers with a CustomerID greater than 3:----*/
select * from CustomersInfo where CustomerID > 3;


/*------------------
The following operators can be used in the WHERE clause:

Operator	Description
1.	=			Equal
2.	>			Greater than
3.	<			Less than
3.	>=			Greater than or equal
5.	<=			Less than or equal
6.	BETWEEN		Between a certain range
7.	LIKE		Search for a pattern
8.	IN			To specify multiple possible values for a column
--------------------*/


/*-----The ORDER BY keyword is used to sort the result-set in 
	ascending or descending order.---*/
select * from CustomersInfo order by CustomerID desc;


/*-------------
Using Both ASC and DESC
The following SQL statement selects all customers from the "Customers" table,
sorted ascending by the "Country" and descending by the "CustomerName" column:
---------------*/
select * from CustomersInfo order by Country asc, CustomerName desc;


/*----------------
The WHERE clause can contain one or many AND operators.

The AND operator is used to filter records based on more than one condition, 
like if you want to return all customers from Spain that starts with the letter 'A':
-----------------*/
select * from CustomersInfo where PostalCode > 7000 and CustomerName like 'A%'


/*----------------
The WHERE clause can contain one or more OR operators.

The OR operator is used to filter records based on more than one condition, 
like if you want to return all customers from Germany but also those from France:
-----------------*/
select * from CustomersInfo where Country = 'Germany' or Country = 'France';

/*-----------
Select all Germany customers that starts with either "A" or "B":
-----------*/
select * from CustomersInfo where Country = 'Germany' and 
(CustomerName like 'A%' or CustomerName like 'B%');




/*------between statement---------*/
select * from CustomersInfo where PostalCode between 13000 and 68000;

SELECT * FROM CustomersInfo
WHERE CustomerName LIKE 'a%';


