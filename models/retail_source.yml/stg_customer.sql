{{config(materialized='table')}}

select distinct
customer_id,
customer_name,
segment,
city,
state,
country
from {{source("retail_source","custom")}}
