{{ config(materialized='view')}}

select
product_id,
product_name,
category,
subcategory,
price
from {{source("project","products_processed")}}