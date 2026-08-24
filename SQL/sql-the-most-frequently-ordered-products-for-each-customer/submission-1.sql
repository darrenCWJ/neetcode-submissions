-- Write your query below
WITH product_counts as (
    SELECT customer_id, product_id,COUNT(product_id) as product_count
    FROM orders o2
    GROUP BY customer_id, product_id
),
RankedProducts AS (
    SELECT 
        customer_id, product_id, RANK() OVER (PARTITION BY customer_id ORDER BY product_count DESC) as highest
    FROM product_counts
)
SELECT r.customer_id, r.product_id, p.product_name
FROM RankedProducts r
JOIN products p ON r.product_id = p.product_id
JOIN customers c ON r.customer_id = c.customer_id
WHERE r.highest = 1;