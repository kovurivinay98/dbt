{{config(materialized='table')}}

select 
order_id,
order_date,
customer_id,
product_id,
quantity,
sales,
profit
from {{source("retail_source","ord")}}