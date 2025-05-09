select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select region_key
from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_regions
where region_key is null



      
    ) dbt_internal_test