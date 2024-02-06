USE SAMPLEDB 
GO

SELECT *
FROM hcm.employees
WHERE (city = 'Seallte' or city = 'Sydney');

SELECT *
FROM hcm.employees
WHERE CITY IN('Seattle','Sydney','Ascot','Hillston');

SELECT *
FROM hcm.employees   
where CITY in('Sydney') and salary > 200000;

select *
from hcm.employees
where city in('Sydney','Seattle') and hire_date >= '20190101';

select *
from oes.products
where category_id NOT IN(1,2,5);