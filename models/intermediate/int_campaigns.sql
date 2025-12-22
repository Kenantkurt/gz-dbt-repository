{{ dbt_utils.union_relations(
    relations=[
        ref('stg_ads__adwords'),
        ref('stg_ads__bing'),
        ref('stg_ads__criteo'),
        ref('stg_ads__facebook')
    ]
) }}
