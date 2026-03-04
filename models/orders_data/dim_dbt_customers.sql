{{ config(materialized='table')}}

select distinct
{{ dbt_utils.generate_surrogate_key(['customer_id'])}} as customer_sk,
customer_id,
customer_name
from
{{ ref("stg_dbt_orders")}}