with sales as (

    select *
    from {{ ref('stg_raw__sales') }}

),

products as (

    select *
    from {{ ref('stg_raw__product') }}

)

select sales.date_date,
sales.orders_id,
sales.products_id,
sales.revenue,
sales.quantity,
products.purchase_price,
sales.quantity*products.purchase_price as purchase_cost,
round(sales.revenue - (sales.quantity*products.purchase_price),2) as margin
from sales
left join products
    on sales.products_id = products.products_id
