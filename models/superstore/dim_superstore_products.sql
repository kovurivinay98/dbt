{{ config(materialized='table') }}

select distinct
{{ dbt_utils.generate_surrogate_key(['productid'])}} as product_sk,
productid,
category,
subcategory
from
{{ ref("stg_superstore") }}
