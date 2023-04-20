select first_name,salary from employee
where salary > (select salary from employee where id=manager_id);