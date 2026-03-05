{{ config(materialized='table')}}

select distinct
{{ dbt_utils.generate_surrogate_key(['customer_id'])}} as customer_sk,
customer_id,
customer_name,
email,
city,
signup_date,
customer_tier
from {{ref("stg_customers")}}