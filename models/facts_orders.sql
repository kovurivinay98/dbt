{{config(materialized='table')}}

with facts_cust as (
    select 
    customer_id,                
    order_id ,
    order_date, 
    product_name, 
    amount,
    status
    from {{ref("raw_orders")}}
) 

select * from facts_cust