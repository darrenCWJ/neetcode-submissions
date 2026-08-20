-- Write your query below
WITH cleaned as (
SELECT distinct *
FROM log_info
)

SELECT distinct account_id
FROM cleaned t1
WHERE EXISTS (
    SELECT 1
    FROM cleaned t2
    WHERE t1.account_id = t2.account_id 
    AND t1.ip_address <> t2.ip_address
    AND t1.login <= t2.logout
    AND t2.login <= t1.logout
)