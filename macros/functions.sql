{% macro margin_percent(revenue, purchase_cost) %}
    case
        when {{ revenue }} = 0 or {{ revenue }} is null then null
        else ({{ revenue }} - {{ purchase_cost }}) / {{ revenue }} * 100
    end
{% endmacro %}
