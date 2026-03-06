{{ config(materialized='table')}}

select
customer_name,
count(*) as total_orders,
sum(quantity*unit_price) as total_sales
from 
{{ref("facts_project")}} f  left join {{ref("dim_project_customers")}} c
on f.customer_sk = c.customer_sk
group by customer_name,f.customer_sk
