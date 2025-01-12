/*MODULE 3 NOTES: RELATIONAL DATABASES & API REST DEVELOPMENT
LESSON 1: Data bases Fundamentals
LESSON 2: SQL ESSENTIALS
LESSON 3: INTRO TO ORM'S
*/

--LESSON 2: SQL Essentials--

/*BASIC Syntax
Keywords: COMMANDS INCLUDE CREATE, INSERT, SELECT, AND UPDATE
CLAUSES: WHERE, FROM, ORDER BY
SEMICOLON: To terminate SQL Commands
COMMENTS: -- for single line and /*..*/ for multiple lines

DDL: Data Definition Language-Commands to define and modify the data within tables
DML: Data Manupulation Language-Commands to query and retrieve data from database
DQL: Data Query Lanague: 

--DDL--
*/
CREATE DATABASE CODING_TEMPLE
CREATE DATABASE mydatabase
CREATE DATABASE ONLINE_STORE
--CREATING DATA BASE IS THE PRIORITY BECAUSE EACH TABLE WILL NEED A DATABASE ALREADY CREATED TO STORE ITS DATA
CREATE TABLE users(
user_id INT PRIMARY KEY,
username VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
created_at DATETIME DEFAULT GETDATE()
);
INSERT INTO users(user_id,username, email) VALUES (1, 'Ferd', 'ferd@gmail.com')
INSERT INTO users(user_id,username, email) VALUES (2, 'ERIC', 'eric21@gmail.com')
INSERT INTO users(user_id,username, email) VALUES (3, 'Jacob', 'jacob@gmail.com');


