-- Write your query below
SELECT distinct(email)
FROM person
GROUP BY email
HAVING count(email) > 1