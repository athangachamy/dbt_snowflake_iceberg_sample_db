
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_regions
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG_staging/stg_tpch_regions/stg_tpch_regions'
    
as (


with source as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG.region

),

renamed as (

    select
        r_regionkey as region_key,
        r_name as name,
        r_comment as comment

    from source

)

select * from renamed
    )
;


  