{{ config(
    materialized="table",
    table_format="iceberg",
    external_volume="iceberg_external_volume",
    base_location_subpath="stg_tpch_suppliers",
    tags="hourly",
) }}


with source as (

    select * from {{ source('tpch', 'supplier') }}

),

renamed as (

    select
    
        s_suppkey as supplier_key,
        s_name as supplier_name,
        s_address as supplier_address,
        s_nationkey as nation_key,
        s_phone as phone_number,
        s_acctbal as account_balance,
        s_comment as comment

    from source

)

select * from renamed