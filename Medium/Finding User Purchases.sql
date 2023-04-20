select distinct user_id from (
select user_id, created_at - prev_purchase as days_in_bet
from(
select *,
lag(created_at) over(partition by user_id order by created_at) as prev_purchase
from 
amazon_transactions
order by user_id, created_at) t) t1
where days_in_bet < 7