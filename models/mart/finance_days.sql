with orders_margin as (

    select *
    from {{ ref('int_orders_margin') }}

),

orders_operational as (
    select * from {{ref("int_orders_operational")}}
),


ship as (
    select * from {{ref("stg_raw__ship")}}
)

select orders_margin.date,
count(orders_margin.orders_id) as number_of_transaction,
sum(orders_margin.total_revenue) as total_revenue,
sum(orders_margin.total_revenue)/count(orders_margin.orders_id) as average_basket,
sum(orders_operational.operational_margin) as operational_margin,
sum(orders_margin.total_purchase_cost) as total_purchase_cost,
sum(ship.shipping_fee) as total_shipping_fees,
sum(ship.logcost) as total_log_costs,
sum(orders_margin.nb_of_products) as total_nb_of_products
from orders_margin left join orders_operational on orders_operational.orders_id = orders_margin.orders_id
left join ship on ship.orders_id = orders_margin.orders_id
group by orders_margin.date

