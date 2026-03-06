{% macro avg_col(cols) %}

{% for col in cols %}

avg({{col}}) as avg_{{col}} 

{% if not loop.last %},{% endif %}

{% endfor %}
{% endmacro %}