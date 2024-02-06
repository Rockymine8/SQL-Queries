USE SAMPLEDB 
GO


--Challenge one--
SELECT *
    --last_name, first_name
FROM hcm.employees
ORDER BY last_name 

--Challenge two
SELECT *
    --first_name, [salary]
FROM hcm.employees
ORDER BY salary DESC;

--challenge three
SELECT *
    --first_name, hire_date
FROM hcm.employees
ORDER BY hire_date desc;

--challenge four
SELECT *
    --department_id, first_name, salary
FROM hcm.employees
ORDER BY department_id, salary DESC;

--challenge five
SELECT TOP (10)
    employee_id, first_name, last_name, salary
FROM hcm.employees
ORDER BY salary DESC;

--challenge six
SELECT TOP (1) WITH TIES
    employee_id, first_name, last_name, salary
FROM hcm.employees
ORDER BY salary ASC;