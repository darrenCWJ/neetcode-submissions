-- Write your query below
SELECT player_id, event_date, COALESCE(SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date), games_played) as games_played_so_far
FROM activity