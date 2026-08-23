-- Write your query below
WITH max_value as (
    SELECT transaction_id,max(amount) OVER (PARTITION BY CAST(day as date)) as maxi, day
    FROM transactions
)
SELECT t1.transaction_id
FROM transactions t1
JOIN max_value m ON t1.transaction_id = m.transaction_id
WHERE (t1.amount, t1.day) = (m.maxi, m.day)
ORDER BY t1.transaction_id