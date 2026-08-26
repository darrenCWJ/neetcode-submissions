-- Write your query below
SELECT t.student_id, s.student_name
FROM (
    SELECT student_id, score,
           MAX(score) OVER (PARTITION BY exam_id) AS mx,
           MIN(score) OVER (PARTITION BY exam_id) AS mn
    FROM Exam
) t
JOIN student s ON t.student_id = s.student_id
GROUP BY t.student_id, s.student_name
HAVING SUM(CASE WHEN score = mx OR score = mn THEN 1 ELSE 0 END) = 0