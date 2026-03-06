{{config(
    materialized = 'incremental',
    unique_key = 'order_id',
    incremental_strategy = 'merge'
)
}}

select 
s.order_id,
c.customer_sk,
p.product_sk,
s.quantity,
{{calculate_gemini_sales('p.price','s.quantity')}} as calculated_total_sales,
s.sales_amount,
s.order_date
from
{{ref("stg_gemini_sales")}} s 
left join {{ref("dim_gemini_customers")}} c on s.customer_id=c.customer_id
left join {{ref("dim_gemini_products")}} p on s.product_id = p.product_id

