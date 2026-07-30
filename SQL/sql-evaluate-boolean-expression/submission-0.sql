-- Write your query below --
WITH leftside as (
    SELECT e.left_operand, e.operator, e.right_operand, value as left_value
    FROM expressions e
    JOIN variables v on e.left_operand = v.name
),
rightside as (
    SELECT l.left_operand, l.operator, l.right_operand, l.left_value, value as right_value
    FROM leftside l
    JOIN variables v on l.right_operand = v.name
)
SELECT left_operand, operator, right_operand, CASE operator
    WHEN '=' THEN CASE WHEN left_value = right_value THEN 'true' ELSE 'false' END
    WHEN '>' THEN CASE WHEN left_value > right_value THEN 'true' ELSE 'false' END
    WHEN '<' THEN CASE WHEN left_value < right_value THEN 'true' ELSE 'false' END
    END
 as value
FROM rightside