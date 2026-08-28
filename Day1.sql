-- create a database named -> College
CREATE DATABASE College;

-- USing the Database
USE College;

-- create a table named -> student
CREATE TABLE Student (
    Roll INT(5) PRIMARY KEY,
    Name VARCHAR(30),
    Age INT(5) NOT NULL,
    Course VARCHAR(5),
    Math DECIMAL(6 , 2 ),
    Physics DECIMAL(6 , 2 ),
    Computer DECIMAL(6 , 2 ),
    Birthday DATE
);

-- Renaming some Columns
ALTER TABLE Student
RENAME COLUMN name TO Name,
RENAME COLUMN roll TO Roll,
RENAME COLUMN age TO Age,
RENAME COLUMN course TO Course;

-- INSERTING VALUES
INSERT INTO Student VALUES(1,"Rahul",19,"BCA",79.5,67,89,'1993-06-15');-- 1
INSERT INTO Student VALUES(2,"Kunal",21,"BCA",68,76,59.5,'1991-08-16');-- 2
INSERT INTO Student VALUES(3,"Aditi",20,"MSc",90,73,56,'1992-09-20');-- 3
INSERT INTO Student VALUES(4,"Sumit",20,"MCA",57.5,78,81,'1991-12-07');-- 4
INSERT INTO Student VALUES(5,"Anirban",22,"MCA",80,68,63,'1994-09-15');-- 5
INSERT INTO Student VALUES(6,"Kumkum",21,"BCA",72,54.5,60,'1995-02-08');-- 6
INSERT INTO Student VALUES(7,"Suman",21,"BCA",91.5,32,61,'1994-03-10');-- 7
INSERT INTO Student VALUES(8,"Rohit",22,"MSc",85,76,92,'1992-04-19');-- 8

-- #view Student table
SELECT * FROM Student;

-- View the skeleton of the table
DESC Student;

-- create another table like student table but without any data
CREATE TABLE MSc LIKE Student;

-- #view MSc table
SELECT * FROM MSc;

-- Displaying the stucture of the MSc Table!
DESC MSc;

-- Create table[MCA] structure without data
CREATE TABLE MCA LIKE Student;

-- Rename the columns
ALTER TABLE MCA 
  RENAME COLUMN Course TO Department,
  RENAME COLUMN Name TO `First Name`;
  
-- View MCA
SELECT * FROM MCA;

-- Displaying the structure of MCA
DESC MCA;

-- Displaying the data of Roll - 5
SELECT * FROM Student WHERE Roll = 5;

-- Show the roll, name, marks of all subjects for all students from Student table.
SELECT Roll, Name, Math, Physics, Computer FROM Student;

-- Display all the student details belonging to the BCA department.
SELECT * FROM Student WHERE Course = 'BCA';

--  Insert data in the ‘MCA’ table from ‘Student’ table where course is MCA.
INSERT INTO MCA (Roll, `First Name`, Age, Department, Math, Physics, Computer, Birthday)
SELECT Roll, Name, Age, Course, Math, Physics, Computer, Birthday
FROM Student
WHERE Course = 'MCA';

-- Display MCA Table
SELECT * FROM MCA;

--  Insert data in the ‘MSc’ table from ‘Student’ table where course is MSc.
INSERT INTO MSc (Roll, Name, Age, Course, Math, Physics, Computer, Birthday)
SELECT Roll, Name, Age, Course, Math, Physics, Computer, Birthday
FROM Student
WHERE Course = 'MSc';

-- Display MSc Table
SELECT * FROM MSc;

-- . Display all the details of each student in ‘Student’ table with Course appearing first in the display column list. 
SELECT Course, Roll, Name, Age, Math, Physics, Computer, Birthday FROM Student;

--  Update the Math marks of the student with Roll no 7 from 91 to 95 in the ‘Student’ table.
UPDATE Student SET Math = 95.00 WHERE Roll = 7;

-- Show Roll 7 Details
SELECT Roll, Name, Course, Math FROM Student WHERE Roll = 7;

--  Update the Name of the student with Roll no 4 from Sumit to Sumitava in ‘MCA’ table.
UPDATE MCA SET `First Name` = 'Sumitava' WHERE Roll = 4;

-- Show Data of roll 4 -> MCA table
SELECT * FROM MCA WHERE Roll = 4;

-- Delete the details of the student with Roll no 2 from the ‘Student’ table.
DELETE FROM Student WHERE Roll = 2;

-- Show Student Table
SELECT * FROM Student;

-- Delete all the records in Student Table
TRUNCATE TABLE Student;

-- View all the tables
SELECT * FROM Student;
SELECT * FROM MCA;
SELECT * FROM MSc;
