-- Write your query below
Select name
FROM customers c
LEFT JOIN orders o on c.id = o.customer_id
WHERE o.customer_id is null