{{ config(
    materialized="table",
    table_format="iceberg",
    external_volume="iceberg_external_volume",
    base_location_subpath="stg_tpch_regions",
    tags="hourly",
) }}


with source as (

    select * from {{ source('tpch', 'region') }}

),

renamed as (

    select
        r_regionkey as region_key,
        r_name as name,
        r_comment as comment

    from source

)

select * from renamed