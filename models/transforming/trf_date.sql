{{ config(materialized='table' ,schema='transforming')}}

{% set var_min_orderdate= get_min_orderdate() %}
{% set var_max_orderdate= get_max_orderdate() %}

{{ dbt_date.get_date_dimension(var_min_orderdate, var_max_orderdate) }}