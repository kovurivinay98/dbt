{{ config(
    materialized = 'incremental',
    unique_key = 'order_item_id',
    incremental_strategy = 'merge'
)}}

select
t.order_item_id,
o.order_id,
c.customer_sk,
o.order_date,
o.order_status,
o.payment_method,
p.product_sk,
t.quantity,
t.unit_price,
{{ calculate_total_amount('t.quantity','t.unit_price')}} as total_amount 
from 
{{ref("stg_project_orders")}} o 
left join {{ref("dim_project_customers")}} c on o.customer_id = c.customer_id
left join {{ref("stg_project_items")}} t on t.order_id = o.order_id
left join {{ref("dim_project_products")}} p on p.product_id = t.product_id