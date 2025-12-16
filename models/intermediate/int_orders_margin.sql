with sales_margin as (
    select * from {{ref("int_sales_margin")}}
)

select date_date as date,
orders_id,
round(sum(revenue),2) as total_revenue,
sum(quantity) as nb_of_products,
round(sum(purchase_cost),2) as total_purchase_cost,
round(sum(margin),2) as total_margin
from sales_margin
group by orders_id , date_date 
