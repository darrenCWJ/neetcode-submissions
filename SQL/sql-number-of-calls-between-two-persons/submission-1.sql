-- Write your query below
WITH total as (
    SELECT CASE 
        WHEN from_id < to_id then from_id
        ELSE to_id
        END
     as small_id,
    CASE 
        WHEN from_id > to_id then from_id
        ELSE to_id
        END 
     as big_id, duration
    frOM calls
)
SELECT small_id as person1, big_id as person2, count(*) as call_count,sum(duration) as total_duration
FROM total
GROUP BY small_id, big_id