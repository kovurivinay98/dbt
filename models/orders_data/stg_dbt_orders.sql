{{ config(materialized='table') }}


select 
order_id,
customer_id,
customer_name,
product_id,
product_name,
category,
order_date,
quantity,
price,
quantity*price as total_amount

from {{source("orders_data","dbt_orders")}}