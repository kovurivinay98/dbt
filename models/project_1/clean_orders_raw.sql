select
order_id,
customer_id,
order_date,
amount,
updated_at
from {{ source("pract_1","orders_raw")}}
qualify row_number()over(partition by order_id,customer_id,order_date order by updated_at desc,amount desc) = 1
order by order_id