/* Create a pivot table with hard-coded columns based on a query of the ship modes that are in the system */

{{ config(
    materialized="table",
    table_format="iceberg",
    external_volume="iceberg_external_volume",
    base_location_subpath="agg_ship_modes_hardcoded_pivot",
    tags="hourly",
) }}


with merged as (
    select
        date_part('year', order_date) as order_year,
        ship_mode,
        gross_item_sales_amount
    from {{ ref('fct_order_items') }}
)

select
    * 
from
    merged
    -- have to manually map strings in the pivot operation
    pivot(sum(gross_item_sales_amount) for ship_mode in (
        'AIR',
        'REG AIR',
        'FOB',
        'RAIL',
        'MAIL',
        'SHIP',
        'TRUCK'
    )) as p 

order by order_year
