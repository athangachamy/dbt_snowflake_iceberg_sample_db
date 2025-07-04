select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    s_suppkey as unique_field,
    count(*) as n_records

from ICEBERG_DB.SAMPLE_DB_ICEBERG.supplier
where s_suppkey is not null
group by s_suppkey
having count(*) > 1



      
    ) dbt_internal_test