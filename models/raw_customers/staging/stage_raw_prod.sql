{{config(materialized='table')}}

select * from {{source("raw_cust","prod")}}