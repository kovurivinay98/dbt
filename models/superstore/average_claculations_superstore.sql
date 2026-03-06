{{ config(materialized='table' )}}

select
productid,
productname,
{{avg_col(['sales','quantity','discount','profit'])}}
 from {{ref("stg_superstore")}}
 group by productid,productname