use bankingdb;

show TABLES;

set sql_safe_updates=0;

drop table customerss;

CREATE TABLE customerss(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city varchar(50),
age int,
balance decimal(12,2)

);


insert into customerss
(customer_id, customer_name, city, age, balance)
values
(101, 'Rahul Sharma', 'Nagpur', 28, 45000.00),
(102, 'Priya Patil', 'Pune', 32, 72000.00),
(103, 'Amit Verma', 'Mumbai', 25, 38000.00),
(104, 'Sneha Joshi', 'Nagpur', 30, 65000.00),
(105, 'Rohan Deshmukh', 'Pune', 35, 85000.00);




create or replace view citywise_highest_balance as
select city,sum(balance)
from  customerss
group by city order by sum(balance) desc;

select * from citywise_highest_balance;

desc city_highest_balance;

create or replace view customer_bal_gt_50000 as
select*
from customerss
where balance > 50000;

select *from customer_bal_gt_50000 where city='Nagpur';

-- order by




-- group by
 create or replace view citywise_nu_cust_view as
 select city, AVG(balance) 
 from customerss
  group by city;
  select * from citywise_nu_cust_view;

-- modidy the existing view

create view citywise_nu_cust_view as
 select city, count(*) as total_customeers
 from customerss
  group by city;
  
  select * from citywise_nu_cust_view;
  
  
  -- Having 
  create view avg_balance_gt_40000_view as
  select city, avg(balance)as avg_balance
  from customerss
  group by city 
  having avg(balance) > 40000;


select * from avg_balance_gt_40000_view where city='pune';

create  view premium_city_view as
select city, sum(balance) as total_balance
from customerss
group by city
having sum(balance) >  100000 ;

select * from premium_city_view;

create or replace view premium_city_view as
select city, sum(balance) as total_balance
from customerss
group by city
having sum(balance) >  100000 and city ='Nagpur';
select * from premium_city_view;


 create view high_balance_customers as
 select
  customer_id
  customer_name,
  city,
  balance
  from customerss
  where balance > 50000;
  
  
  # Display view 
  select *
  from high_balance_customers;
  
   create view  customer_balance_status as
   select
   customer_id,
   customer_name,
   balance,
   case
   when balance >= 50000 then 'High Balance'
   ELSE 'Low Balance'
   end as balance_status
   from customerss;
   
   select * from customer_balance_status;
   
   create view banking__status as
   select 
   city,
   count(*) as 'Number of customers',
   min(balance) as 'Minimum Balace',
   max(balance) as 'Maximum Balance', 
   round(avg(balance)as ,2)as 'Average Balance',
   sum(balance) as 'total balance'
   from customer
   group by city;
   








