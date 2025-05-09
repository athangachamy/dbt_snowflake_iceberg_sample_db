select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    part_key as unique_field,
    count(*) as n_records

from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_parts
where part_key is not null
group by part_key
having count(*) > 1



      
    ) dbt_internal_test