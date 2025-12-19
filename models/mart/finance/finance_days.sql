{{ config(materialized='table') }}


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
round(sum(orders_margin.total_revenue),2) as total_revenue,
round(sum(orders_margin.total_revenue)/count(orders_margin.orders_id),2) as average_basket,
round(sum(orders_operational.operational_margin),2) as operational_margin,
round(sum(orders_margin.total_purchase_cost),2) as total_purchase_cost,
round(sum(ship.shipping_fee),2) as total_shipping_fees,
round(sum(ship.logcost),2) as total_log_costs,
round(sum(orders_margin.nb_of_products),2) as total_nb_of_products
from orders_margin left join orders_operational on orders_operational.orders_id = orders_margin.orders_id
left join ship on ship.orders_id = orders_margin.orders_id
group by orders_margin.date

