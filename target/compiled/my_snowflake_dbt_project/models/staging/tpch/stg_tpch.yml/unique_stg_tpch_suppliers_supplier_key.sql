
    
    

select
    supplier_key as unique_field,
    count(*) as n_records

from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_suppliers
where supplier_key is not null
group by supplier_key
having count(*) > 1


