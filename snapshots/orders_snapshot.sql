{% snapshot sf_orders_snapshot %}

{{ config(
    target_schema = 'public',
    unique_key = 'ORDER_ID',
    strategy = 'check',
    check_cols =(['ORDER_STATUS','TOTAL_AMOUNT'])
)}}

select
ORDER_ID,
CUSTOMER_ID,
ORDER_STATUS,
TOTAL_AMOUNT
from {{ref("stg_tpch_orders")}}


{% endsnapshot %}