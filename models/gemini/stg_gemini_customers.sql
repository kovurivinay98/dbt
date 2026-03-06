{{config(materialized='view')}}

select 
customerid as customer_id,
customername as customer_name,
segment,
city,
state,
postalcode as postal_code,
customer_tier,
updated_at
from {{source("gemini_project","raw_customers")}}

