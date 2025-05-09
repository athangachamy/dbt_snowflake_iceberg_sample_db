
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_suppliers
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG_staging/stg_tpch_suppliers/stg_tpch_suppliers'
    
as (


with source as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG.supplier

),

renamed as (

    select
    
        s_suppkey as supplier_key,
        s_name as supplier_name,
        s_address as supplier_address,
        s_nationkey as nation_key,
        s_phone as phone_number,
        s_acctbal as account_balance,
        s_comment as comment

    from source

)

select * from renamed
    )
;


  