{{ config(materialized='table') }}

select

    {{ dbt_utils.generate_surrogate_key(['productid']) }} as product_sk,
    productid,
    max(productname) as productname,
    max(category) as category,
    max(subcategory) as subcategory

from {{ ref('stg_superstore') }}

group by productid