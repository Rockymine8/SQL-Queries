USE SAMPLEDB
GO

--challenge 1
SELECT 
    product_id,
    product_name,
    discontinued,
CASE  
    WHEN discontinued = 1 THEN 'YES'
    WHEN discontinued = 0 THEN 'NO'
    ELSE 'UNKOWN'
END AS discontinued_description
FROM oes.products;

--challenge 2
SELECT 
    product_id,
    product_name,
    list_price,
CASE  
    WHEN list_price >= 250 THEN 'High'
    WHEN list_price >= 50 THEN 'Medium'
    WHEN list_price < 50 THEN 'Low'
    ELSE 'Unknown'
END AS price_grade
FROM oes.products;

--challenge 3
SELECT 
    order_id,
    order_date,
    shipped_date,
CASE
    WHEN DATEDIFF(DAY, order_date, shipped_date) <= 7 THEN 'Shipped within 1 week'
    WHEN DATEDIFF(DAY, order_date, shipped_date) > 7 THEN 'Shipped over 1 week'
    ELSE 'Not Shipped'
END AS shipping_status
FROM oes.orders

--Challenge 4
SELECT 
    s.shipping_status,
    count(*) as order_status_by_count
FROM 
    (SELECT 
        order_id,
        order_date,
        shipped_date,
    CASE
        WHEN DATEDIFF(DAY, order_date, shipped_date) <= 7 THEN 'Shipped within 1 week'
        WHEN DATEDIFF(DAY, order_date, shipped_date) > 7 THEN 'Shipped over 1 week'
        ELSE 'Not Shipped'
    END AS shipping_status 
    FROM oes.orders
    )s
GROUP BY s.shipping_status

