{% macro get_min_orderdate() -%}

{% set minorderdate_query %}
select 
min(orderdate)
from {{ ref('fct_orders') }}
order by 1
{% endset %}

{% set results = run_query(minorderdate_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}

{% macro get_max_orderdate() -%}

{% set maxorderdate_query %}
select 
max(orderdate)+1
from {{ ref('fct_orders') }}
order by 1
{% endset %}

{% set results = run_query(maxorderdate_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}