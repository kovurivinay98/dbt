{{ config(materialize='view')}}

select
customer_id,
customer_name,
email,
city,
signup_date,
customer_tier
from {{source("project","customers_processed")}}