{{ config(materialized='table') }}

select 
customer_id,
customer_name,
city
from {{source("customers_raw","customers_raw")}}