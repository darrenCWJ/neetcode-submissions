-- Write your query below
SELECT distinct c.seat_id
FROM cinema c
JOIn cinema d ON c.seat_id = (d.seat_id - 1) or d.seat_id = (c.seat_id - 1)
WHERE (c.free = 1 and d.free = 1)