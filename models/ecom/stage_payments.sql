{{config(
    materialized = 'view'
)}}

select
payment_id,
order_id,
payment_method,
payment_status
from {{source("ecom_source","payments_raw_csv")}}
