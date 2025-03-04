-- CREATE DATABASE 
CREATE DATABASE ASSIGNMENT6;
USE ASSIGNMENT6;

-- CREATING TABLES

CREATE TABLE COUNTRY
(
COUNTRY_ID INT AUTO_INCREMENT PRIMARY KEY,
COUNTRY_NAME VARCHAR(100),
POPULATION BIGINT,
AREA DECIMAL (10,2));

CREATE TABLE PERSONS
(
ID INT AUTO_INCREMENT PRIMARY KEY,
FNAME VARCHAR (50) NOT NULL,
LNAME VARCHAR(50),
POPULATION BIGINT,
RATING DECIMAL (3,2),
COUNTRY_ID INT,
COUNTRY_NAME VARCHAR(100));

DESC COUNTRY;
DESC PERSONS;

-- INSERTING VALUES INTO TABLE

INSERT INTO COUNTRY
VALUES 
(1, 'USA', '500000', '643801.0'),
(2, 'CANADA', '800000', '683547.4'),
(3, 'AUSTRALIA', '1000000', '45781255.0'),
(4, 'INDIA', '30000000', '3287263.0'),
(5, 'UK', '1500000', '543801.2'),
(6, 'JAPAN', '126300000', '377975.0'),
(7, 'BRAZIL', '211000000', '8515767.0'),
(8, 'MOSCOW', '126300000', '377975.0'),
(9, 'ROME', '60245946', '301340.0'),
(10, 'OTTAWA', '37742154', '9984670.0');

SELECT * FROM COUNTRY;

INSERT INTO PERSONS
VALUES
(DEFAULT, 'JOHN', 'DOE', '500000', '1.0', '1', 'USA'),
(DEFAULT, 'SOPHIA', 'WILLIAMS', '800000', '2.0', '2', 'CANADA'),
(DEFAULT, 'JAMES', 'TAYLOR', '1000000', '3.0', '3', 'AUSTRALIA'),
(DEFAULT, 'AALIYA', 'MILLER', '30000000', '4.0', '4', 'INDIA'),
(DEFAULT, 'EMMA', 'YOUNG', '1500000', '5.0', '5', 'UK'),
(DEFAULT, 'ISABELLA', 'KING', '126300000', '2.0', '6', 'JAPAN'),
(DEFAULT, 'DANIEL', 'HALL', '211000000', '3.0', '7', 'BRAZIL'),
(DEFAULT, 'LILY', 'LEWIS', '126300000', '1.0', '8', 'MOSCOW'),
(DEFAULT, 'MIA', 'NELSON', '60245946', '4.0', '9', 'ROME'),
(DEFAULT, 'MILA', 'MURPHY', '37742154', '5.0', '10', 'OTTAWA');

SELECT * FROM PERSONS;

#1. INNER JOIN, LEFT JOIN AND RIGHT JOIN ON THE TABLES 

#INNER JOIN
SELECT C.COUNTRY_ID, C.COUNTRY_NAME, P.POPULATION, C.POPULATION FROM COUNTRY C
INNER JOIN PERSONS P ON C.POPULATION = P.POPULATION;

#LEFT JOIN
SELECT C.COUNTRY_ID, C.COUNTRY_NAME, P.POPULATION, C.POPULATION FROM COUNTRY C
LEFT JOIN PERSONS P ON C.POPULATION = P.POPULATION;

#RIGHT JOIN
SELECT C.COUNTRY_ID, C.COUNTRY_NAME, P.POPULATION, C.POPULATION FROM COUNTRY C
RIGHT JOIN PERSONS P ON C.POPULATION = P.POPULATION;

#2. LIST ALL DISTINCT COUNTRY NAMES FROM BOTH THE COUNTRY AND PERSONS TABLES
#UNION
SELECT COUNTRY_NAME FROM COUNTRY 
UNION
SELECT COUNTRY_NAME FROM PERSONS ;

#3. LIST ALL DISTINCT COUNTRY NAMES FROM BOTH THE COUNTRY AND PERSONS TABLES INCLUDING DUPLICATES
 #UNION ALL
SELECT COUNTRY_NAME FROM COUNTRY 
UNION ALL
SELECT COUNTRY_NAME FROM PERSONS ;

# FULL JOIN
SELECT C.COUNTRY_ID, C.COUNTRY_NAME, P.COUNTRY_NAME FROM COUNTRY C
LEFT JOIN PERSONS P ON C.COUNTRY_NAME = P.COUNTRY_NAME
UNION ALL
SELECT C.COUNTRY_ID, C.COUNTRY_NAME, P.COUNTRY_NAME FROM COUNTRY C
RIGHT JOIN PERSONS P ON C.COUNTRY_NAME = P.COUNTRY_NAME;

#4. ROUND THE RATING OFF ALL PERSONS TO THE NEAREST INTEGER IN THE PERSONS TABLE
SELECT FNAME, RATING, ROUND(RATING) AS ROUNDED_RATING FROM PERSONS;
