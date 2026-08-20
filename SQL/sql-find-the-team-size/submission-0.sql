-- Write your query below
SELECT e.employee_id, s.team_size
FROM employee e
JOIN (
    SELECT team_id, count(team_id) as team_size
    FROM employee
    GROUP BY team_id
) s
ON e.team_id = s.team_id