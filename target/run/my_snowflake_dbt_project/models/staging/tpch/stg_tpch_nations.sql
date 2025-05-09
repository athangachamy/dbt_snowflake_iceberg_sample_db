
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_nations
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG_staging/stg_tpch_nations/stg_tpch_nations'
    
as (


with source as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG.nation

),

renamed as (

    select
    
        n_nationkey as nation_key,
        n_name as name,
        n_regionkey as region_key,
        n_comment as comment

    from source

)

select * from renamed
    )
;


  