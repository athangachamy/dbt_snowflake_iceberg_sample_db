
    
    

select
    order_item_key as unique_field,
    count(*) as n_records

from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_line_items
where order_item_key is not null
group by order_item_key
having count(*) > 1


