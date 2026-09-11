## Windows Function
-- syntax:
/*
Select column_name,
window_function9column_name2)
OVER ([PARTITION BY column_nmae3][ORDER BY column_name4] AS new_colume
FROM table_name;
*/
 USE bankingdb;
 
--  1) ROW_NIMBER()


-- 2) Assigen rank to each emplloyee w.r.to salary
select
salary,
row_number() over(order by salary desc)
from employee;



select
salary,
rank() over(order by salary desc)
from employee;

SELECT *
FROM employee
WHERE EmployeeID LIKE '%1%';


SELECT *
FROM employee
WHERE EmployeeName LIKE 'A%';

CREATE TABLE sales (
sale_id INT PRIMARY KEY,
employee_name VARCHAR(50),
department VARCHAR(50),
sale_date DATE,
amount DECIMAL(10,2)
) ;

INSERT INTO sales
(sale_id, employee_name, department,sale_date,amount)
VALUES
(1, 'Amit', 'Electronics', '2026-01-05', 50000),
 (2, 'Priya', 'Electronics', '2026-01-10', 75000),
(3, 'Rahul', 'Electronics', '2026-01-15', 75000),
 (4, 'Sneha', 'Electronics', '2026-01-20', 90000),
(5, 'Vikas', 'Clothing', '2026-01-05', 40000),
 (6, 'Neha', 'Clothing', '2026-01-10', 60000),
 (7, 'Rohit', 'Clothing', '2026-01-15', 60000),
(8, 'Pooja', 'Clothing', '2026-01-20', 85000),
(9, 'Karan', 'Furniture', '2026-01-05', 30000),
(10, 'Anjali', 'Furniture', '2026-01-10', 55000);

select *from sales;

#Windows functions
-- 1) Assige row number
select
*,row_number() over(order by amount desc) as 'ROW NUMBER'
FROM sales;

SELECT 
    *,
    ROW_NUMBER() OVER (ORDER BY amount DESC) AS `ROW NUMBER()`, 
    RANK() OVER (ORDER BY amount DESC) AS `RANK()`
FROM sales;

SELECT 
    *,
    ROW_NUMBER() OVER (ORDER BY amount DESC) AS `ROW NUMBER()`, 
    RANK() OVER (ORDER BY amount DESC) AS `RANK()`,
    DENSE_RANK() OVER (ORDER BY amount DESC) AS `DENSE RANK()`
FROM sales;


-- 2) PARTITION BY --
SELECT department,amount,
 rank()
 over( partition by department order by amount desc) as 'department rank',
 dense_rank()
over( partition by department order by amount desc) as 'department dense rank',
sum(amount)
over(partition by department order by  amount desc) as 'total amount'
FROM sales; 

SELECT department,amount,
 rank()
 over( partition by department order by amount desc) as 'department rank',
 dense_rank()
over( partition by department order by amount desc) as 'department dense rank',
sum(amount)
over(partition by department order by  amount desc) as 'running total acrossall row'
FROM sales; 

-- 3) percentage_wice contribution of each each department

select
employee_name,department,amount,
round(amount/sum(amount) over(partition by department)*100,2) as 'departmentwise_employee_contribution'
from sales;

-- LAG()-->COMPARE CURRENT VALUE WITH THE PREVIOUS RECORDS --
SELECT 
sale_id,department,amount,sale_date,
lag(amount)over(order by sale_date),
lead(amount)over(order by sale_date)
FROM sales;




-- LEAD(): COMPARE CURRENT VAL;UE WITH THE NEXT VALUE --
-- LEAD(): Compare current value with the next value
SELECT sale_id, department, amount, sale_date, amount,
lead(amount) OVER(ORDER BY sale_date) as 'Lead()'
from sales;



-- Running Total with use of sum() --
SELECT sale_id, department, sale_date, amount,
sum(amount) OVER (partition by department ORDER BY sale_date ) as 'running_total'
From sales;


-- Average Sale DepartmentWise
SELECT sale_id, department, sale_date, amount,
concat(' ', round(avg(amount) OVER (partition by department ORDER BY sale_date), 2)) as 'Average Sales'
From sales;


-- First_Value() & Last_Value() --
SELECT department, amount,
first_value(amount) OVER (partition by department order by amount desc) as 'First_Value'
FROM sales;


SELECT department, amount,
last_value(amount) OVER (partition by department order by amount desc ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as 'Last_Value'
FROM sales;









 select department,amount,
 last_value(amount) over(partition by department order by amount desc  rows between unbounded and unbounded following  ) as 'last_value'
 from sales;
 
 
-- NTILE()-- > Divides rows into a specified number of approximately equa groups...

SELECT 
    department, 
    amount, 
    NTILE(3) OVER (ORDER BY amount DESC) AS `amount 3 quartile` 
FROM sales;
 





select count(distinct city) aS 'UNIQUE CITIES', 
count(city) as 'total cities' from company;
select emp_name,salary salary*1.25 sa ' salary increased by 25%'
from company 
where city=' Nagpur';


# Not equals to --> !=
SELECT * FROM company WHERE salary != 50000;

# Comparison based on classification
SELECT salary,
    CASE 
        WHEN salary >= 75000 THEN 'High Salary'
        WHEN salary >= 60000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM company;
## Aggregate functions in sql
-- Aggregation functions performs calculation on multiple rows.

SELECT COUNT(emp_id) AS total_employees
FROM company;

SELECT city department, sum(salary) AS total_employees
FROM company group by department;


use bankingdb;
select department,sum(salary) as total_employees 
from company
group by department;

