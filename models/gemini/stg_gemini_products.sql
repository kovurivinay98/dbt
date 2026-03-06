{{ config(materialized='view')}}

select 
productid as product_id,
productname as product_name,
category,
price
from 
{{source("gemini_project","raw_products")}}