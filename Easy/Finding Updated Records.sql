select id,first_name,last_name,salary,department_id
from
(select * ,rank() over (partition by id order by salary desc) as rn from ms_employee_salary) as sal_rn
where rn=1;