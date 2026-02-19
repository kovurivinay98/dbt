{{config(materialized="table")}}







with customer as 
(
    -- Hardcode the path: DATABASE.SCHEMA.TABLE
    select id, concat(first_name,' ',last_name) as full_name 
    from RAW.JAFFLE_SHOP.CUSTOMERS 
),

orde as
(
    select
        user_id,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date,
        count(*) as order_count
    from RAW.JAFFLE_SHOP.ORDERS
    group by user_id
)

select
    id,
    full_name,
    first_order_date,
    last_order_date,
    order_count
from customer c 
left join orde o on c.id = o.user_id
