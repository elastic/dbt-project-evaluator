{% macro array_append(array, new_element) -%}
  {{ return(adapter.dispatch('array_append')(array, new_element)) }}
{%- endmacro %}

{# new_element must be the same data type as elements in array to match postgres functionality #}
{% macro default__array_append(array, new_element) -%}
    array_append({{ array }}, {{ new_element }})
{%- endmacro %}

{% macro bigquery__array_append(array, new_element) -%}
    array_concat({{ array }}, {{ dbt_utils.create_array([new_element]) }})
{%- endmacro %}

{% macro redshift__array_append(array, new_element) -%}
    array_concat({{ array }}, {{ dbt_utils.create_array([new_element]) }})
{%- endmacro %}