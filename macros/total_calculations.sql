{% macro sum_col(cols) %}

{% for col in cols %}

sum({{col}}) as total_{{col}} {% if not loop.last %},{% endif %}

{% endfor %}

{% endmacro %}