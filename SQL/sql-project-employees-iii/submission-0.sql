-- Write your query below
WITH max_exp as (
SELECT p.project_id, max(e.experience_years) 
FROM project p
JOIN employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id
)
SELECT p.project_id, e.employee_id
FROM project p
JOIN max_exp m ON p.project_id = m.project_id
JOIN employee e ON p.employee_id = e.employee_id
WHERE e.experience_years = m.max
ORDER BY project_id, employee_id