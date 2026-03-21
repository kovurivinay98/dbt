{{config(
    materialized = 'table'
)}}

select 
{{dbt_utils.generate_surrogate_key(['customer_id','dbt_valid_from'])}} as customer_sk,
customer_id,
customer_name,
email,
city,
dbt_valid_from,
dbt_valid_to,
case when dbt_valid_to is null then true else false end as is_current


from {{ref("customer_snapshot")}}