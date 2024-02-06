USE SAMPLEDB
GO

--challenge 1
SELECT department_id, count(*) as employee_count
from hcm.employees
group by department_id;


--challenge 2
SELECT avg(salary) as avg_salary, department_id
from hcm.employees
group by department_id
order by avg_salary desc;

--challenge 3
SELECT warehouse_id, SUM(quantity_on_hand) as total_quantity
from oes.inventories 
group by warehouse_id
having sum(quantity_on_hand) > 5000

--challenge 4
select max(date_of_count)
from bird.antarctic_populations

--challenge 5
select locality, species_id, max(date_of_count) as recent_date_of_count
from bird.antarctic_populations
group by locality, species_id
