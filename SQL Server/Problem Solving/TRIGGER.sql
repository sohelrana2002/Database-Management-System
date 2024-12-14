USE UDF;

CREATE TABLE BackUpStudentTable(
id INT,
name VARCHAR(50),
dateOfBirth VARCHAR(50)
);

SELECT *
FROM student;

SELECT *
FROM BackUpStudentTable;

DROP TABLE BackUpStudentTable;

TRUNCATE TABLE BackUpStudentTable;


/*---Trigger after Insert ---*/
CREATE TRIGGER trStudent
ON student
FOR INSERT
AS
BEGIN
	DECLARE @id INT, @name VARCHAR(50), @dateOfBirth VARCHAR(50)
	SELECT @id = id, @name = name, @dateOfBirth = dateOfBirth FROM INSERTED
	INSERT INTO BackUpStudentTable
	VALUES(@id, @name, @dateOfBirth)
END;





INSERT INTO student(id, name, dateOfBirth)
VALUES
(4, 'AKIB AHMED IMU', '2004-12-16');



/*---Trigger after DELETE ---*/
CREATE TRIGGER trDeleteStudent
ON student
FOR DELETE
AS
BEGIN
	DECLARE @id INT, @name VARCHAR(50), @dateOfBirth VARCHAR(50)
	SELECT @id = id, @name = name, @dateOfBirth = dateOfBirth FROM DELETED
	INSERT INTO BackUpStudentTable
	VALUES(@id, @name, @dateOfBirth)
END;

/*---HOW TO DROP TRIGGER ---*/
DROP TRIGGER trDeleteStudent;


DELETE FROM student
WHERE id = 4;




