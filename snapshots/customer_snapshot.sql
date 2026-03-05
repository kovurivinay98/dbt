{% snapshot customer_snapshot %}

{{ config(
    target_schema='PUBLIC',
    unique_key='customer_id',
    strategy='check',
    check_cols=['customer_name']
) }}

select
customer_id,
customer_name
from {{ ref('dim_dbt_customers') }}

{% endsnapshot %}