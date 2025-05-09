
  
    grant usage on schema SAMPLE_DB_ICEBERG to role public;
    grant select on all tables in schema SAMPLE_DB_ICEBERG to role public;
    grant select on all views in schema SAMPLE_DB_ICEBERG to role public;
    grant select on future tables in schema SAMPLE_DB_ICEBERG to role public;
    grant select on future views in schema SAMPLE_DB_ICEBERG to role public;
  
    grant usage on schema SAMPLE_DB_ICEBERG_staging to role public;
    grant select on all tables in schema SAMPLE_DB_ICEBERG_staging to role public;
    grant select on all views in schema SAMPLE_DB_ICEBERG_staging to role public;
    grant select on future tables in schema SAMPLE_DB_ICEBERG_staging to role public;
    grant select on future views in schema SAMPLE_DB_ICEBERG_staging to role public;
  
