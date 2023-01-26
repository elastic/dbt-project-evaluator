
{{
    config(
        materialized='table',
        post_hook="{{ generate_insert_statements_post_hook(this, resource_type='sources') }}"
    )
}}


with dummy_cte as (
    select 1 as foo
)

select 

    cast(null as {{ dbt.type_string() }}) as unique_id,
    cast(null as {{ dbt.type_string() }}) as name,
    cast(null as {{ dbt.type_string() }}) as file_path,
    cast(null as {{ dbt.type_string() }}) as alias,
    cast(null as {{ dbt.type_string() }}) as resource_type,
    cast(null as {{ dbt.type_string() }}) as source_name,
    cast(True as boolean) as is_source_described,
    cast(True as boolean) as is_described,
    cast(True as boolean) as is_enabled,
    cast(null as {{ dbt.type_string() }}) as loaded_at_field,
    cast(null as {{ dbt.type_string() }}) as database,
    cast(null as {{ dbt.type_string() }}) as schema,
    cast(null as {{ dbt.type_string() }}) as package_name,
    cast(null as {{ dbt.type_string() }}) as loader,
    cast(null as {{ dbt.type_string() }}) as identifier,
    cast(null as {{ dbt.type_string() }})  as meta

from dummy_cte
where false