{{config(materialized='table')}}
select
distinct
product_id,
category,
sub_category
from {{ref("stage_orders")}}