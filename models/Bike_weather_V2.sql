with bike_weather_cte as (
    SELECT t.*,w.* 

    FROM {{ ref('fct_TRIPS') }} t left join daily_weather W
    on t.TRIP_DATE=w.daily_weather
)
SELECT * FROM bike_weather_cte