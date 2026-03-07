{{ config(materialized='table')}}

select
o_orderkey as order_id,
o_custkey as customer_id,
o_orderstatus as order_status,
o_totalprice as total_amount,
o_orderdate as order_date,
(case when o_totalprice > 100000 then TRUE else FALSE end) as is_high_value_order
from {{source("tpch_sf","orders")}}

QUALIFY ROW_NUMBER()OVER(PARTITION BY o_orderkey ORDER BY o_orderdate DESC) = 1
