use bankingDB;

CREATE TABLE student (
    stud_id INT,
    stud_name VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(50)
);

insert into student values(1,'student','rjpm','lucknow');
alter table student add column DOB date;

ALTER TABLE student MODIFY COLUMN stud_id varchar(50);
desc student;

alter table student modify column stud_name VARCHAR(100);

-- drop column 'city' --
-- syntax: alter table <table_name> drop column <column_name>;
alter table student drop column city;

CREATE TABLE IF NOT EXISTS teacher (
    teacher_id INT,
    teacher_name VARCHAR(100),
    hiring_date DATE,
    age INT,
    salary INT
);
DROP TAble teacher;

desc teacher;

INSERT INTO teacher VALUES (1,"Kamal","2021-08-09",28,50000),
(2,"Reshma","2020-12-12",34,"67000"),
(3,"Ujjwal","2023-11-23",25,15000),
(4,"Jay","2025-11-10",30,56000);

desc student;

alter table student add constraint pk_stud_id primary key(stud_id);

-- rename column --
-- syntax: alter table < table_name> rename column <old column_name> to < new column_name>;
alter table student rename  column  stud_name to name;

insert into student values('s01','Gaurav','Dharampeth','2005-10-10'), ('s02','Kunal','Reshimbag','1999-10-08'),('s03','Farhan','Mominpura','1997-12-10'), ('s04','Vaibhav','Vayusena Nagar','2000-11-14'),('s05','Vishal','Pratap Nagar','2009-08-07'), ('s06','Kumar','Ravi NAGAR','2005-02-05'),('S07','Dinesh','Sitabuldi','1996-12-12');

select count(*) as 'Number of student'
from student;

select DOB, month(DOB),monthname(DOB),dayname(DOB),dayofweek(DOB),curdate() as 'Today Date',
datediff(curdate(),DOB) as 'number of days till tody', year(datediff(curdate(),DOB)) as 'year'
FROM student;

SELECT * from employee;

select City,count(*) as 'Numbers of Employees'
FROM employee
group by City;

select *from employee;
select Department, count(*) as'Number of Employee'
from employee 
group by Department 
having countb(EmployeeID)>=2

-- 1. Fixed SELECT statement with semicolon at the end
SELECT Department, COUNT(*) AS 'Number of Employee' 
FROM employee  
GROUP BY Department  
HAVING COUNT(EmployeeID) >= 2;

-- 2. Fixed INSERT statement without line numbers or typos
INSERT INTO Employee (EmployeeID, EmployeeName, Department, Salary, City)    
VALUES        
  (3, 'Priya Patil', 'HR', 45000, 'Pune'),        
  (4, 'Amit Kumar', 'Finance', 60000, 'Delhi'),        
  (5, 'Sneha Joshi', 'IT', 55000, 'Nagpur'),        
  (6, 'Rohan Verma', 'Marketing', 48000, 'Mumbai') 
AS new_data
ON DUPLICATE KEY UPDATE    
  EmployeeName = new_data.EmployeeName,   
  Department   = new_data.Department,   
  Salary       = new_data.Salary,   
  City         = new_data.City;
 SELECT SUM(Salary) AS 'Total Salary' 
FROM employee;
select Department,sum(Salary) as 'Toltal Salary' from employee group by department;
select Depertment,concat("₹",round(avg(Salary),0)) as 'Average Salary'
from employee group by Department;

Department,
concat("₹",round(avg(Salary),0)) as 'Average Salary'










select *from employee 
where EmployeeName like 'R%';

select *from employee
where EmployeeName like '_a%';

select city from employee
where city like'_____';
select city from employee
where city like 'M%';
select *from employee
WHERE CITY='Mumbai';








select *from employee
where EmployeeName like '%a%';

CREATE TABLE company (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary DECIMAL(10,2) DEFAULT 200000,
    hire_date DATE,
    city VARCHAR(50)
);


INSERT INTO company
(emp_id, emp_name, department, job_role, salary, hire_date, city)
VALUES
(101, 'Rahul Sharma', 'IT', 'Developer', 65000, '2021-01-15', 'Nagpur'),
(102, 'Priya Singh', 'HR', 'HR Manager', 75000, '2020-05-20', 'Mumbai'),
(103, 'Amit Kumar', 'IT', 'Developer', 70000, '2022-01-10', 'Pune'),
(104, 'Sneha Patil', 'Finance', 'Accountant', 60000, '2021-07-22', 'Nagpur'),
(105, 'Rohit Verma', 'IT', 'Tester', 55000, '2023-03-01', 'Mumbai'),
(106, 'Neha Joshi', 'HR', 'Recruiter', 50000, '2022-11-15', 'Pune'),
(107, 'Vikas Gupta', 'Finance', 'Manager', 85000, '2019-09-30', 'Delhi'),
(108, 'Anjali Rao', 'IT', 'Developer', 80000, '2020-12-05', 'Delhi'),
(109, 'Suresh Yadav', 'Sales', 'Executive', 45000, '2023-06-15', 'Nagpur'),
(110, 'Pooja Mehta', 'Sales', 'Manager', 70000, '2021-10-10', 'Mumbai');

 DESC company;
 
-- 1. LENGTH()
SELECT emp_name, LENGTH(emp_name) AS `No of Characters` FROM company;

-- 2. CONCAT()
SELECT CONCAT(emp_name, '-', department) FROM company;
-- substar(string, start_position, length)
select city,substr(city,1,3) from company;
-- SUBSTR / SUBSTRING
SELECT emp_name, SUBSTR(emp_name, 2, 4), SUBSTRING(emp_name, -1, 2) FROM company;

SELECT emp_name, SUBSTRING(emp_name, 2, 4) FROM company;

-- TRIM(): Removes unnecessary space--
SELECT 
    emp_name, TRIM(emp_name) AS cleaned_name 
FROM company;

SELECT length('  Nagpur  '), length(trim('  Nagpur  '))from dual;

-- replace(old_str,new_str) --
SELECT emp_name FROM company;

SELECT 
    emp_name,
    REPLACE(emp_name, 'a', '@') AS modified_name,
    REPLACE(emp_name, 'g', '9'),
    REPLACE(emp_name, 'S', '5'),
    REPLACE(emp_name, 'hul', 'fool')
FROM company;

## Mathematical Functions
-- 1) round()
SELECT 
    emp_name,
    salary,
    salary/12,
    ROUND(salary / 12, 3) AS monthly_salary
FROM company;

-- 2) floor()
SELECT 
    salary / 12, 
    FLOOR(salary / 12) AS rounded_down_salary, 
    CEIL(salary / 12) AS round_hig_salary 
FROM company;

-- 3) ABS()
SELECT ABS(-322) FROM DUAL;

SELECT 
    emp_name,
    job_role,
    SALARY,
    SALARY - 60000,
    ABS(salary - 60000) AS salary_difference_WITH_ABS
FROM company;

-- 4) MOD()
SELECT-- 4) MOD() :
SELECT 
    emp_id,
    MOD(emp_id, 2) AS remainder,
    MOD(SALARY, 2)
FROM company;

-- 5) POWER()
SELECT 
    salary,
    POWER(salary, 2) AS salary_square
FROM company;\


### comparision operators
-- 1) greater(): return the largest value

-- 1) GREATEST() : return the largest value.
SELECT MAX(SALARY) FROM company;
SELECT SALARY FROM company;

SELECT greatest(78, 12, 781, 234, 78989, 133098) FROM DUAL;

SELECT 
    department,
    salary,
    GREATEST(salary, 60000) AS SALARY_GREATER_THAN_60000
FROM company;


