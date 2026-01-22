{% macro day_type(x) %}
    case
    when dayname(TRY_TO_TIMESTAMP({{x}})) in ('Sat','Sun') then 'Weekend'
    ELSE 'BussineshDay'
End 
{% endmacro %}