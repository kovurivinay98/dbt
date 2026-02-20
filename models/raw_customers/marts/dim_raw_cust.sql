{{config(materialized='table')}}
select
distinct
customer_id,
concat(first_name,' ',last_name) as full_name,
country,
created_at
from {{ref("stage_raw_cust")}}