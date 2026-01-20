SELECT * FROM {{ source('demo', 'WEATHERS') }}
limit 10