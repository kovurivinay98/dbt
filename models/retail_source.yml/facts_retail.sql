{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

select
o.order_id,
o.order_date,
c.customer_sk,
p.product_sk,
o.quantity,
o.sales,
o.profit

from {{ ref('stg_orders') }} o

left join {{ ref('dim_cust') }} c
    on o.customer_id = c.customer_id

left join {{ ref('dim_products1') }} p
    on o.product_id = p.product_id

{% if is_incremental() %}

where o.order_date > (
    select max(order_date) from {{ this }}
)

{% endif %}