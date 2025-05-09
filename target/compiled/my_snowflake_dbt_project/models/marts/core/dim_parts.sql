


with part as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_parts

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