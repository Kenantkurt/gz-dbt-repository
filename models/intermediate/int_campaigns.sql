select * from {{ref("stg_ads__adwords")}}
union all
select * from {{ref("stg_ads__bing")}}
union all
select * from {{ref("stg_ads__criteo")}}
union all
select * from {{ref("stg_ads__facebook")}}