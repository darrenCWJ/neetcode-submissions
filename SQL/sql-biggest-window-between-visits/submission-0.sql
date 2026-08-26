-- Write your query below
WITH windows as (
SELECT user_id, CASE 
WHEN visit_date - lag(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date) > date('2021-1-1') - MAX(visit_date) OVER (PARTITION BY user_id) THEN visit_date  - lag(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date)
ELSE date('2021-1-1') - MAX(visit_date) OVER (PARTITION BY user_id)
END as biggest_window
FROM user_visits
)
SELECT user_id, max(biggest_window) as biggest_window
FROM windows
GROUP BY user_id