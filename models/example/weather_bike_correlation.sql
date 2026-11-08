WITH trip_fact AS
(
    SELECT
    tf.*,
    dw.*
    -- Use __ref to refer a model
    FROM {{ ref('trip_fact') }} AS tf
    LEFT JOIN {{ ref('daily_weather') }} dw
    ON tf.STARTED_DATE = dw.DAILY_WEATHER
    -- Use __source to refer a source db and table
    -- FROM {{ source('demo', 'bike') }}
)

SELECT
*
FROM trip_fact