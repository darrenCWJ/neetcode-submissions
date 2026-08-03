-- Write your query below
WITH app as (
SELECT sale_date,sold_num as apple_num
FROM sales
WHERE fruit = 'apples'
),
ora as (
SELECT sale_date,sold_num as orange_num
FROM sales
WHERE fruit = 'oranges'
)
SELECT a.sale_date, (coalesce(apple_num,0) - coalesce(orange_num,0)) as diff
FROM app a
JOIN ora o ON a.sale_date = o.sale_date