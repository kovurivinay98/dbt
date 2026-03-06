{% snapshot gemini_customer_snapshot %}

{{ config(
    target_schema = 'public',
    unique_key = 'customer_id',
    strategy = 'check',
    check_cols = (['city','customer_tier'])
)}}

select
customer_id,
customer_name,
segment,
city,
state,
postal_code,
customer_tier
from {{ref("dim_gemini_customers")}}

{% endsnapshot %}
