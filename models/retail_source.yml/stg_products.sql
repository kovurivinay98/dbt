{{config(materialized='table')}}

select 
product_id,
product_name,
category,
subcategory
from {{source("retail_source","prod")}}
