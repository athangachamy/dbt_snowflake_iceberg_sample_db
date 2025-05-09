
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG.dim_suppliers
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG/dim_suppliers/core_dim_suppliers'
    
as (


with supplier as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_suppliers

),
nation as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_nations
),
region as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_regions

),
final as (

    select 
        supplier.supplier_key,
        supplier.supplier_name,
        supplier.supplier_address,
        nation.name as nation,
        region.name as region,
        supplier.phone_number,
        supplier.account_balance
    from
        supplier
    inner join nation
            on supplier.nation_key = nation.nation_key
    inner join region 
            on nation.region_key = region.region_key
)

select * from final
    )
;


  