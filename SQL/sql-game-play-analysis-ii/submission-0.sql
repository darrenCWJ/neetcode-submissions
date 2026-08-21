-- Write your query below
SELECT distinct player_id, FIRST_VALUE(device_id) OVER (PARTITION BY player_id ORDER BY event_date) as device_id
FROM activity