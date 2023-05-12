with ms as (select f.date,sum(case 
when a.paying_customer='yes' then f.downloads else 0 end ) as paying ,
sum(case 
when a.paying_customer='no' then f.downloads else 0 end ) as non_paying
from ms_download_facts f join ms_user_dimension u on f.user_id=u.user_id
join ms_acc_dimension a on u.acc_id=a.acc_id
group by f.date
)

select * from ms
WHERE non_paying > paying
order by date