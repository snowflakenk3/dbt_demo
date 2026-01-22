WITH daily_weather as(
select 
date(time) as daily_weather, 
WEATHER,
clouds,
humidity,
pressure,
temp
from {{ source('demo', 'WEATHERS') }} 
),
daily_weather_agg as(
select 
daily_weather,
WEATHER,
round(avg(clouds),2) as avg_cloud,
round(avg(humidity),2) as avg_humidity,
round(avg(pressure),2) as avg_pressure,
round(avg(temp),2) as avg_temp,
row_number() over(partition by daily_weather order by count(weather) desc ) as rnk
from daily_weather
group by daily_weather,WEATHER
qualify rnk=1
)
SELECT * FROM daily_weather_agg