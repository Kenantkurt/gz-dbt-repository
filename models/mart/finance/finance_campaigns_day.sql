{{ config(materialized='view') }}

with campaigns_day as (

    select
        date,
        sum(ads_cost) as ads_cost,
        sum(impression) as ads_impression,
        sum(click) as ads_clicks
    from {{ ref('int_campaigns') }}
    group by date

)

select
    f.date,
    f.operational_margin - coalesce(c.ads_cost, 0) as ads_margin,
    f.average_basket,
    f.operational_margin,
    c.ads_cost,
    c.ads_impression,
    c.ads_clicks,
    f.total_nb_of_products as quantity,
    f.total_revenue as revenue,
    f.total_purchase_cost as purchase_cost,
    f.total_shipping_fees as shipping_fee,
    f.total_log_costs as log_cost
from {{ ref('finance_days') }} f
left join campaigns_day c
    on f.date = c.date
