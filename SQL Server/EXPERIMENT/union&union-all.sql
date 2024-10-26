USE Customers;

CREATE TABLE sohelInfo(
id INT,
name VARCHAR(30),
dept VARCHAR(30),
phone VARCHAR(30)
);

CREATE TABLE fahimInfo(
id INT,
name VARCHAR(30),
dept VARCHAR(30),
phone VARCHAR(30)
);


INSERT INTO sohelInfo
VALUES
(1, 'SOHEL', 'CSE', '01751070854'),
(2, 'SABIT', 'CSE', '01751070855')

INSERT INTO fahimInfo
VALUES
(1, 'FAHIM', 'CSE', '01751070854'),
(2, 'SABIT', 'CSE', '01751070855')

UPDATE fahimInfo
SET dept = 'EEE'
WHERE id=2;

TRUNCATE TABLE fahimInfo;


/* UNION operator*/
SELECT id, name, dept
FROM sohelInfo
UNION
SELECT id, name, dept
FROM fahimInfo;

/* UNION ALL operator*/
SELECT id, name, dept
FROM sohelInfo
UNION ALL
SELECT id, name, dept
FROM fahimInfo;