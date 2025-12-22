with sales as (

    select *
    from {{ ref('stg_raw__sales') }}

),

product_dim as (

    select *
    from {{ ref('stg_raw__product') }}

)

select
    sales.date_date,
    sales.orders_id,
    sales.products_id as product_id,
    sales.revenue,
    sales.quantity,
    product_dim.purchase_price,
    sales.quantity * product_dim.purchase_price as purchase_cost,
    round(
        sales.revenue - (sales.quantity * product_dim.purchase_price),
        2
    ) as margin,
    {{ margin_percent(
        'sales.revenue',
        'sales.quantity * product_dim.purchase_price'
    ) }} as margin_percent
from sales
left join product_dim
    on sales.products_id = product_dim.products_id
