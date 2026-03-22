{{config(
    materialized = 'table'
)}}

select
order_id,
customer_sk,
order_date,
total_amount,
payment_status
from {{ref("stg_orders")}} o inner join {{ ref("dim_customer")}}c 
on o.customer_id = c.customer_id
where 
order_date >= dbt_valid_from
and
(order_date < dbt_valid_to 
or 
dbt_valid_to is null)