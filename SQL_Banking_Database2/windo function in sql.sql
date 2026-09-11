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