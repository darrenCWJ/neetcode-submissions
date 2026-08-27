-- Write your query below
WITH all_task as (
    SELECT 
        t.task_id,
        v.task_number_per_id
    FROM tasks t
    CROSS JOIN LATERAL generate_series(1, t.subtasks_count) AS v(task_number_per_id)
)
SELECT a.task_id, a.task_number_per_id as subtask_id
FROM all_task a
LEFT JOIN executed e ON (a.task_id, a.task_number_per_id) =  (e.task_id, e.subtask_id)
WHERE e.task_id IS NULL