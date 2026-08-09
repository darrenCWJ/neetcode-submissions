-- Write your query below
SELECT 
distinct (l.page_id) as recommended_page
FROM friendship f
JOIN likes l ON f.user2_id = l.user_id OR  f.user1_id = l.user_id
WHERE (f.user1_id = 1 OR f.user2_id = 1) 
AND page_id NOT IN (
    SELECT page_id FROM likes where user_id = 1
)