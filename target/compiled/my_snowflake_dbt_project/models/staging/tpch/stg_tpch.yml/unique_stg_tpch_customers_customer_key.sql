
    
    

select
    customer_key as unique_field,
    count(*) as n_records

from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_customers
where customer_key is not null
group by customer_key
having count(*) > 1


