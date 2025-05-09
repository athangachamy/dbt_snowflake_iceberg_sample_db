
    
    

select
    o_orderkey as unique_field,
    count(*) as n_records

from ICEBERG_DB.SAMPLE_DB_ICEBERG.orders
where o_orderkey is not null
group by o_orderkey
having count(*) > 1


