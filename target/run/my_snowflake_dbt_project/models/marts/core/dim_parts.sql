
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG.dim_parts
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG/dim_parts/core_dim_parts'
    
as (


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
    )
;


  