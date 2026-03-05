{{ config(materialized = 'incremental',
    unique_key='customer_id',
    incremental_strategy = 'merge')}}

    select 
    customer_id,
    customer_name,
    city
    from {{ref("stg_customers_raw")}}