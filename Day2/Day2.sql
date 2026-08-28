-- Create Databse Day2
CREATE DATABASE Day2;

-- Using Day 2 Instance
USE Day2;

-- Creating table EMP1
CREATE TABLE EMP1 (
    ID INT PRIMARY KEY,
    Name VARCHAR(10),
    Basic DECIMAL(6,2),
    Designation VARCHAR(10),
    Age DECIMAL(2,0)
);

-- Altering Table EMP1 -> Basic -> INT type
ALTER TABLE EMP1 MODIFY Basic INT;

-- Altering EMP1 -> Name -> VARCHAR(15)
ALTER TABLE EMP1 MODIFY Name VARCHAR(15);

-- Create table EMP_trainee <- EMP1 schema structure
CREATE TABLE EMP_trainee AS SELECT ID AS Emp_id, Name, Basic, Designation, Age FROM EMP1;

-- Inserting values to EMP1
INSERT INTO EMP1 (ID, Name, Basic, Designation, Age)
VALUES
(1,'Rohit',6700,'Manager',24),
(2,'Sunil',6200,'Engineer',27),
(3,'Payal',6300,'Engineer',25),
(4,'Kunal',6700,'Trainee',28),
(5,'Sunita',6230,'Trainee',26),
(6,'Bimal',7000,'Trainee',25);

-- Filter "Designation" and insert to EMP_trainee
INSERT INTO EMP_trainee 
(Emp_id, Name, Basic, Designation, Age)
SELECT ID, Name, Basic, Designation, Age
FROM EMP1
WHERE Designation = 'Trainee';

-- Adding two new fields -> EMP1 -> Skills as VARCHAR(30) & Date of Joining as DOJ (DATE)
ALTER TABLE EMP1
ADD Skills VARCHAR(10),
ADD DOJ DATE;

-- Updating existing DATA and setting the values to EMP1
UPDATE EMP1 SET Skills = 'Manage', DOJ = '2020-01-15' WHERE ID = 1;
UPDATE EMP1 SET Skills = 'Coding', DOJ = '2021-03-10' WHERE ID = 2;
UPDATE EMP1 SET Skills = 'Testing', DOJ = '2021-06-20' WHERE ID = 3;
UPDATE EMP1 SET Skills = 'Sales', DOJ = '2022-02-05' WHERE ID = 4;
UPDATE EMP1 SET Skills = 'Design', DOJ = '2022-08-12' WHERE ID = 5;
UPDATE EMP1 SET Skills = 'Support', DOJ = '2023-01-18' WHERE ID = 6;


-- Rename EMP1 (col - Age -> Age_in_Years)
ALTER TABLE EMP1
RENAME COLUMN Age TO Age_in_Years;

-- Altering -> EMP_trainee and dropping column "Age"
ALTER TABLE EMP_trainee
DROP COLUMN Age;

-- Renaming EMP1 -> EMP_Mgr_Engr
RENAME TABLE EMP1 TO EMP_Mgr_Engr;

-- Trauncate EMP_Mgr_Engr
TRUNCATE TABLE EMP_Mgr_Engr;


-- DROPPING Database Day2
DROP DATABASE Day2;