-- Write your query below
WITH total as (
SELECT u.name as name, sum(t.amount) as balance
FROM users u
JOIN transactions t ON u.account = t.account
GROUP BY u.account
)
SELECT *
from total
WHERE balance > 10000