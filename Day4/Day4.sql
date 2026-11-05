

CREATE TABLE Customer (
    Cust_id CHAR(3) PRIMARY KEY,
    Fname VARCHAR(15) NOT NULL,
    Lname VARCHAR(20),
    Area VARCHAR(2) NOT NULL,
    Phone VARCHAR(10)
);




CREATE TABLE Movie (
    Mv_no INT PRIMARY KEY,
    Cust_id CHAR(3),
    Title VARCHAR(30) NOT NULL,
    Star CHAR(2) NOT NULL,
    Price INT CHECK (Price BETWEEN 100 AND 250),
    FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);




INSERT INTO Customer
(Cust_id, Fname, Lname, Area, Phone)
VALUES
('A01','Ivan','Ross','SA','6125467'),
('A02','Vandana','Ray','MU','5560379'),
('A03','Pramada','Jauguste','DA','4560389'),
('A04','Basu','Navindi','BA','6125401'),
('A05','Ravi','Shridhar','NA',NULL),
('A06','Rukmini','Aiyer','GH','5125274');




INSERT INTO Movie
(Mv_no, Cust_id, Title, Star, Price)
VALUES
(1,'A02','Bloody','JC',181),
(2,'A04','The Firm','TC',200),
(3,'A01','Pretty Woman','RG',151),
(4,'A06','Home Alone','MC',150),
(5,'A05','The Fugitive','MF',200),
(6,'A03','Coma','MD',100),
(7,'A02','Dracula','GO',150),
(8,'A06','Quick Change','BM',100),
(9,'A03','Gone with the Wind','CB',200),
(10,'A05','Carry on Doctor','LP',100);




SELECT * FROM Customer
WHERE Cust_id IS NULL;

SELECT * FROM Movie
WHERE Mv_no IS NULL;



SELECT Cust_id, COUNT(*)
FROM Customer
GROUP BY Cust_id
HAVING COUNT(*) > 1;

SELECT Mv_no, COUNT(*)
FROM Movie
GROUP BY Mv_no
HAVING COUNT(*) > 1;




SELECT Movie.*
FROM Movie
LEFT JOIN Customer
ON Movie.Cust_id = Customer.Cust_id
WHERE Customer.Cust_id IS NULL;




SELECT *
FROM Movie
WHERE Price < 100 OR Price > 250;



SELECT Title
FROM Movie
WHERE Price > 100 AND Price < 200;




SELECT Cust_id
FROM Movie
WHERE Star IN ('JC','TC','MC');




SELECT *
FROM Customer
WHERE Area LIKE '%A%';



SELECT Title
FROM Movie
WHERE Price <= 180
AND CHAR_LENGTH(Title) = 6;




SELECT Title,
       Price,
       Price * 1.10 AS `Incremented Price`
FROM Movie;




SELECT CONCAT(
    Fname, ' ', Lname,
    ' stays in ', Area,
    ' and his phone number is ',
    COALESCE(Phone, 'NULL'), '.'
) AS Customer_Details
FROM Customer;




ALTER TABLE Customer
MODIFY Lname VARCHAR(20) NOT NULL;




SELECT Fname, Lname
FROM Customer
WHERE Phone IS NULL;




UPDATE Customer
SET Phone = '7000000000'
WHERE Area LIKE '%A%'
AND Phone IS NULL;



SELECT DISTINCT Cust_id
FROM Movie;



ALTER TABLE Movie
MODIFY Star CHAR(2) NULL;




DELETE FROM Customer
WHERE Cust_id = 'A06';




DELETE FROM Movie
WHERE Mv_no = 10;




SHOW CREATE TABLE Movie;



ALTER TABLE Movie
DROP FOREIGN KEY Movie_ibfk_1;




DROP TABLE Customer;




DROP TABLE Movie;


-- END OF ASSIGNMENT 4