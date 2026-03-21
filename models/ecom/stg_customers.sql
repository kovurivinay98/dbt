{{config(
    materialized = 'view'
)}}

select 
customer_id,
customer_name,
email,
city,
updated_at
from {{source("ecom_source","customer_raw_csv")}}
qualify row_number()over (partition by customer_id order by updated_at desc) = 1
order by customer_id