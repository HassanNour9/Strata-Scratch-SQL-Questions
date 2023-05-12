with fin_res1 as (
select month,sum(value) as tot_sal from (
select substring( cast(created_at as varchar),0,8) month, value
from sf_transactions
) x
group  by month
),
fin_res2 as 
(select *, lag(tot_sal) over ( order by month) prev_sal from fin_res1 ),

fin_res3 as
( select * ,
	 ( cast ((tot_sal - prev_sal) as float) / cast( prev_sal as float)* 100 ) 
	 presen 
	from fin_res2 
	)
select month, round(presen,2) from fin_res3  --