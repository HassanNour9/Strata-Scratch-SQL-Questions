(select 'bull ',sum(
case 
when contents like '%bull%' then 1
else 0
end) as bull_occur from google_file_store)
union all
select 'bear',sum(
case 
when contents like '%bear%' then 1
else 0
end) as bear_occur from google_file_store

