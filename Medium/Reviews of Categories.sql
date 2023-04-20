select value,sum(review_count) as sum_reviews from yelp_business 
cross apply string_split(categories,';') 
group by value
order by sum_reviews desc;