#-------------CREATE TABLES AND PRACTICE SQL JOINS--------------------------------------#
CREATE TABLE Employees(
    emp_id VARCHAR(50),
    emp_name VARCHAR(100),
    salary INTEGER, 
    dep_id VARCHAR(20),
    manager_id VARCHAR(50)
    )
INSERT INTO Employees(emp_id, emp_name, salary, dep_id, manager_id)
VALUES
('E1', 'Rahul', 15000, 'D1', 'M1'), 
('E2','Manoj', 15000, 'D1', 'M1'),
('E3', 'James', 55000, 'D2', 'M2'),
('E4', 'Michael', 25000, 'D2', 'M2'),
('E5', 'Ali', 20000,'D10', 'M3'),
('E6', 'Robin', 35000, 'D10', 'M3')

CREATE TABLE department (
    dep_id VARCHAR(20),
    dep_name VARCHAR(40)
)
INSERT INTO department (dep_id, dep_name)
VALUES
('D1','IT'),
('D2', 'HR'),
('D3','Finance'),
('D4','Admin')

CREATE TABLE manager (
    manager_id VARCHAR (20),
    manager_name VARCHAR (30),
    dep_id VARCHAR(30)
     )
INSERT INTO manager (manager_id, manager_name, dep_id)
VALUES 
('M1', 'Prem', 'D3'),
('M2', 'Shripadh', 'D4'),
('M3', 'Nick', 'D1'),
('M4', 'Cory', 'D1')

CREATE TABLE projects (
    project_id VARCHAR (10),
    project_name VARCHAR (20),
    team_member_id VARCHAR (10)
    )
INSERT INTO projects(project_id, project_name, team_member_id)
VALUES
('P1', 'Data Migration', 'E1'),
('P1', 'Data Migration', 'E2'),
('P1','Data Migration','M3'),
('P2','ETL Tool','E1'),
('P2','ETL Tool','M4')

#----------------SQL JOINS PRACTICE----------------------------#
#---Checking the employee names and department names they belong to-----------#

select e.emp_name, d.dep_name
from Employees e join department d on e.dep_id = d.dep_id;

#----Checking all of the employee names and their department names--------#
select e.emp_name, d.dep_name
from Employees e left join department d on e.dep_id = d.dep_id;

#----Checking employee names and all of their department names-------#

select e.emp_name, d.dep_name
from Employees e right join department d on e.dep_id = d.dep_id;

#-----Checking all employee names,  their department, their manager and proejcts they are working on----------#

select e.emp_name, d.dep_name, m.manager_name, p.project_name
from Employees e 
left join department d on e.dep_id = d.dep_id
left join manager m on e.manager_id = m.manager_id
left join projects p on p.team_member_id = e.emp_id

#----checking all  employee names together with all of their department_names --------------#

select * from Employees
select * from department
select e.emp_name, d.dep_name from Employees e 
full join department d on e.dep_id = d.dep_id

#-----returning all employee names with their corresponding department names----------#

select e.emp_name, d.dep_name from Employees e 
cross join department d;


