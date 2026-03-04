{{ config(materialized='incremental', unique_key = 'order_id')}}

select
o.order_id,
c.customer_sk,
p.product_sk,
o.order_date,
o.quantity,
o.price,
o.total_amount
from {{ref("stg_dbt_orders")}} o 
left join {{ref("dim_dbt_customers")}} c on o.customer_id = c.customer_id
left join {{ref("dim_dbt_products")}} p on o.product_id = p.product_id

{% if is_incremental() %}

where o.order_date > (select max(order_date) from {{ this }})

{% endif %}