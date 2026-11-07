    WITH start_date AS
    (
        SELECT
        STARTEDAT AS STARTED_AT,
        -- Use TO_TIMESTAMP(STARTEDAT) if the value of the column is of other type
        DATE(TO_TIMESTAMP(STARTEDAT)) AS STARTED_DATE,
        HOUR(TO_TIMESTAMP(STARTEDAT)) AS STARTED_HOUR,
        MONTH(TO_TIMESTAMP(STARTEDAT)) AS STARTED_MONTH,
        DAYNAME(TO_TIMESTAMP(STARTEDAT)) AS STARTED_DAY,
        {{get_day_of_the_week('STARTEDAT')}} AS DAY_TYPE,
        {{get_season('STARTEDAT')}} AS STARTED_SEASON
        FROM {{ source('demo', 'bike') }}
    )

    SELECT 
    *
    FROM start_date