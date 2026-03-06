{% snapshot customer_superstore_snapshot %}

{{ config(
    target_schema = 'public',
    unique_key = 'customerid',
    strategy = 'check',
    check_cols = (['customername','segment'])
)}}

select
customerid,
customername,
segment
from {{ref("dim_superstore_customers")}}

{% endsnapshot %}
