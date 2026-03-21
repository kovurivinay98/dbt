{% snapshot customer_snapshot %}
{{config(
    target_schema = 'snapshot',
    unique_key = 'customer_id',
    strategy = 'check',
    check_cols = ['customer_name','email','city']
)}}
select
customer_id,
customer_name,
email,
city,
updated_at
from {{source("ecom_source","customer_raw_csv")}}

{% endsnapshot %}
