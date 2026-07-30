-- Write your query below
With crimson_only As (
    Select O.sales_id, O.com_id, C.name
    From orders O
    Left Join company C
    ON O.com_id = C.com_id
    Where C.name = 'CRIMSON'
)
Select S.name
From sales_person S
Left Join crimson_only C On 
S.sales_id = C.sales_id
Where C.sales_Id Is Null