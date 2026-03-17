{{ config(
    materialized= 'incremental',
    unique_key = ['order_id','customer_id','order_date']
    )}}

  with source_data as ( select 
    order_id,
    customer_id,
    order_date,
    amount,
    updated_at
    from {{source("pract_1","orders_raw")}}

    {% if is_incremental() %}

    where updated_at > (select max(updated_at) from {{ this }})

    {% endif %} )


    select * from source_data
    qualify row_number( ) over (partition by order_id,customer_id,order_date order by updated_at desc, amount desc) = 1