
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG.incremental_dim_orders
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG/incremental_dim_orders/core_incrm_dim_orders'
    
as (

with orders as (
    
    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG_staging.stg_tpch_orders 

),
order_item as (
    
    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG.order_items

),
order_item_summary as (

    select 
        order_key,
        sum(gross_item_sales_amount) as gross_item_sales_amount,
        sum(item_discount_amount) as item_discount_amount,
        sum(item_tax_amount) as item_tax_amount,
        sum(net_item_sales_amount) as net_item_sales_amount
    from order_item
    group by
        1
),
final as (

    select 

        orders.order_key, 
        orders.order_date,
        orders.customer_key,
        orders.status_code,
        orders.priority_code,
        orders.clerk_name,
        orders.ship_priority,
                
        1 as order_count,                
        order_item_summary.gross_item_sales_amount,
        order_item_summary.item_discount_amount,
        order_item_summary.item_tax_amount,
        order_item_summary.net_item_sales_amount
    from
        orders
        inner join order_item_summary
            on orders.order_key = order_item_summary.order_key
)
select 
    *
from
    final

  where order_date = '1992-02-01'


    )
;


  