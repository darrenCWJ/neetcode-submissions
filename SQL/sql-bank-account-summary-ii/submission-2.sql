-- Write your query below
SELECT u.name as name, sum(t.amount) as balance
FROM users u
JOIN transactions t ON u.account = t.account
GROUP BY u.account
HAVING sum(t.amount) > 10000
