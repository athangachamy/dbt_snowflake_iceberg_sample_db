select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select c_custkey
from ICEBERG_DB.SAMPLE_DB_ICEBERG.customer
where c_custkey is null



      
    ) dbt_internal_test