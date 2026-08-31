-- Creat database --
Create database n325_db;    
-- to select the database --
use n325_db;
-- command to create table 
CREATE table IF NOT exists employee
(emp_id int, emp_name varchar (20), salary double, hirring_date date
);

-- describe the table --
desc employee;
describe employee;

-- insert record in table --
insert into employee(emp_name,hiring_date) value(1,'suresh','2026-08-27');

-- to display/retreive table --
select *from employee;

-- to display records of specific column from table --
select emp_name from employee;