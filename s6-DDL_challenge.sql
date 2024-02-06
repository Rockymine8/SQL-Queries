USE SAMPLEDB
GO


SELECT *
FROM emp

--update
UPDATE emp
SET last_name = 'Greenbank'
WHERE emp_id = 2;

--delete
DELETE FROM emp 
WHERE emp_id = 1



--alter table challenges
--challenge 1
ALTER TABLE hcm.employees
ADD termination_date DATE;

SELECT *
from hcm.employees

--challenge 2
ALTER TABLE oes.customers
ALTER COLUMN first_name NVARCHAR(60)

ALTER TABLE oes.customers
ALTER COLUMN last_name NVARCHAR(60)

--challenge 3
--sp_rename 'oes.customers.phone', 'main_phone', 'COLUMN';

-----------------------------
ALTER TABLE hcm.departments
ADD CONSTRAINT uk_departments_department_name UNIQUE (department_name);


ALTER TABLE hcm.employees
ADD CONSTRAINT chk_employees_salary CHECK (salary >= 0);



--indexing and sargable query challenges
--challenge 1
CREATE NONCLUSTERED INDEX ix_warehouses_location_id_incl_warehouse_name 
	ON oes.warehouses (location_id) INCLUDE (warehouse_name);

--challenge 2
CREATE UNIQUE INDEX ux_products_product_name ON oes.products (product_name);

--challenge 3
SELECT 
 order_id, 
 order_date
FROM oes.orders
WHERE order_date >= 20190101 AND order_date < 20200101

--challenge 4
CREATE NONCLUSTERED INDEX fix_orders_shipped_date_nulls ON oes.orders (shipped_date)
WHERE shipped_date IS NULL;

--challenge 5
SELECT 
 customer_id, first_name, last_name, email, street_address
FROM oes.customers 
WHERE first_name LIKE 'Vi%'
AND last_name = 'Jones';
--
CREATE NONCLUSTERED INDEX ix_first_name_last_name_incl_email_street_address
	ON oes.customers (first_name, last_name) INCLUDE (email, street_address);