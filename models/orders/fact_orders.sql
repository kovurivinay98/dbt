{{config(materialized='table')}}
select
row_id,
order_id,
order_date,
ship_date,
ship_mode,
customer_id,
segment,
product_id,
sales,
quantity,
discount,
profit,
product_name
from {{ref("stage_orders")}}


