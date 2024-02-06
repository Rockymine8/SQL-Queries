USE SAMPLEDB
GO

--challenge 1
select * from  bird.california_sightings
union all
select * from bird.arizona_sightings

--challenge 2
select scientific_name from  bird.california_sightings
union 
select scientific_name from bird.arizona_sightings

--challenge 3
select 
    scientific_name,
    'California' as state
from bird.california_sightings
union
select
    scientific_name,
    'Airizona' 
from bird.arizona_sightings
order by state, scientific_name

--challenge 4
select 
    *,
    'California' as state 
from bird.california_sightings
union all
select 
    *,
    'Airzona'  
from bird.arizona_sightings
union all 
select  
    observation_id,
    null as common_name, 
    scientific_name, 
    locality, 
    sighting_datetime,
    'Florida'
from bird.florida_sightings

--challenge 5
SELECT customer_id from oes.customers
INTERSECT
SELECT customer_id from oes.orders

--challenge 6
SELECT product_id FROM oes.products
EXCEPT
SELECT product_id FROM oes.inventories

