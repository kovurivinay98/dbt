{{ config(materialized='table')}} 

select distinct
{{ dbt_utils.generate_surrogate_key(['product_id'])}} as product_sk,
product_id,
product_name,
category
from {{ref("stg_dbt_orders")}}
