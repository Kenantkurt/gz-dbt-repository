with orders_margin as (

    select *
    from {{ ref('int_orders_margin') }}

),

ship as (

    select *
    from {{ ref('stg_raw__ship') }}

)

select orders_margin.date,
orders_margin.orders_id,
round(orders_margin.total_margin+ ship.shipping_fee-ship.logCost-ship.ship_cost,2) as operational_margin
from orders_margin left join ship on ship.orders_id = orders_margin.orders_id

