{{ config(
    
    materialized = 'incremental',
    unique_key = 'order_item_id',
    incremental_strategy = 'merge'

)}}

select 
t.order_item_id,
o.order_id,
c.customer_sk,
p.product_sk,
t.quantity,
t.unit_price,
(t.quantity*t.unit_price) as total_price
from {{ref("stg_project_orders")}} o 
left join {{ref("stg_project_items")}} t on o.order_id = t.order_id
left join {{ref("dim_project_customers")}} c on o.customer_id = c.customer_id
left join {{ref("dim_project_products")}} p on t.product_id = p.product_id