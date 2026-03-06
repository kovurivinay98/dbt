{{ config(materialized = 'view') }}

select
rowid,
orderid,
orderdate,
shipdate,
shipmode,
customerid,
customername,
segment,
country,
city,
state,
postalcode,
region,
productid,
category,
subcategory,
productname,
quantity,
discount,
profit
from {{ source("superstore","superstore_raw") }}