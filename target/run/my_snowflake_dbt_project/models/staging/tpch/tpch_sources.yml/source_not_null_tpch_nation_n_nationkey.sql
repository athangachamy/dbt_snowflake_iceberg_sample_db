select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select n_nationkey
from ICEBERG_DB.SAMPLE_DB_ICEBERG.nation
where n_nationkey is null



      
    ) dbt_internal_test