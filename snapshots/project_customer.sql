{% snapshot project_snapshot %}

{{config(
    target_schema = 'public',
    unique_key = 'customer_id',
    strategy = 'check',
    check_cols = ['city','customer_tier']
)}}

select 
customer_id,
customer_name,
email,
city,
signup_date,
customer_tier
from {{ref("dim_project_customers")}}

{% endsnapshot %}