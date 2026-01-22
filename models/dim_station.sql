with bike_cte as (
select 
DISTINCT
START_STATION_ID,
START_STATION,
START_LAT AS START_LATITUDE,
START_LNG as START_LONGITUDE
from {{ source('demo', 'BIKES') }}
where ride_id!='ride_id'
)
select * from bike_cte