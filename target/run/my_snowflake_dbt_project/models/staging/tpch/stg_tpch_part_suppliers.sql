
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_part_suppliers
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG_staging/stg_tpch_part_suppliers/stg_tpch_part_suppliers'
    
as (


with source as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG.partsupp

),

renamed as (

    select
    
        md5(cast(coalesce(cast(ps_partkey as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(ps_suppkey as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) 
                as part_supplier_key,
        ps_partkey as part_key,
        ps_suppkey as supplier_key,
        ps_availqty as available_quantity,
        ps_supplycost as cost,
        ps_comment as comment

    from source

)

select * from renamed
    )
;


  