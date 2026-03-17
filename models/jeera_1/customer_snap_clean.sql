{{ config(
    materialized = 'table'
) }}

select 
customer_id,
customer_name,
email,
city,
updated_at,
dbt_valid_from as start_date,
dbt_valid_to as end_date,
case when dbt_valid_to is null then TRUE else FALSE END AS  dbt_current_flag
from {{ref("jeera_1_customer_raw_snap")}}