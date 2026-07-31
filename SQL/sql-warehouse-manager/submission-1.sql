-- Write your query below
WITH product_vol as(
SELECT product_id, (width * length * height) as volume
FROM products
)
SELECT w.name as warehouse_name, sum(p.volume * w.units) as volume
FROM warehouse w
JOIN product_vol p ON p.product_id = w.product_id
GROUP BY w.name