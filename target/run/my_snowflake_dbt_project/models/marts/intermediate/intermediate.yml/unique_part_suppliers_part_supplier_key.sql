select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    part_supplier_key as unique_field,
    count(*) as n_records

from ICEBERG_DB.SAMPLE_DB_ICEBERG.part_suppliers
where part_supplier_key is not null
group by part_supplier_key
having count(*) > 1



      
    ) dbt_internal_test