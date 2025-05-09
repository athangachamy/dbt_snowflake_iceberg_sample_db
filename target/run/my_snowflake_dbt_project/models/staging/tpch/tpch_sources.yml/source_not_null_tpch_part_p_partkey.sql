select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select p_partkey
from ICEBERG_DB.SAMPLE_DB_ICEBERG.part
where p_partkey is null



      
    ) dbt_internal_test