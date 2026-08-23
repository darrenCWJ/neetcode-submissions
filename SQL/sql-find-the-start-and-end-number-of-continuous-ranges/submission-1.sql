-- Write your query below
WITH groupings as (
  SELECT log_id,
         log_id - ROW_NUMBER() OVER (ORDER BY log_id) AS groups
  FROM logs
)
SELECT min(log_id) as start_id, max(log_id) as end_id
from groupings
group by groups
ORDER BY start_id