
    
    

with child as (
    select ps_suppkey as from_field
    from ICEBERG_DB.SAMPLE_DB_ICEBERG.partsupp
    where ps_suppkey is not null
),

parent as (
    select s_suppkey as to_field
    from ICEBERG_DB.SAMPLE_DB_ICEBERG.supplier
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


