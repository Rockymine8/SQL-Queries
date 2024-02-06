USE SAMPLEDB
GO



--challenge 1

SELECT 
    product_id,
    product_name,
    list_price,
    category_id
FROM oes.products
WHERE list_price = (
                    SELECT MIN(list_price)
                    from oes.products
)


--challenge 2
SELECT 
	p.product_id,
	p.product_name,
	p.list_price,
	p.category_id  
FROM oes.products p
WHERE p.list_price = (
					  SELECT 
						MIN(p2.list_price)
					  FROM oes.products p2
					  WHERE p.category_id = p2.category_id
					  );

--challenge 3  
SELECT 
	p.product_id,
	p.product_name,
	p.list_price,
	p.category_id  
FROM oes.products p
INNER JOIN
		  (
			SELECT
				category_id,
				MIN(list_price) as min_list_price
			FROM oes.products
			GROUP BY category_id
		   ) p2
ON p.category_id = p2.category_id
AND p.list_price = p2.min_list_price;



--challenge 4
WITH cheapest_product_by_category AS
(
SELECT
	category_id,
	MIN(list_price) as min_list_price
FROM oes.products
GROUP BY category_id
)
SELECT 
	p.product_id,
	p.product_name,
	p.list_price,
	p.category_id  
FROM oes.products p
INNER JOIN cheapest_product_by_category p2
ON p.category_id = p2.category_id
AND p.list_price = p2.min_list_price;


-- challenge 6
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name
FROM hcm.employees e
WHERE employee_id not in (
                            SELECT
                            employee_id
                            from oes.orders
                            where employee_id IS NOT NULL
)

--challenge 7
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name
FROM hcm.employees e
WHERE NOT EXISTS (
					SELECT 1
					FROM oes.orders o
					WHERE o.employee_id = e.employee_id);

--challenge 8
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email
FROM oes.customers c
WHERE c.customer_id IN (
                        SELECT
                            o.customer_id
                        FROM oes.orders o
                        INNER JOIN oes.order_items oi
                        ON oi.order_id = o.order_id
                        INNER JOIN oes.products p 
                        ON p.product_id = oi.product_id
                        WHERE p.product_name = 'PBX Smart Watch 4'
)