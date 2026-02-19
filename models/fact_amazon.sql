
{{config(materialized='table')}}

select 
order_id,
quantity,
total_sales,
customer_id,
unit_price,
discount,
shipping_cost
from {{ref("stage_amazon")}}