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
FROM Order_Salesman_Customer_Name;


/* ----
7. Write a query to create a view that finds the salesman who has the customer with the
highest order of a day 
----*/
CREATE VIEW highest_order_of_a_day AS
SELECT S.*, Order_Count
FROM salesman S
INNER JOIN
(SELECT TOP 1 salesman_id, COUNT(*) AS Order_Count
FROM orders
WHERE ord_date = '2012-09-10'
GROUP BY salesman_id) AS Temp
ON S.salesman_id = Temp.salesman_id;

SELECT *
FROM highest_order_of_a_day;


/* ---
8. Write a query to create a view that finds the salesman who has the customer with the
highest order at least 3 times on a day
---- */

CREATE VIEW At_Least_Three_Order AS
SELECT S.*, Order_Count
FROM salesman S
INNER JOIN
(SELECT TOP 1 salesman_id, COUNT(*) AS Order_Count
FROM orders
WHERE ord_date = '2012-09-10'
GROUP BY salesman_id
HAVING COUNT(*) >=3) AS Temp
ON S.salesman_id = Temp.salesman_id;

SELECT *
FROM At_Least_Three_Order;


/* ---
9. Write a query to create a view that shows all of the customers who have the highest
grade
--- */
CREATE VIEW Highest_Grade AS
SELECT *
FROM customer
WHERE grade = (SELECT MAX(grade) FROM customer);

SELECT *
FROM Highest_Grade;


/* ---
10. Write a query to create a view that shows the number of the salesman in each city
--- */
CREATE VIEW Salesman_In_Same_City AS
SELECT city, COUNT(*) AS No_Of_Salesman
FROM customer
GROUP BY city
ORDER BY No_Of_Salesman OFFSET 0 ROWS;

SELECT *
FROM Salesman_In_Same_City

/*'OFFSET 0 ROWS' to specify that no rows need to be skipped and start 
from the first row */


/* ---
11. Write a query to create a view that shows the average and total orders for each
salesman after his or her name. (Assume all names are unique)--- */
CREATE VIEW avg_total_orders AS
SELECT S.salesman_id,  S.name, Average_Order, Total_Order
FROM salesman S
INNER JOIN
(SELECT salesman_id, SUM(purch_amt) AS Total_Order, AVG(purch_amt) AS Average_Order
FROM orders
GROUP BY salesman_id) AS temp
ON S.salesman_id = temp.salesman_id;

SELECT *
FROM avg_total_orders;


/* ---
12. Write a query to create a view that shows each salesman with more than one
customers
--- */
CREATE VIEW More_Than_One_Customers AS
SELECT S.*, Tota_Customers
FROM salesman S
INNER JOIN
(SELECT salesman_id, COUNT(*) AS Tota_Customers
FROM customer 
GROUP BY salesman_id
HAVING COUNT(*) > 1) AS temp
ON S.salesman_id = temp.salesman_id;

SELECT *
FROM More_Than_One_Customers;


/* ---
13. Write a query to create a view that shows all matches of customers with salesman
such that at least one customer in the city of customer served by a salesman in the city
of the salesman
--- */




/* ---
14. Write a query to create a view that shows the number of orders in each day
----*/
CREATE VIEW No_Of_Order_Each_Day AS
SELECT ord_date, COUNT(*) AS No_Of_Orders
FROM orders
GROUP BY ord_date;

SELECT *
FROM No_Of_Order_Each_Day;


/* ---
15. Write a query to create a view that finds the salesmen who issued orders on October
10th, 2012
---*/
CREATE VIEW Salesman_Order_Date AS
SELECT S.*, ord_date
FROM salesman S
INNER JOIN
(SELECT salesman_id, ord_date
FROM orders
WHERE ord_date = '2012-10-10') AS temp
ON S.salesman_id = temp.salesman_id;

SELECT *
FROM Salesman_Order_Date;


/* ---
16. Write a query to create a view that finds the salesmen who issued orders on either
August 17th, 2012 or October 10th, 2012
----*/
CREATE VIEW Salesman_Order_Date_Two_Times AS
SELECT S.*, ord_date
FROM salesman S
INNER JOIN
(SELECT salesman_id, ord_date
FROM orders
WHERE ord_date = '2012-10-10' OR ord_date ='2012-08-17') AS temp
ON S.salesman_id = temp.salesman_id;

SELECT *
FROM Salesman_Order_Date_Two_Times;





