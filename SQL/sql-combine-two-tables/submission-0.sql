-- Write your query below
SELECT a.first_name, a.last_name, b.city, b.state
FROM person a
LEFT JOIN address b
on a.person_id = b.person_id