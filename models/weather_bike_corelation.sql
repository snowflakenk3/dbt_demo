with weather_bike_cte as(
    select t.* ,w.*
    from {{ ref('fct_TRIPS') }} t
    left join {{ ref('daily_weather') }} w
    on t.TRIP_DATE=w.daily_weather
    
)
select * from weather_bike_cte