
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG.part_suppliers
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG/part_suppliers/intm_part_suppliers'
    
as (


with part as (
    
    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_parts

),


supplier as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_suppliers

),

part_supplier as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_part_suppliers

),

final as (
    select 

    part_supplier.part_supplier_key,
    part.part_key,
    part.name as part_name,
    part.manufacturer,
    part.brand,
    part.type as part_type,
    part.size as part_size,
    part.container,
    part.retail_price,

    supplier.supplier_key,
    supplier.supplier_name,
    supplier.supplier_address,
    supplier.phone_number,
    supplier.account_balance,
    supplier.nation_key,

    part_supplier.available_quantity,
    part_supplier.cost
from
    part 
inner join 
    part_supplier
        on part.part_key = part_supplier.part_key
inner join
    supplier
        on part_supplier.supplier_key = supplier.supplier_key
order by
    part.part_key
)

select * from final
    )
;


  