{% snapshot jeera_1_customer_raw_snap %}

{{ config(
    target_schema = 'snapshot',
    unique_key = 'customer_id',
    strategy ='check',
    check_cols = ['customer_name','email','city']
)}}

select 
customer_id,
customer_name,
email,
city,
updated_at
from {{source("jeera_1","customer_raw")}}
qualify row_number() over (partition by customer_id order by updated_at desc) = 1

{% endsnapshot %}