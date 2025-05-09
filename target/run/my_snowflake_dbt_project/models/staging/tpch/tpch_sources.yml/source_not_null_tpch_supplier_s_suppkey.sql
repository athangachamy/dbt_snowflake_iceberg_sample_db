select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select s_suppkey
from ICEBERG_DB.SAMPLE_DB_ICEBERG.supplier
where s_suppkey is null



      
    ) dbt_internal_test