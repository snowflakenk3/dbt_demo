with date_cte as(

select 
TRY_TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
Date(TRY_TO_TIMESTAMP(STARTED_AT)) as Date_Started_at,
Hour(TRY_TO_TIMESTAMP(STARTED_AT)) as Hour_Started_at,
case
    when dayname(TRY_TO_TIMESTAMP(STARTED_AT)) in ('Sat','Sun') then 'Weekend'
    ELSE 'BussineshDay'
End as DayType,
case 
    when month(TRY_TO_TIMESTAMP(STARTED_AT)) in (12,1,2) then 'Winter'
    when month(TRY_TO_TIMESTAMP(STARTED_AT)) IN (3,4,5) then 'SPRING'
    when month(TRY_TO_TIMESTAMP(STARTED_AT)) IN (6,7,8) THEN 'SUMMER'
    ELSE 'AUTUMN'
END AS STATION_OF_YEAR
from {{ source('demo', 'BIKES') }}

)
SELECT * FROM date_cte