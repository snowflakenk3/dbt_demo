WITH TRIPS as (

select
RIDE_ID,
-- RIDEABLE_TYPE,
DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
START_STATIO_ID as START_STATION_ID,
END_STATION_ID,
REPLACE(MEMBER_CSUAL,'"','') as MEMBER_CASUAL,
TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS

from {{ ref('stg_bikes') }}

where RIDE_ID NOT IN ('"bikeid"','bikeid') AND STARTED_AT NOT IN ('"rideable_type"','rideable_type','classic_bike','"classic_bike"','electric_bike')

)

select
*
from TRIPS