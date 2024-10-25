{%snapshot shipments_snapshot %}
{{config(
    target_database = 'QWT_ANALYTICS',
    target_schema = 'snapshots',
    unique_key= "ORDERID|| '-' ||LINENO",
    strategy = 'timestamp',
    updated_at = 'shipmentDate'
    )}}
select * from
{{ref('stg_shipments')}}
{% endsnapshot %}