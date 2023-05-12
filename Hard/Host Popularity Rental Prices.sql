with t1 as (
select concat(price, room_type, host_since, zipcode, number_of_reviews) as host_id,number_of_reviews,price from airbnb_host_searches),
t2 as (
select distinct host_id, number_of_reviews,price,
CASE 
WHEN number_of_reviews > 40 THEN 'Hot'
WHEN number_of_reviews >= 16 THEN 'Popular'
WHEN number_of_reviews >= 6 THEN 'Trending Up'
WHEN number_of_reviews >= 1 THEN 'Rising'
ELSE 'New'
END as pop_rating
from t1)

select pop_rating, min(price) as min_p, avg(price) as avg_p, max(price) as max_p
from t2
group by pop_rating