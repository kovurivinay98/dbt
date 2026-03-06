{{ config(materialized='table')}}

select 
customerid,
{{sum_col(['sales','quantity','discount','profit'])}}
from {{ref("stg_superstore")}}
group by customerid