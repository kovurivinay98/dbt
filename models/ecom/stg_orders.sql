{{config(
    materialized = 'view'
)}}

select
order_id,
customer_id,
order_date,
total_amount,
case when status = 'completed' then 'complete'
     when status = 'cancelled' then 'cancel'
     else 'unknown'
     end as status

from {{source("ecom_source","orders_raw_csv")}}