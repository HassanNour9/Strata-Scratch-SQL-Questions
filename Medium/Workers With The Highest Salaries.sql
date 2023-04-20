select worker_title from
(select worker_title ,dense_rank() over ( order by salary desc)
as rn from worker w join title t 
on worker_id=worker_ref_id) as x
where rn=1