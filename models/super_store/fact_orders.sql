{{ config(materialized='table') }}

select

    s.orderid,
    c.customer_sk,
    p.product_sk,
    s.sales,
    s.quantity,
    s.discount,
    s.profit

from {{ ref('stg_superstore') }} s

left join {{ ref('dim_customer') }} c
    on s.customerid = c.customerid

left join {{ ref('dim_products') }} p
    on s.productid = p.productid