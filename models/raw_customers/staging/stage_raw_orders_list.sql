{{config(materialized='table')}}
select * from {{source("raw_cust","ord_items")}}