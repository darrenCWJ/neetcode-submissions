-- Write your query below
SELECT user_id, max(time_stamp) as last_stamp
FROM logins
WHERE EXTRACT(YEAR FROM time_stamp::timestamp) = 2020
GROUP BY user_id

