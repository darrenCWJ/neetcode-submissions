-- Write your query below
select employee_id,
case 
when (NOT MOD(employee_id,2) = 0 ) and name not like 'M%' THEN salary
else 0 
END 
as bonus
from employees
ORDER by employee_id