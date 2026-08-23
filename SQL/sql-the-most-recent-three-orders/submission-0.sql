-- Write your query below
WITH recency as (
SELECT  customer_id, order_id, order_date, RANK() OVER (PARTITION BY customer_id ORDER BY order_date desc)
FROM orders o
)
SELECT c.name as customer_name, r.customer_id, r.order_id, r.order_date
FROM customers c
JOIN recency r ON c.customer_id = r.customer_id
WHERE r.rank <= 3
ORDER BY c.name, r.customer_id, r.order_date desc