
  
    

create or replace iceberg table ICEBERG_DB.SAMPLE_DB_ICEBERG.fct_order_items
    

    external_volume = 'iceberg_external_volume'

    catalog = 'SNOWFLAKE'  -- required, and always SNOWFLAKE for built-in Iceberg tables
    base_location = '_dbt/SAMPLE_DB_ICEBERG/fct_order_items/core_fct_order_items'
    
as (

with order_item as (
    
    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG.order_items

),
part_supplier as (
    
    select * from ICEBERG_DB.SAMPLE_DB_ICEBERG.part_suppliers

),
final as (
    select 
        order_item.order_item_key,
        order_item.order_key,
        order_item.order_date,
        order_item.customer_key,
        order_item.part_key,
        order_item.supplier_key,
        order_item.order_item_status_code,
        order_item.return_flag,
        order_item.line_number,
        order_item.ship_date,
        order_item.commit_date,
        order_item.receipt_date,
        order_item.ship_mode,
        part_supplier.cost as supplier_cost,
        
        order_item.base_price,
        order_item.discount_percentage,
        order_item.discounted_price,
        order_item.tax_rate,
        
        1 as order_item_count,
        order_item.quantity,
        order_item.gross_item_sales_amount,
        order_item.discounted_item_sales_amount,
        order_item.item_discount_amount,
        order_item.item_tax_amount,
        order_item.net_item_sales_amount

    from
        order_item
        inner join part_supplier
            on order_item.part_key = part_supplier.part_key and
                order_item.supplier_key = part_supplier.supplier_key
)
select 
    *
from
    final
order by
    order_date
    )
;


  