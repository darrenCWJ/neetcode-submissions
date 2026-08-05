-- Write your query below
WITH total_calls as (
SELECT LEFT(er.phone_number,3) as caller_country, LEFT(ee.phone_number,3) as callee_country, duration
FROM calls c
JOIN person er ON c.caller_id = er.id
JOIN person ee ON c.caller_id = ee.id
),
caller as (
    SELECT caller_country, sum(duration) as duration
    FROM total_calls
    GROUP BY caller_country
),
callee as (
    SELECT callee_country, sum(duration) as duration
    FROM total_calls
    GROUP BY callee_country
),
country_time as (
    SELECT er.caller_country as country_code, (er.duration + ee.duration) as total_country_duration
    FROM caller er
    JOIN callee ee ON er.caller_country = ee.callee_country
)
SELECT name as country
FROM country c
JOIN country_time ct ON c.country_code = ct.country_code
WHERE ct.total_country_duration > (SELECT avg(total_country_duration) FROM country_time)