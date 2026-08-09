-- Write your query below
SELECT distinct (COALESCE(e.employee_id,s.employee_id)) as employee_id
FROM employees e
FULL OUTER JOIN salaries s ON e.employee_id = s.employee_id
WHERE e.name IS NULL OR s.salary IS NULL
ORDER BY (COALESCE(e.employee_id,s.employee_id)) asc