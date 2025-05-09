{{ config(
    materialized="table",
    table_format="iceberg",
    external_volume="iceberg_external_volume",
    base_location_subpath="core_dim_parts",
    tags="hourly",
) }}


with part as (

    select * from {{ref('stg_tpch_parts')}}

),

final as (
    select 
        part_key,
        manufacturer,
        name,
        brand,
        type,
        size,
        container,
        retail_price
    from
        part
)
select *
from final  
order by part_key