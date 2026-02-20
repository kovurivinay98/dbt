{{config(materialized='table')}}

select * from {{source("raw_cust","cust_info")}}