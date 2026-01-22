{% macro getseason(x) %}
case 
    when month(TRY_TO_TIMESTAMP({{x}})) in (12,1,2) then 'Winter'
    when month(TRY_TO_TIMESTAMP({{x}})) IN (3,4,5) then 'SPRING'
    when month(TRY_TO_TIMESTAMP({{x}})) IN (6,7,8) THEN 'SUMMER'
    ELSE 'AUTUMN'
END 
{% endmacro %}