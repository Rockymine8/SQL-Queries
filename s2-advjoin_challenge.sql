USE SAMPLEDB
GO

select * from hcm.employees

--challenge 1
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name,
    e.manager_id,
    m.first_name as manager_first_name, 
    m.last_name as manager_last_name
FROM hcm.employees e 
left outer join hcm.employees m
ON e.manager_id = m.employee_id

--challenge 2
select 
    i.product_id,
    i.warehouse_id, 
    w.warehouse_name, 
    i.quantity_on_hand, 
    p.product_name
from oes.inventories i inner join oes.products p 
on i.product_id = p.product_id
inner join oes.warehouses w 
on i.warehouse_id = w.warehouse_id

--challenge 3
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    d.department_name, 
    j.job_title, 
    e.state_province
from hcm.employees e left outer join hcm.departments d 
ON e.department_id = d.department_id
inner join hcm.jobs j 
on e.job_id = j.job_id
inner join hcm.countries c
on e.country_id = c.country_id
where c.country_id = 2;

--challenge 4
select 
    pc.category_name,p.product_name, 
    sum(oi.quantity)  as 'quantity ordered'
from oes.products p  
join oes.product_categories pc
on p.category_id = pc.category_id
join oes.order_items oi 
on oi.product_id = p.product_id
group by product_name, category_name
order by category_name, product_name


--challenge 5
select  
    pc.category_name, 
    p.product_name, 
    coalesce(sum(oi.quantity),0) as 'quantity ordered'
from oes.order_items oi right outer join oes.products p
on p.product_id = oi.product_id
inner join oes.product_categories pc
on p.category_id = pc.category_id
group by product_name, category_name
order by category_name, product_name    