{% snapshot dim_customer_type_two %}

{{
    config(
      unique_key='id',
      strategy='check',
      check_cols='all',
      target_schema='snapshots'
    )
}}

SELECT 
    customer_key AS id,
    *
FROM
    {{ ref('dim_customer') }}

{% endsnapshot %}