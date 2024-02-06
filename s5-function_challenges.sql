xxUSE SAMPLEDB
GO
--Challenge 1
SELECT 
    employee_id,
    first_name,
    last_name,
    first_name + ' ' + last_name AS employee_name
FROM hcm.employees

--Challenge 2
SELECT 
    employee_id,
    first_name,
    last_name,
    first_name + ISNULL(' ' + middle_name, '') + ' ' + last_name AS employee_name
FROM hcm.employees

--Challenge 3
SELECT 
    scientific_name,
    LEFT(scientific_name, CHARINDEX(' ',scientific_name)-1) AS genus_name
FROM bird.antarctic_species

--Challenge 4
SELECT 
    scientific_name,
    SUBSTRING(scientific_name, CHARINDEX(' ',scientific_name) + 1, LEN(scientific_name)) AS genus_name
FROM bird.antarctic_species

--Challenge 5
SELECT
    employee_id,
    first_name,
    last_name,
    birth_date,
    DATEDIFF(YEAR, birth_date, CURRENT_TIMESTAMP) AS employee_age
FROM hcm.employees

--Challenge 6
SELECT
    order_id,
    order_date,
    DATEADD(DAY, 7, order_date) AS estimated_shipping_date
FROM oes.orders
WHERE shipped_date IS NULL

--Challenge 7
SELECT 
    s.company_name,
    AVG(DATEDIFF(day, o.order_date, o.shipped_date)) AS avg_shipping_time
FROM oes.orders o
INNER JOIN oes.shippers s 
ON o.shipper_id = s.shipper_id
GROUP BY s.company_name


