-- Write your query below
SELECT id, CASE
    WHEN p_id is NULL THEN 'Root'  
    WHEN p_id IS NOT NULL AND id IN (SELECT p_id FROM tree) THEN 'Inner'
    ELSE 'Leaf'
    END
 as type
FROM tree