-- Write your query below
SELECT date_id, make_name, count(DISTINCT lead_id) as unique_leads, count(DISTINCT partner_id) as unique_partners
FROM daily_sales
GROUP BY date_id, make_name