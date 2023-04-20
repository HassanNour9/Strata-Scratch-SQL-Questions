with cte as( select em_tit,gend,(sal+sum_bonus) as sum_compen
from(
select e.id as emid,employee_title as em_tit,sex as gend,salary as sal,sum(bonus) as sum_bonus
from sf_employee e join sf_bonus b
on e.id=b.worker_ref_id
group by e.id,employee_title,sex,salary) as sum_emp_bon
)

select em_tit,gend,avg(sum_compen) as avg_compensation from cte
group by em_tit,gend
;