{{config(materialized='table')}}
select
distinct
{{dbt_utils.generate_surrogate_key(['customerid'])}} as customer_sk,
customerid,
customername,
segment
from
{{ref("stg_superstore")}}

