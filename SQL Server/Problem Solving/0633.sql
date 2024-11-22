create database sohelNew;
use sohelNew;

CREATE TABLE Zone (
    Zone_Id VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(255)
);

drop table Zone;

CREATE TABLE Branch (
    Br_Id VARCHAR(50) PRIMARY KEY,
    Branch_Name VARCHAR(255),
);

drop table Branch;

CREATE TABLE Account_Detail (
    Account_no INT PRIMARY KEY,
    Acc_holder_name VARCHAR(255),
    Amount INT,
    Branch_Id VARCHAR(50) FOREIGN KEY REFERENCES Branch(Br_Id),
	Zone_Id VARCHAR(50) FOREIGN KEY REFERENCES Zone(Zone_Id)
); 


INSERT INTO Zone (Zone_Id, Name)
VALUES 
('Z-801','Sirajgonj' ),
('Z-802','Rajshahi'),
('Z-803','Dhaka'),
('Z-804','Chitagong');

INSERT INTO Branch (Br_Id, Branch_Name)
VALUES 
('B-101','Bonani'),
('B-102','Romna'),
('B-103', 'Shaheb bazar'),
('B-104', 'Ullapara'); 


INSERT INTO Account_Detail ( Account_no, Acc_holder_name, Amount,Branch_Id, Zone_Id)
VALUES
(1992212,'Mr. Nazmuzzaman',200000,'B-101', 'Z-803'),
(1992213,'Mr. Jibon', 170000, 'B-102', 'Z-803'), 
(1882212, 'Bushra',180000,'B-103', 'Z-802'), 
(1882213, 'Sajib', 170000, 'B-104', 'Z-801');

/*1*/
CREATE FUNCTION SPdetails()
RETURNS TABLE
AS
RETURN
(
    SELECT Acc_holder_name,  Amount, tempBranch.Branch_Name, tempZone.Name
	FROM Account_Detail
	INNER JOIN
	(SELECT * FROM Branch) AS tempBranch
	ON Account_Detail.Branch_Id = tempBranch.Br_Id
	INNER JOIN
	(SELECT * FROM Zone) AS tempZone
	ON Account_Detail.Zone_Id = tempZone.Zone_Id

);

SELECT * FROM SPdetails();

/*2*/
CREATE PROC SPaverage
@Branch_name VARCHAR(50),
@Amount INT
AS
BEGIN
SELECT tempBranch.Branch_Name, Amount
FROM Account_Detail
INNER JOIN 
(SELECT * FROM Branch) AS tempBranch
ON Account_Detail.Branch_Id = tempBranch.Br_Id
WHERE Amount > @Amount AND Branch_Name =@Branch_name
END;

DROP PROC SPaverage
EXEC SPaverage 'Bonani', 170000



/*3*/
CREATE FUNCTION SPbalance(@Zone_name VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT Amount
	FROM Account_Detail
	INNER JOIN
	(SELECT * FROM Zone) AS tempZone
	ON Account_Detail.Zone_Id = tempZone.Zone_Id
	WHERE tempZone.Name = @Zone_name
);

SELECT * FROM SPbalance('Sirajgonj');

/*4 */
CREATE PROC SPamount
AS
BEGIN
	SELECT Acc_holder_name, tempBranch.Branch_Name, tempZone.Name
	FROM Account_Detail
	INNER JOIN
	(SELECT * FROM Branch) AS tempBranch
	ON Account_Detail.Branch_Id = tempBranch.Br_Id
	INNER JOIN
	(SELECT * FROM Zone) AS tempZone
	ON Account_Detail.Zone_Id = tempZone.Zone_Id
	WHERE Acc_holder_name LIKE '%Mr%'
	AND Amount < (SELECT MAX(Amount) FROM Account_Detail)
END

EXEC SPamount;


/*5*/
CREATE PROC SPdetailsInfo
@Zone_name VARCHAR(50),
@CountCus INT OUTPUT

AS
BEGIN
	SELECT COUNT(*) AS No_Of_Customer
	FROM Account_Detail
	INNER JOIN
	(SELECT * FROM Zone) AS tempZone
	ON Account_Detail.Zone_Id = tempZone.Zone_Id
	GROUP BY tempZone.Name
	HAVING tempZone.Name = @Zone_name

END

DECLARE @TotalCount INT
EXEC SPdetailsInfo 'Sirajgonj', @TotalCount OUTPUT
PRINT @TotalCount;






