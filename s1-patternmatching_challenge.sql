USE SAMPLEDB
GO

--Challenge 1--
select * 
from hcm.countries
where country_name like 'N%';


--Challenge 2--
select *
from oes.customers
where email like '%@gmail.com'


--Challenge 3--
select product_name
from oes.products
where product_name like '%mouse%'


--Challenge 4--
select product_name
from oes.products
where product_name like '%[0-9]'

