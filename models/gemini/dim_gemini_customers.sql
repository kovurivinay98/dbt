{{config(materialized='table')}}

select distinct
{{dbt_utils.generate_surrogate_key(['customer_id'])}} as customer_sk,
customer_id,
customer_name,
segment,
city,
state,
postal_code,
customer_tier
from
{{ref("stg_gemini_customers")}}

