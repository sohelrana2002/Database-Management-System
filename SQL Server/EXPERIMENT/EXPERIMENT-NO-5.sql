CREATE DATABASE ViewDB;

USE ViewDB;

CREATE TABLE salesman(
salesman_id INT PRIMARY KEY,
name VARCHAR(30),
city VARCHAR(30),
commission FLOAT
);

INSERT INTO salesman
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', NULL, 0.12), 
(5007, 'Paul Adam', 'Rome', 0.13);


SELECT * FROM salesman;

CREATE TABLE customer(
customer_id INT PRIMARY KEY,
cust_name VARCHAR(30),
city VARCHAR(30),
grade INT,
salesman_id INT FOREIGN KEY REFERENCES salesman(salesman_id)
);

INSERT INTO customer
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007)

SELECT * FROM customer;


CREATE TABLE orders(
ord_no INT PRIMARY KEY,
purch_amt FLOAT,
ord_date VARCHAR(40),
customer_id INT FOREIGN KEY REFERENCES customer(customer_id),
salesman_id INT FOREIGN KEY REFERENCES salesman(salesman_id)
);


INSERT INTO orders
VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001)


/* START VIEW QUERY*/


/* -----
1. Write a query to create a view for those salesmen belongs to the city New York
-------*/

CREATE VIEW CityNewWork_View AS
SELECT * 
FROM salesman
WHERE city = 'New York';

SELECT *
FROM CityNewWork_View;


/* -----
2. Write a query to create a view for all salesman with columns salesman_id, 
name and city
 ------*/
CREATE VIEW Salesman_view AS
SELECT salesman_id, name, city
FROM salesman;

SELECT *
FROM Salesman_view;


/* ----
3. Write a query to find the salesman of the city New York who achieved the 
commission more than 13%
-----*/
CREATE VIEW salesman_view_with_newYork AS
SELECT *
FROM salesman
WHERE city = 'New York' AND commission > 0.13;

SELECT *
FROM salesman_view_with_newYork;

/* ----
4. Write a query to create a view to getting a count of how many customers we have at 
each level of a grade
----*/
CREATE VIEW customers_view AS
SELECT grade, COUNT(*) AS Total_Count
FROM customer
GROUP BY grade;

SELECT *
FROM customers_view;


/* ----
5. Write a query to create a view to keeping track the number of customers ordering,
number of salesmen attached, average amount of orders and the total amount of orders
in a day
----- */
CREATE VIEW info_In_A_Day AS
SELECT ord_date, 
COUNT(customer_id) AS No_Of_Customers,
COUNT(salesman_id) AS No_Of_Salesman,
AVG(purch_amt) AS Average_Amount_Of_orders,
SUM(purch_amt) AS Total_Amount
FROM orders
GROUP BY ord_date;

SELECT *
FROM info_In_A_Day;


/* ----
6. Write a query to create a view that shows for each order the salesman and customer
by name
----- */
CREATE VIEW Order_Salesman_Customer_Name AS
SELECT O.ord_no AS Order_No, 
C.cust_name AS Customers_Name, S.name AS Salesman_Name
FROM orders O
INNER JOIN customer C
ON O.customer_id = C.customer_id
INNER JOIN salesman S
ON O.salesman_id = S.salesman_id;

SELECT *
FROM Order_Salesman_Customer_Name

