-- Write your query below
SELECT event_day as day, emp_id, sum(out_time - in_time) as total_time
FROM employees
group by event_day, emp_id