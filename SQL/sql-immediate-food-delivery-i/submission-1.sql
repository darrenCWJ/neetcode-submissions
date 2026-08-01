-- Write your query below
SELECT ROUND(
    (
        (
        (select COUNT(delivery_id) from delivery)-(SELECT count(*) FROM delivery where (NOT order_date = customer_pref_delivery_date)) 

    ) 
    * 100.)
/ (select COUNT(delivery_id) from delivery) 
,2)
as immediate_percentage