{{ config(
    materialized='incremental',
    unique_key = 'rowid',
    incremental_strategy = 'merge'
    )}}

select
s.rowid,
s.orderid,
s.orderdate,
s.shipdate,
s.shipmode,
c.customer_sk,
p.product_sk,
s.sales,
s.quantity,
s.discount,
s.profit
from
{{ref("stg_superstore")}} s 
left join {{ref("dim_superstore_customers")}} c on s.customerid = c.customerid
left join {{ref("dim_superstore_products")}} p on p.productid = s.productid
