-- Write your query below
WITH max_val as (
SELECT id ,department_id, MAX(salary) OVER (PARTITION BY department_id) as max_sal FROM employee
)
SELECT d.name as department, e.name as employee, e.salary
FROM max_val m
JOIN employee e ON m.id = e.id
JOIN department d ON d.id = m.department_id
WHERE m.max_sal = e.salary