-- Write your query below
SELECT product_id, store, price
FROM products
CROSS JOIN LATERAL(
    VALUES
    ('store1', store1),
    ('store2',store2),
    ('store3',store3)
) as v(store, price)
WHERE price IS NOT NULL