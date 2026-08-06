-- Write your query below
SELECT abs(x - LEAD(x) OVER (ORDER BY x)) AS shortest
FROM point 
ORDER by abs(x - LEAD(x) OVER (ORDER BY x)) asc
LIMIT 1