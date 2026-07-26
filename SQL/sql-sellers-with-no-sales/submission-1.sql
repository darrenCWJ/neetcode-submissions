-- Write your query below
WITH sale as(
    SELECT distinct seller_id
    FROM orders
    where (extract(year from sale_date) = 2020)
)
SELECT seller_name
FROM seller se
LEFT JOIN sale sa on se.seller_id = sa.seller_id
WHERE sa.seller_id is null
ORDER BY seller_name asc