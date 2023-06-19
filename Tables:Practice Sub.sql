#--------------CREATING TABLES AND PRACTICE Subquery-----------------------------#

CREATE TABLE EMPLOYEES21 (
    emp_id integer,
    emp_name VARCHAR(50),
    dep_name VARCHAR (50),
    salary VARCHAR (50)
)
#---------------Chanding Salary Data type to Integer-------------------------------#

ALTER TABLE EMPLOYEES21
ALTER COLUMN salary INT;

INSERT INTO EMPLOYEES21 (emp_id, emp_name, dep_name, salary)
VALUES 
(101, 'Mohan', 'Admin', 4000),
(102, 'Rajkumar', 'HR', 3000),
(103, 'Akbar', 'IT', 4000),
(104, 'Dorvin', 'Finance', 6500),
(105, 'Rohit', 'HR', 3000),
(106, 'Rajesh', 'Finance', 5000),
(107, 'Preet', 'HR', 7000),
(108, 'Maryam', 'Admin', 4000),

INSERT INTO EMPLOYEES21 (emp_id, emp_name, dep_name, salary)
VALUES 
(109, 'Sanjay', 'IT', 6500),
(110, 'Vasuda', 'IT', 7000),
(111, 'Melinda', 'IT', 8000),
(112, 'Komal', 'IT', 10000),
(116, 'Satya', 'Finance', 6500),
(119, 'Cory', 'HR', 8000),
(121, 'Rosalin', 'IT', 6000),
(122, 'Ibrahim', 'IT', 8000),
(123, 'Vikram', 'IT', 800),
(124, 'Dheeraj', 'IT', 11000)
INSERT INTO EMPLOYEES21 (emp_id, emp_name, dep_name, salary)
VALUES (120, 'Monica', 'Admin', 5000)
INSERT INTO EMPLOYEES21 (emp_id, emp_name, dep_name, salary)
VALUES 
(113, 'Gautham', 'Admin', 2000),
(114, 'Manisha', 'HR', 3000),
(115, 'Chandni', 'IT', 4500),
(117, 'Adarsh', 'HR', 3500),
(118, 'Tejaswi', 'Finance', 5500)

#--------DELETING UNWANTED ROW FROM TABLE----------------# 

DELETE FROM EMPLOYEES21 WHERE emp_name = 'Josh'

#---------CREATING THE SECOND TABLE--------------------------------------------------------#

CREATE TABLE DEPARTMENT21 (
    dep_id INT,
    dep_name VARCHAR (40),
    location VARCHAR (50)
)
INSERT INTO DEPARTMENT21 (dep_id, dep_name, [location])
VALUES
(2, 'HR', 'Bangalore'),
(3, 'IT', 'Bangalore'),
(4, 'Finance', 'Mumbai'),
(5, 'Marketing', 'Bangalore'),
(6, 'Sales', 'Mumbai')

select * from EMPLOYEES21
select * from DEPARTMENT21
#-----------Creating third table------------------------------------#

CREATE TABLE Sales (store_id INT, store_name VARCHAR(50), product_name VARCHAR(50), quantity INT, price INT
)
INSERT INTO SALES (store_id, store_name, product_name, quantity, price)
VALUES 
(1,'Apple Store 1','iPhone 13 Pro',1, 1000),
(1,'Apple Store 1','MacBook Pro 14', 3, 6000),
(1,'Apple Store 1','AirPods Pro', 2, 500),
(2,'Apple Store 2', 'iPhone 13 Pro',2, 2000 ),
(3,'Apple Store 3', 'iPhone 12 Pro', 1, 750),
(3,'Apple Store 3', 'MacBook Pro 14', 1, 2000 ),
(3, 'Apple Store 3', 'Macbook Air', 4, 4400),
(3, 'Apple Store 3', 'iPhone 13', 2, 1800),
(3, 'Apple Store 3', 'AirPods Pro', 3,750),
(4, 'Apple Store 4','iPhone 12 Pro', 2,1500),
(4, 'Apple Store 4','MacBook Pro 16', 1, 3500)

#-----Finding the employees whose salary is more than the average salary earned by all employees-----------#

select * from EMPLOYEES21 where salary > (select AVG(salary) from EMPLOYEES21)

#-----Finding employees who earn highest salary in each department----------------------#


select dep_name, max(salary) from employees21
group by dep_name;


select * from employees21 where ( salary, dep_name) in (select dep_name, max(salary) 
from employees21
group by dep_name);

#----Finding department that do not have any employees

SELECT * from DEPARTMENT21 where dep_name not in(SELECT distinct dep_name from Employees21)

#----Finding employees in each department who earn more than average salary in that department----------------#


select * from Employees21 y1 where salary > 
(select avg(salary) from employees21 y2 where y1.dep_name = y2.dep_name)

#------Finding department with no employees-------------------------#

select * from DEPARTMENT21 where dep_name not in (select  dep_name from EMPLOYEES21 group by dep_name) or 
select * from DEPARTMENT21 B1 where not EXISTS (select * from employees21 B2 where B1.dep_name = B2.dep_name )


#-----Checking all employee details and add remarks to those employees who earn more than the average pay-----------------#


select * 
,(CASE WHEN SALARY > (select avg(salary) from EMPLOYEES21)
THEN 'Higher than average' 
ELSE 'normal'
END) as remarks
from EMPLOYEES21 


#-----Checking all Apple Stores details and add tag 15% discount to the most expensive product in the store-----#

select * , (CASE WHEN price = (select max(price) from sales)
THEN '15% DISCOUNT'
ELSE 'NORMAL'
END) as Updated
from sales

#-----Finding stores that sold more units than the average units sold by all stores---------------------------#
select store_name, sum(quantity) from Sales
group by store_name
having sum(quantity)>(select avg(quantity) from Sales)


