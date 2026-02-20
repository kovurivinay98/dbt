{{config(materialized='table')}}

select
order_id,
customer_id,
order_date,
status,
from {{ref("stage_raw_orders")}}

