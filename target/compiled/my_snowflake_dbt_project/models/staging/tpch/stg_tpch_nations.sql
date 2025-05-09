


with source as (

    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG.nation

),

renamed as (

    select
    
        n_nationkey as nation_key,
        n_name as name,
        n_regionkey as region_key,
        n_comment as comment

    from source

)

select * from renamed