{{config(materialized='table')}}

select * from {{source("ss_source","superstore_raw")}}