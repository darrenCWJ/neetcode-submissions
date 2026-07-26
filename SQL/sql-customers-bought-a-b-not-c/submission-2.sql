-- Write your query below
WITH only_A as(
    select customer_id
    FROM orders
    where product_name = 'A'
),
only_B as (
    select customer_id
    FROM orders
    where product_name = 'B'
),
only_C as (
    select customer_id
    from orders
    where product_name = 'C'
)
SELECT distinct cust.customer_id, cust.customer_name
FROM customers cust
JOIN only_A a ON cust.customer_id = a.customer_id
JOIN only_B b on cust.customer_id = b.customer_id
WHERE cust.customer_id not in (select customer_id from only_C)
ORDER by cust.customer_name