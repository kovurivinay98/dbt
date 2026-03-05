{ % snapshot customer_raw_snapshot % }

{{  config(target_schema='public',
    unique_key='customer_id',
    strategy=check,
    check_cols=['city'])}}

    select 
    customer_id,
    customer_name,
    city
    from {{ref("stg_customers_raw")}}

{ % endsnapshot% }