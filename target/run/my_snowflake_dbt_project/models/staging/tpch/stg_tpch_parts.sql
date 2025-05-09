
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_parts
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG_staging/stg_tpch_parts/stg_tpch_parts'
    
as (


with source as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG.part

),

renamed as (

    select
    
        p_partkey as part_key,
        p_name as name,
        p_mfgr as manufacturer,
        p_brand as brand,
        p_type as type,
        p_size as size,
        p_container as container,
        p_retailprice as retail_price,
        p_comment as comment

    from source

)

select * from renamed
    )
;


  