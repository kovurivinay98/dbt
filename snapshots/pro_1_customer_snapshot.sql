{% snapshot pro1_customer_raw %}

{{ config(
    target_schema = 'public',
    unique_key = 'customer_id',
    strategy = 'check',
    check_cols = ['address','email']
)}}

select 
customer_id,
name,
email,
address,
updated_at
from {{ source("pract_1","pro_1_customer_raw")}}
qualify row_number() over(partition by customer_id order by updated_at desc) = 1

{% endsnapshot %}