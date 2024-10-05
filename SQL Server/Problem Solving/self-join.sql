USE Customers;

CREATE TABLE customerInfo(
ID INT,
NAME VARCHAR(30),
AGE VARCHAR(30),
ADDRESS VARCHAR(30),
SALARY INT
);

INSERT INTO customerInfo
VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'kaushik', 23, 'Kota', 2000.00)


SELECT *
FROM customerInfo;

TRUNCATE TABLE customerInfo;

/*SELF JOIN*/
SELECT  a.ID, b.NAME, a.SALARY
FROM customerInfo a, customerInfo b
WHERE a.SALARY > b.SALARY
ORDER BY SALARY
