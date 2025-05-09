select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select r_regionkey
from ICEBERG_DB.SAMPLE_DB_ICEBERG.region
where r_regionkey is null



      
    ) dbt_internal_test