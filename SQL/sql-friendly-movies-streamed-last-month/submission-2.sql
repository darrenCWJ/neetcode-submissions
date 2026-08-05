-- Write your query below
SELECT DISTINCT title
FROM content c
join tv_program t ON c.content_id = t.content_id
WHERE  TO_DATE(t.program_date,'YYYY/MM/DD') >= '2020/06/01'  AND (TO_DATE(t.program_date,'YYYY/MM/DD') < '2020/07/01') AND c.kids_content = 'Y' AND content_type = 'Movies'