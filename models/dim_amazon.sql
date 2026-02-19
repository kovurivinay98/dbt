{{config(materialized='table')}}
select 
distinct
customer_id,
customer_name,
country,
state,
city
from {{ref("amazon")}}
