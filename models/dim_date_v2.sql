with date_cte as(

select 
TRY_TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
Date(TRY_TO_TIMESTAMP(STARTED_AT)) as Date_Started_at,
Hour(TRY_TO_TIMESTAMP(STARTED_AT)) as Hour_Started_at,

{{day_type('STARTED_AT')}} as Day_Type,

{{getseason(('STARTED_AT'))}} AS STATION_OF_YEAR

from {{ source('demo', 'BIKES') }}

)

SELECT * FROM date_cte