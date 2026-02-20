{{config(materialized='table')}}

select * from {{source("raw_cust","country_info")}}