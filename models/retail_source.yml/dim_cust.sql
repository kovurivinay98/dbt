{{config(materialized='table')}}
select
{{dbt_utils.generate_surrogate_key(['customer_id'])}} as customer_sk,
customer_id,
customer_name,
segment,
city,
state,
country
from {{ ref("stg_customer") }}


