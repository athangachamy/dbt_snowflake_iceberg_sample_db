
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG.agg_ship_modes_hardcoded_pivot
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG/agg_ship_modes_hardcoded_pivot/agg_ship_modes_hardcoded_pivot'
    
as (/* Create a pivot table with hard-coded columns based on a query of the ship modes that are in the system */




with merged as (
    select
        date_part('year', order_date) as order_year,
        ship_mode,
        gross_item_sales_amount
    from ICEBERG_DB.SAMPLE_DB_ICEBERG.fct_order_items
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
    )
;


  