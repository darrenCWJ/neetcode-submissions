-- Write your query below
SELECT (CASE 
        WHEN from_id < to_id then from_id
        ELSE to_id
        END) as person1,     CASE 
        WHEN from_id > to_id then from_id
        ELSE to_id
        END  as person2, count(*) as call_count,sum(duration) as total_duration
FROM calls
GROUP BY person1, person2