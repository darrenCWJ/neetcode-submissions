-- Write your query below
WITH direct as (
    SELECT employee_id 
    FROM employees
    WHERE manager_id = 1 AND employee_id <> 1
),
lvl_1 as (
    SELECT employee_id
    FROM employees
    WHERE manager_id in (
        SELECT employee_id
        FROM direct
    )
),
lvl_2 as (
    SELECT employee_id
    FROM employees
    WHERE manager_id in (
        SELECT employee_id
        FROM lvl_1
    )
)
SELECT employee_id
FROM direct
UNION
SELECT employee_id
FROM lvl_1
UNION
SELECT employee_id
FROM lvl_2