use shoppingdb;

CREATE TABLE users (
	user_id INT PRIMARY KEY,
    username VARCHAR(50),
    country VARCHAR(50),
    followers int
);

CREATE TABLE posts (
	post_id INT PRIMARY KEY,
    user_id INT,
    post_text VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users
(user_id, username, country, followers)
VALUES
(1,'Rahul','India',80000),
(2,'Priya','India',60000),
(3,'Amit','India',30000),
(4,'Sneha','USA',90000),
(5,'John','USA',70000),
(6,'Emma','USA',40000),
(7,'Rohan','UK',20000),
(8,'Sophia','Uk',10000);

INSERT INTO posts
(post_id, user_id, post_text)
VALUES
(101,1,'Learning SQL'),
(102,1,'Learning Python'),
(103,2,'Data Science'),
(104,4,'Machine Learning'),
(105,4,'AI Tutorial'),
(106,5,'Power BI'),
(107,7,'My First Post');

## SUBQUERY :-
-- Type 1 : Scalar Subquery :- Returns One Row & One Column

-- 1) Find average followers
SELECT round(AVG(followers),2) AS 'Average Followers'
FROM users;

-- 2) Find Users whose followers are more than the average followers
SELECT username, followers
FROM users
WHERE followers > (
	SELECT AVG(followers)
    FROM users
);

-- 3) Find User With Maximum Followers






## type -3
## correlatyed subquery :a correlated subquery references a column from the4Quter QUERY AND 
##


SELECT  * from users;

select country, avg(followers)
from users
group by country order by avg(followers)desc;


select 
u1.username,
u1.country,
u1.followers
from users u1
where u1.followers > (
select avg(u2.followers)
from users u2
where u2.country = u1.country
);


select 
u1.username,
u1.country,
u1.followers
from users u1
where u1.followers < (
select avg(u2.followers)
from users u2
where u2.country = u1.country
);

select 
u.username,
u.country,
u.followers
from users u
where u.followers > (
select avg(x.followers)
from users x
where x.country = u.country
);
## subquery in from 
/*
a subquery inside from is called a:
1) derivied table 2) table subquery 3) inline view 

it behaves like a temporary table and must have an alias in mysql.
*/


select 
country_data.country,
country_data.avg_followers
from(
select
country,
avg(followers)as avg_followers 
from users
group by country 
) as country_data 
where country_data.avg_followers > 50000;


select *
from (
select
 country,
count(user_id) as total_users,
avg(followers)as avg_followers
from users
group by country
)as country_summary where country = 'USA';

## Derived Table with WHERE clause
select *
from(
select 
country,
avg(followers)as avg_followers
from users
 group by country 
)as country_data
where avg_followers > 50000; 

## subquery in where clase
-- subquery in where clause are commonly used for filtering 
select usre_id, username
from users
where user_id in(
select distinct user_id from posts);

## Nested subquery :  A subqury can  contain  another subquery.

select username, followers
from users
where folowers >(
select avg(followers)
from users
where country =(
select country
from users
where username = 'Rahul'
)
);





















