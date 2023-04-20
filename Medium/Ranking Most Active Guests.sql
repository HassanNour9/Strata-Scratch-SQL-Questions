select dense_rank() over(order by sum(n_messages) desc) as rnk, id_guest,
sum(n_messages) as total from airbnb_contacts
group by id_guest