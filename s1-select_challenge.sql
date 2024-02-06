USE SAMPLEDB
GO

-- Challenge 1 -- 
SELECT first_name, last_name
FROM hcm.employees;

-- Challenge 2--
SELECT last_name as customer_last_name, city
FROM oes.customers;

-- Challenge 3--
select *
from oes.order_items;