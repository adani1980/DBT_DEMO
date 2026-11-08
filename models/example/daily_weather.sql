WITH daily_weather AS
(
    SELECT
    DATE(TIME) AS DAILY_WEATHER,
    WEATHER,
    TEMPERATURE,
    PRESSURE,
    HUMIDITY,
    CLOUDS
    FROM {{ source('demo', 'weather') }}
),
daily_weather_aggregate AS
(
    SELECT
    DAILY_WEATHER,
    WEATHER,
    ROUND(AVG(TEMPERATURE),2) AS AVG_TEMPERATURE,
    ROUND(AVG(PRESSURE),2) AS AVG_PRESSURE,
    ROUND(AVG(HUMIDITY),2) AS AVG_HUMIDITY,
    ROUND(AVG(CLOUDS),2) AS AVG_CLOUDS
    FROM daily_weather
    GROUP BY DAILY_WEATHER, WEATHER
    -- QUALIFY -> It's like a WHERE after a GROUP BY, we cannot use WHERE with Window Functions
    -- In this case it will filter and show only rows with ROW_NUMBER = 1
    -- ROW_NUMBER() it's a Window Function that assignes an unique integer to each row starting with 1 
    QUALIFY ROW_NUMBER() OVER(PARTITION BY DAILY_WEATHER ORDER BY COUNT(WEATHER) DESC) = 1
    ORDER BY DAILY_WEATHER DESC
)

SELECT 
*
FROM daily_weather_aggregate