--THE "CREATE" COMMAND--
CREATE TABLE Employees(user_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL, 
last_name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
time_created DATETIME DEFAULT GETDATE();

INSERT INTO Employees(user_id,first_name,last_name,email) VALUES (10, 'Ferdinand', 'Niyongira','ferdinandniyongira@gmail.com');
INSERT INTO Employees(user_id,first_name,last_name,email) VALUES (12, 'Eric', 'Bahati','ericbahati@gmail.com');
INSERT INTO Employees(user_id,first_name,last_name,email) VALUES (15, 'Bombe', 'Magufuli','magufuli@gmail.com');

CREATE TABLE Students(user_id INT IDENTITY(1,2) PRIMARY KEY,
first_name VARCHAR(50) NOT NULL, 
last_name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
age INT,
time_created DATETIME DEFAULT CURRENT_TIMESTAMP);

/*
INT : Creates integer Environment
IDENTITY(1,2): This is the same as AUTO_INCREMENT. Automaticall insert user id in the table start from 1 and increment of 2. 1,3,5,7
VARCHAR(50): Define a column where maximum characaters can not exceed 50
NOT NULL: Ensures that the colum field ca not be empty
DATETIME DEFAULT CURRENT_TIMESTAMP OR DATETIME DEFAULT GETDATE() OR TIMESTAMP DEFAULT CURRENT_TIMESTAMP:
automatically record time the row was created
*/
iNSERT INTO Students(first_name,last_name,email,age) VALUES ('Ferdinand', 'Niyongira','ferdinandniyongira@gmail.com',18)
INSERT INTO Students(first_name,last_name,email,age) VALUES ('James', 'Hoz','james@gmail.com',20)
INSERT INTO Students(first_name,last_name,email,age) VALUES ('Jules', 'Dukundane','dukunde@gmail.com',13)*/

--NB: While inserting data, SQL profer '--' instead of "--" for all strings data

--Adding a Colummn--
--The ALTER command
--ALTER command allows you to modify an existing table's structure by adding, modifying or dropping colum

ALTER TABLE users 
ADD last_login DATETIME;

--Modifying a Column--

ALTER TABLE Students 
ALTER COLUMN email VARCHAR(155) NOT NULL;

--Dropping a column--

ALTER TABLE Employees
DROP COLUMN email;

--Dropping a TABLE--


DROP TABLE First_Table;

--DROP Command is irreversible. Completely removes a colum or a table including all data and structure


--DML(Data Manupulation Language)--

/*Allows you yo manupulate the data inside your tables. 
This is where you add, update, or delete records*/

--BREAK DOWN
/*
1. INSERT INTO users(username,email): Specify the table(users) where the new data will be added and the specific columns
that will receive the values
2. VALUES("Ferd", "ferd@gmail.com"): These are values being inserted into COlumnns
*/

--The UPDATE command--
--UPDATE is used to modify existing records

UPDATE users
SET email ='ferdinandniyo@kohler.com' 
WHERE user_id = 1;


/*
SET email = 'new_email@example.com': This specifies the column (email) that you want to update and assigns it a new value ('new_email@example.com').
WHERE user_id = 1: This condition ensures that only the row where user_id is 1 will be updated. 
The WHERE clause is crucial because it restricts the update to a specific row or set of rows.
*/

CREATE TABLE Books(
book_id INT IDENTITY(10,1) PRIMARY KEY,
title VARCHAR(100) NOT NULL,
author VARCHAR(60) NOT NULL, 
publisher_year INT,
genre VARCHAR(45);


INSERT INTO Books(title,author,publisher_year,genre) VALUES('The Great Gatby','Scott Fitzgerald','1949','Dystopian');
INSERT INTO Books(title,author,publisher_year,genre) VALUES('Bakame','Kamanzi','1900','amateka');
INSERT INTO Books(title,author,publisher_year,genre) VALUES('Soccer','Pele','1900','Entertainment');


--UPDATE Books SET genre = 'Comedy' where book_id = 11: This command rename Bakame to Comedy

--DELETE FROM Books WHERE author = 'Pele': This command the whole last row where author = 'Pele'

--DQL(Data Query Language)--

/*SELECT * FROM Books: Retrieve All orws and all columns from each user in the table

TO SELECT SPECIFIC COLUMNS: Names of the columns replace * and will be executed

EG: SELECT title FROM Books
*/

--The WHERE Clause--
--WHERE filters results by specifying a condition. Basically, only rows that match the condition will be included in the query results
--Example:
SELECT * FROM Employees WHERE last_name = 'Bahati';

--The ORDER BY clause--
--ORDER BY: Sort the results of a querry based on one or more columns. 
--You can order whether the results should be ordered in ascending(ASC) or descending(DESC)

SELECT * FROM Employees ORDER BY time_created DESC;

--The LIKE Operator 
--LIKE Operator is used for pattern matching in querries. Allows to searh for values that match a specific pattern
--     %: It is used to represent zero or more characters
--     _: Represent a single character

-- EXAMPLES

SELECT * FROM Students
SELECT * FROM Students WHERE email LIKE'%gmail.com';

--IN THIS CASE, % will help to return all colums from the Student table in which colum end with gmail.com

SELECT * FROM Students WHERE email LIKE'james%';

--IN THIS CASE, % will help to return all colums from the Student table in which colum starts with "james"

SELECT * FROM Students WHERE email LIKE'%nd%';

--Return all columns from the Student table with an emails that have "nd" character in them.

--FINAL CHALLENGE--



--Final Challenge
/*
Use what you've learned to build and manipulate a database for an online store
Tasks:
Create a customers table with columns for customer_id, name, email, and address.
Insert three customers into the table.
Query for all customers with an email ending in @gmail.com.
Update the address of one of the customers.
Delete one customer record */

--CREATE DATABASE ONLINE_STORE 

CREATE TABLE Customers(
customer_id INT IDENTITY(10,3) PRIMARY KEY,
name VARCHAR(30), 
email VARCHAR(70) NOT NULL,
address VARCHAR(200);

INSERT INTO Customers(name,email,address)VALUES('Jack','jack@dhl.com','Dallas, TX');
INSERT INTO Customers(name,email,address)VALUES('John P.','john@yahoo.com','Dallas, TX');
INSERT INTO Customers(name,email,address)VALUES('Jacky s.','jack@gmail.com','Lancaster, TX');
INSERT INTO Customers(name,email,address)VALUES('Peter N.','peter@yahoo.fr','Lincoln, TX');

SELECT * FROM Customers;
SELECT * FROM Customers WHERE email LIKE '%dhl.com';
UPDATE Customers SET email = 'petern@yahoo.com' WHERE customer_id = 19
SELECT * FROM Customers;

DELETE FROM Customers WHERE name = 'Jacky s.'
SELECT * FROM Customers;