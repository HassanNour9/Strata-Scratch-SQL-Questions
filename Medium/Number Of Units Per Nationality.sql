select country,count(distinct(u.unit_id)) from airbnb_hosts h join airbnb_units u 
on h.host_id=u.host_id
where age<30 and u.unit_type='apartment'
group by country;