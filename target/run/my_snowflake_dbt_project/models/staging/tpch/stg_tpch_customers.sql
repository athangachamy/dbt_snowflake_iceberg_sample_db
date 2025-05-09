
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_customers
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG_staging/stg_tpch_customers/stg_tpch_customers'
    
as (


with source as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG.customer

),

renamed as (

    select
    
        c_custkey as customer_key,
        c_name as name,
        c_address as address, 
        c_nationkey as nation_key,
        c_phone as phone_number,
        c_acctbal as account_balance,
        c_mktsegment as market_segment,
        c_comment as comment

    from source

)

select * from renamed
    )
;


  