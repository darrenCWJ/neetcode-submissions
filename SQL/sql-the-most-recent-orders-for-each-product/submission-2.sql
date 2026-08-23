-- Write your query below
SELECT p.product_name, m.product_id, o.order_id, m.order_date
FROM orders o
JOIN products p ON o.product_id = p.product_id
JOIN (
SELECT distinct product_id, last_value(order_date) OVER (PARTITION BY product_id) as order_date
FROM orders
) m ON o.product_id = m.product_id AND o.order_date = m.order_date
ORDER BY product_name , product_id, order_id