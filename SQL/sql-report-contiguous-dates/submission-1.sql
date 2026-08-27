-- Write your query below
WITH all_status as (
    SELECT 'failed' as status, fail_date as dates
    FROM failed
    UNION
    SELECT 'succeeded' as status, success_date as dates
    FROM succeeded 
),
in_order as (
    SELECT *, CASE 
            WHEN status IS DISTINCT FROM LAG(status) OVER (ORDER BY dates) THEN 1 
            ELSE 0 
        END AS is_changed
    FROM all_status
    WHERE CAST(dates AS date) >= date('2019-01-01') AND CAST(dates AS date) < date('2020-01-01')
    ORDER by dates
),
groupings as (
    SELECT *, SUM(is_changed) OVER (ORDER BY dates) AS grouping_id
    FROM in_order
)
SELECT status as period_state, min(dates) as start_date, max(dates) as end_date
FROM groupings
GROUP BY grouping_id, status