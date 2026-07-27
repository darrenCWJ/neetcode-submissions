-- Write your query below
WITH total_dist as(
SELECT user_id ,  sum(distance) as travelled_distance
FROM rides r
GROUP BY user_id
)
SELECT u.name as name , COALESCE(r.travelled_distance,0) as travelled_distance
FROM users u
LEFT JOIN total_dist r
ON u.id = r.user_id
ORDER BY travelled_distance desc, name asc