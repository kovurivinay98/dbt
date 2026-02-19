{{config(materialized='table')}}

with unique_customers as(
    select distinct
    customer_id,
    customer_name,
    customer_email
    from {{ref("raw_orders")}}
)
select * from unique_customers