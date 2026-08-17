-- Write your query below
SELECT v.winner as player_id, p.player_name ,count(v.winner) as grand_slams_count
FROM championships c
CROSS JOIN LATERAL (
    VALUES
        (wimbledon),
        (fr_open),
        (us_open),
        (au_open)
) as v(winner)
LEFT JOIN players p ON v.winner = p.player_id
WHERE p.player_name is not null
group by v.winner, p.player_name
