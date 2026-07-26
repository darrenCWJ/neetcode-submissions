WITH max_score as (
    Select student_id, max(score) as score
    FROM exam_results
    group by student_id
),
min_exam as (
    SELECT a.student_id, min(a.exam_id) as exam_id, a.score
    FROM exam_results a
    JOIN max_score b on a.student_id = b.student_id 
    AND a.score = b.score
    GROUP BY a.student_id, a.score 
)
SELECT *
FROM min_exam