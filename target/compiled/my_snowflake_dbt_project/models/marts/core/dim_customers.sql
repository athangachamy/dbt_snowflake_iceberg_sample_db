


with customer as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_customers

),
nation as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_nations
),
region as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_regions

),
final as (
    select 
        customer.customer_key,
        customer.name,
        customer.address,
        
        nation.name as nation,
        
        region.name as region,
        customer.phone_number,
        customer.account_balance,
        customer.market_segment
        -- new column
    from
        customer
        inner join nation
            on customer.nation_key = nation.nation_key
        inner join region
            on nation.region_key = region.region_key
)
select 
    *
from
    final
order by
    customer_key