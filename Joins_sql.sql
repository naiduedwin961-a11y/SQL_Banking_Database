use n2354_db;

-- 1. Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- 2. Insert Data into Customers Table
INSERT INTO customers (customer_id, customer_name, city)
VALUES
    (101, 'Amit', 'Nagpur'),
    (102, 'Priya', 'Pune'),
    (103, 'Rahul', 'Mumbai'),
    (104, 'Sneha', 'Delhi'),
    (105, 'Vikas', 'Nashik');

-- 3. Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2)
);

DROP TABLE orders;

INSERT INTO orders (order_id, customer_id, product, amount) 
VALUES   

    (1, 101, 'Laptop', 55000), 
    (2, 102, 'Mobile', 25000), 
    (3, 101, 'Mouse', 1500), 
    (4, 103, 'Keyboard', 3000), 
    (5, 102, 'Monitor', 12000), 
    (6, 106, 'Printer', 18000);
    
    -- 1. Query to select all columns from both tables
SELECT x.*, y.*
FROM customers AS x
INNER JOIN orders AS y
ON x.customer_id = y.customer_id;

-- 2. Query to select all customer columns with specific order columns
SELECT x.*, y.amount, y.product
FROM customers AS x
INNER JOIN orders AS y
ON x.customer_id = y.customer_id;
## LEFT 

SELECT
c.customer_id,
c.customer_name,
o.product,
concat('₹',o.amount)
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

## RIGHT JOINS

SELECT
c.customer_id,
c.customer_name,
o.product,
concat('₹',o.amount)
FROM customers c
RIGhT JOIN orders o
ON c.customer_id = o.customer_id;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(50),
manager_id INT
);


INSERT INTO employees
VALUES
(1,'Amit',NULL), # "Amit' is a itself manager
(2, 'priya', 1),
(3, 'Rahul', 1),
(4, 'Sneha', 2),
(5, 'Rocky', 3);

SELECT * from employees;

SELECT
e.employee_name AS employee,
m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;


Select *from customers;

-- ------------------------- SELF JOIN ---------------------------------
CREATE TABLE employee_new (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(100)
);






desc employee_new;



insert into employee_new values
(1,'Rahul','IT'),
(2,'Priya','HR'),
(3,'Hitesh','IT'),
(4,'Gaurav','HR'),
(5,'Amit','finance');



select *from employee_new;

SELECT e_n1.emp_name,e_n2.emp_name,e_n1.department,e_n2.department
from employee_new e_n1
join employee_new e_n2
on e_n1.department != e_n2.department;


## FULL OUTER JOINS: MYSQL DOES NOT DIRECTLY SUPPORT, BUT WE CAN MAKE FULLOUTER JOIN BY UNION OF LEFT JOIN & RIGHT JOIN, --
-- THIS WILL GIVE RECORDS FROM BOTH TABLES, INCLUEDING UNMATCHED RECORDS, --
-- FULL JOIN OR FULL OUTER JOIN: IT WILL RETURN MATCHING AND NON_MATCHING ROWS FROM BOTH TABLESM, --
 
 SELECT
 c.customer_id,
 c.customer_name,
 o.order_id,
 o.product
 FROM customers c 
 left join orders o
 on c.customer_id = o.customer_id
 
 UNION
 
 SELECT
c.customer_id,
c.customer_name,
o.order_id,
o.product
FROM customers c
 RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


-- JOIN WITH WEAR CALUSE.
SELECT 
c.*,o.product,o.amount
from customers c 
inner join orders o 
on c.customer_id = o.customer_id
where o.amount>12000;



SELECT 
c.*,sum(o.amount),o.product
from customers c 
inner join orders o 
on c.customer_id = o.customer_id group by o.customer_id,c,customer_id,o.product;

## join with where clause.
select 
c.*,o.product,o.amount
from customers c 
inner join orders o
on c.customer_id = o.customer_id where o.product in ('Laptop','Monitor') and c.city='Nagpur';


select
c.customer_name,c.city,
sum(o.amount) as 'total_amount_spent'
from customers c
inner join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name order by total_amount_spent desc
having c.city in ('Pune', 'Nagpur','Mumbai') order by c.city desc;

select 
c.*,o.product,o.amount
from customers c 
inner join orders o
on c.customer_id = o.customer_id where o.product in ('Laptop','Monitor') and c.city='Nagpur';



select
c.customer_name,c.city,
sum(o.amount) as 'total_amount_spent'
from customers c
inner join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name 
having c.city in ('Pune', 'Nagpur','Mumbai') order by c.city desc ;


select
c.customer_name,c.city,
sum(o.amount) as 'total_amount_spent'
from customers c
inner join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name 
having c.city in ('Pune', 'Nagpur','Mumbai') order by c.city desc limit 1 offset 1;


select 
c.*,
o.*
from customers c
inner join orders o
on c.customer_id = o.customer_id;

create table products(prod_id varchar (40)primary key,prod_name varchar(50), manufactured_at varchar(100));

insert into products values(501,'Laptop','USA'),(502,'Mobile','south Korea'),(503,'Keyboard', 'China'),
(504,'Monitor','Taiwan');
select *from products;
select *from orders; 

















