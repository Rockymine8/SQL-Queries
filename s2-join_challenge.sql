USE SAMPLEDB
GO


SELECT *
From hcm.departments

Select *
from hcm.employees

--challenge 1
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	e.salary,
	d.department_name
FROM hcm.employees e INNER JOIN hcm.departments d 
ON d.department_id = e.department_id;

--challenge 2
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	e.salary,
	d.department_name
FROM hcm.employees e left outer join hcm.departments d 
ON d.department_id = e.department_id

--challenge 3
SELECT 
	d.department_name,
	COUNT(*) AS employee_count
FROM hcm.employees e LEFT OUTER JOIN hcm.departments d 
ON d.department_id = e.department_id
GROUP BY d.department_name;

