USE SAMPLEDB
GO

select * 
from oes.products

--Challenge 1--
Select * 
from oes.products
where list_price > 100;

--Challenge 2--
Select * from oes.orders
where shipped_date is null;

--challenge 3--
select * from oes.orders
where order_date = '20200226';

--challenge 4--
select * from oes.orders
where order_date >= '20200101';