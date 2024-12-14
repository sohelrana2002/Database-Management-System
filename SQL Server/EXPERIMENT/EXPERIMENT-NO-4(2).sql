
USE Employee;

CREATE TABLE teacherInfo(
TID INT,
FirstName VARCHAR(30),
LastName VARCHAR(30),
Dept VARCHAR(30),
Age INT,
Salary INT
);

INSERT INTO teacherInfo
VALUES
(1, 'Mizanur', 'Rahman', 'CSE', 28, 35000),
(2, 'Delwar', 'Hossain', 'CSE', 26, 33000),
(3, 'Shafiul', 'Islam', 'EEE', 24, 30000),
(4, 'Faisal', 'Imran', 'CSE', 30, 50000),
(5, 'Ahsan', 'Habib', 'English', 28, 28000);


CREATE TABLE teacherMoreInfo(
deptID INT,
deptName VARCHAR(30),
location VARCHAR(30)
);

INSERT INTO teacherMoreInfo
VALUES
(1, 'CSE', 'Talaimari'),
(2, 'EEE', 'Talaimari'),
(3, 'English', 'Kazla'),
(4, 'CSE', 'Talaimari');



SELECT *
FROM teacherInfo;

TRUNCATE TABLE teacherInfo;

SELECT *
FROM teacherMoreInfo;

/*----
1. Update the Salary of Teacher by 15% whose DeptName is CSE, otherwise update by
10% Salary
-----*/
UPDATE teacherInfo
SET Salary = Salary * (
	CASE
		WHEN Dept = 'CSE' THEN 1.15
		ELSE 1.10
	END
);


/*----
2. Write a query to insert/copy the values of all attributes from one table to another using
(ID in) subquery
----*/
SELECT *
INTO CopyTeacherInfo
FROM teacherInfo;

SELECT *
FROM CopyTeacherInfo;



/*----
3. Write a query to find firstname and lastname as fullname , age whose salary is
maximum
----*/
WITH MaxSaalaries AS (
SELECT TOP 1 Salary
FROM teacherInfo
ORDER BY Salary DESC
)

SELECT T.FirstName + ' ' + T.LastName AS Full_Name, T.Age
FROM teacherInfo T
INNER JOIN MaxSaalaries
ON T.Salary = MaxSaalaries.Salary;

/* 2nd method*/
SELECT TOP 1 
FirstName + ' ' + LastName AS Full_Name, age
FROM teacherInfo
ORDER BY Salary DESC;

--3rd method
SELECT FirstName + ' ' + LastName AS Full_Name, age
FROM teacherInfo
WHERE Salary = (SELECT MAX(Salary) FROM teacherInfo);

/*---
4. Write a query to find firstname, age,dept whose age is between 23 to 27
----*/
SELECT FirstName, Age, Dept
FROM teacherInfo
WHERE Age BETWEEN 23 AND 27;


/*---
5. Write a query to find TID,firstname whose salary is less than average salary
---*/
SELECT TID, FirstName
FROM teacherInfo
WHERE Salary < (
	SELECT AVG(Salary) FROM teacherInfo
);


/*---
6. Write a query to delete all ID where age is greater than 25 using subquery
---*/
DELETE
FROM teacherInfo
WHERE Age IN (
	SELECT Age
	FROM teacherInfo 
	WHERE Age > 25
);


/*---
7. Write a query to update Dept by 'English' where Dept is 'EEE' using subquery
---*/
UPDATE teacherInfo
SET Dept = 'English'
WHERE Dept IN (
	SELECT Dept 
	FROM teacherInfo 
	WHERE Dept = 'EEE'
);




/*---
8. Write a query to update salary by multiplying the salary by 100 where salary is
greater than 30000 using subquery
---*/
UPDATE teacherInfo
SET Salary = Salary * 10
WHERE Salary  IN (
	SELECT Salary 
	FROM teacherInfo 
	WHERE Salary > 30000
);


/*---
9. Write a query to find the name that starts with 'k/s' using a subquery
---*/
SELECT *
FROM teacherInfo
WHERE FirstName IN (
	SELECT FirstName
	FROM teacherInfo
	WHERE FirstName LIKE 'k%' 
	OR FirstName LIKE 's%'
);



/*---
10. Find the Firstname,salary for all the teachers of CSE who have a higher salary than Shafiul using subquery
---*/
SELECT FirstName, Salary
FROM teacherInfo
WHERE Salary > (
	SELECT Salary 
	FROM teacherInfo 
	WHERE FirstName = 'Shafiul'
) AND Dept = 'CSE';


/*---
11. Find out the id,names of all teachers who belong to the same department as the
teacher 'Faisal' who is in department CSE and age is 26
---*/
SELECT TID, FirstName, LastName
FROM teacherInfo
WHERE Dept = (
	SELECT Dept 
	FROM teacherInfo 
	WHERE FirstName = 'Faisal'
);


/*---
14. Find TID, salary, deptID whose salary is greater than average salary
---*/
SELECT teacherInfo.TID, teacherInfo.Salary, teacherMoreInfo.deptID
FROM teacherInfo
INNER JOIN teacherMoreInfo
ON teacherInfo.TID = teacherMoreInfo.deptID
WHERE Salary > (
	SELECT AVG(Salary) 
	FROM teacherInfo
);





/*---
15. Find min salary from Teacher for each department where min salary is less than
average salary
---*/
WITH temp AS(
	SELECT Dept, 
	MIN(Salary) AS Min_Salary
	FROM teacherInfo
	GROUP BY Dept
)

SELECT *
FROM teacherInfo
INNER JOIN
temp
ON teacherInfo.Salary = temp.Min_Salary
WHERE temp.Min_Salary < (SELECT AVG(Salary) FROM teacherInfo);


/*---
16. Find firstname,lastname,Dept where location name is Kazla using subquery
---*/
SELECT FirstName, LastName, Dept
FROM teacherInfo
INNER JOIN teacherMoreInfo
ON teacherInfo.TID = teacherMoreInfo.deptID
WHERE teacherMoreInfo.location = (
	SELECT location
	FROM teacherMoreInfo
	WHERE location = 'Kazla'
);


/*---
17. Write a query to find the TID,firsname,salary where the length of the firstname is at least 6
---*/
SELECT TID, FirstName, Salary
FROM teacherInfo
WHERE DATALENGTH(FirstName) >=6;