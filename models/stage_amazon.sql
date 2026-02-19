{{config(materialized='table')}}


select * from {{ref("amazon")}}