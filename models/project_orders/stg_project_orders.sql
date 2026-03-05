{{config(materialized='view')}}

select
order_id,
customer_id,
order_date,
order_status,
payment_method
from {{source("project","orders_processed")}}