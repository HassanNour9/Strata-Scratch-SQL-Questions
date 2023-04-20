select  Abs(
(select max(salary) from db_employee e join db_dept d
on e.department_id=d.id
where department='engineering')
-(select max(salary) from db_employee e join db_dept d
on e.department_id=d.id
where department='marketing')  ) as f