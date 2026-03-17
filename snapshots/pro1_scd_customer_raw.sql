{% snapshot customer_raw_scd %}

{{ config(
    target_schema = 'public',
    unique_key = 'customer_id',
    strategy = 'checks',
    check_cols = ['email','address']

)}}

select 
customer_id,
name,
email,
address,
updated_at
from {{source("pract_1","CUSTOMER_RAW_SCD")}}

{% endsnapshot%}