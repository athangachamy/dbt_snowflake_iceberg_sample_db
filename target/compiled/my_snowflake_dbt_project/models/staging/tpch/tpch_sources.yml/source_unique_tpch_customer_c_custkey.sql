
    
    

select
    c_custkey as unique_field,
    count(*) as n_records

from ICEBERG_DB.SAMPLE_DB_ICEBERG.customer
where c_custkey is not null
group by c_custkey
having count(*) > 1


