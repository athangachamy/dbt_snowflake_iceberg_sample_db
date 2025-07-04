
    
    

with child as (
    select l_orderkey as from_field
    from ICEBERG_DB.SAMPLE_DB_ICEBERG.lineitem
    where l_orderkey is not null
),

parent as (
    select o_orderkey as to_field
    from ICEBERG_DB.SAMPLE_DB_ICEBERG.orders
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


