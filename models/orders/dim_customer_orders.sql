{{config(materialized='table')}}
select 
distinct
customer_id,
customer_name,
country,
city,
state,
postalcode,
region
from
{{ source("orders_src","orders1")}}
