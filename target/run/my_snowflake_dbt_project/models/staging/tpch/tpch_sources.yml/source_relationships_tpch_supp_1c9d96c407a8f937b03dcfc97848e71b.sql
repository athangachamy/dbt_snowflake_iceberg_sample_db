select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select s_nationkey as from_field
    from ICEBERG_DB.SAMPLE_DB_ICEBERG.supplier
    where s_nationkey is not null
),

parent as (
    select n_nationkey as to_field
    from ICEBERG_DB.SAMPLE_DB_ICEBERG.nation
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test