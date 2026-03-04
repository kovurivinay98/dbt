{{config(materialized='table')}}
select
customer_sk,
product_sk,
order_id,
order_date,
o.customer_id,
o.product_id,
quantity,
sales,
profit
from {{ref("stg_orders")}} o 
left join {{ref("dim_cust")}} c on o.customer_id = c.customer_id
left join {{ref("dim_products1")}} p on o.product_id = p.product_id