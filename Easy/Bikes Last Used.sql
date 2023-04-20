select bike_number,end_time 
from(
select bike_number,end_time ,
row_number() over (partition by bike_number order by end_time desc) as rn
from dc_bikeshare_q1_2012
group by bike_number,end_time)as x
where rn=1
order by end_time desc;