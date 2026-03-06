{{config(materialized='view')}}

select 
order_id,
customer_id,
product_id,
quantity,
sales_amount,
order_date
from
{{source("gemini_project","raw_sales")}}