with source as (
    select * from {{source('ads','criteo')}}
),

renamed as (
    select
    date_date as date,
    'criteo' as paid_source,
    campaign_key,
    camPGN_name as campaign_name,
    cast(ads_cost as float64) as ads_cost,
    cast(impression as int64) as impression,
    cast(click as int64) as click
    from source
)

select * from renamed
