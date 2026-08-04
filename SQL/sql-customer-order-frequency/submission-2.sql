-- Write your query below
WITH june as(
    SELECT o.customer_id
    FROM orders o 
    JOIN product p ON p.product_id = o.product_id
    GROUP BY o.customer_id, EXTRACT(month FROM order_date), EXTRACT(year FROM order_date)
    HAVING (EXTRACT(month FROM order_date) = 6 and EXTRACT(year FROM order_date) = 2020  and sum(p.price * quantity) >= 100)  
),
july as(
    SELECT o.customer_id
    FROM orders o 
    JOIN product p ON p.product_id = o.product_id
    GROUP BY o.customer_id, EXTRACT(month FROM order_date), EXTRACT(year FROM order_date)
    HAVING (EXTRACT(month FROM order_date) = 7 and EXTRACT(year FROM order_date) = 2020 and sum(p.price * quantity) >= 100)  
)
SELECT c.customer_id, c.name
FROM customers c
JOIN june ON c.customer_id = june.customer_id
JOIN july ON c.customer_id = july.customer_id