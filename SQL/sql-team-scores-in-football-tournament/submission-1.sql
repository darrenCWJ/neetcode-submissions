-- Write your query below
WITH scores as (
    SELECT host_team, guest_team, CASE 
        WHEN host_goals > guest_goals THEN 3
        WHEN host_goals = guest_goals THEN 1
        WHEN host_goals < guest_goals THEN 0
        END
    as host_points,
    CASE
        WHEN host_goals > guest_goals THEN 0
        WHEN host_goals = guest_goals THEN 1
        WHEN host_goals < guest_goals THEN 3
        END
        as guest_points
    FROM matches
),
host_sum as (
    SELECT host_team, sum(host_points) as host_points
    FROM scores
    GROUP BY host_team
),
guest_sum as (
    SELECT guest_team, sum(guest_points) as guest_points
    FROM scores
    GROUP BY guest_team
),
team_score as (
    SELECT t.team_id, t.team_name, ht.host_points, gt.guest_points
    FROM teams t
    LEFT JOIN host_sum ht ON t.team_id = ht.host_team
    LEFT JOIN guest_sum gt ON t.team_id = gt.guest_team
)
SELECT team_id, team_name, COALESCE(host_points,0) + COALESCE(guest_points,0) as num_points
FROM team_score
ORDER BY num_points desc, team_id asc