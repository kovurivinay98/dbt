{% snapshot sf_snapshot %}

{{config(
    target_schema = 'public',
    unique_key = 'order_id',
    strategy = 'check',
    check_cols = ['order_status','total_amount']
)}}

select
order_id,
customer_id,
order_status,
total_amount
from {{ref("stg_tpch_orders")}}

{% endsnapshot %}