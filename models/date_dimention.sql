    WITH start_date AS
    (
        SELECT
        -- Use TO_TIMESTAMP(STARTEDAT) if the value of the column is of other type
        STARTEDAT AS STARTED_AT,
        DATE(STARTEDAT) AS STARTED_DATE,
        HOUR(STARTEDAT) AS STARTED_HOUR,
        MONTH(STARTEDAT) AS STARTED_MONTH,
        DAYNAME(STARTEDAT) AS STARTED_DAY,
        -- Define business days or weekends
        CASE
            WHEN STARTED_DAY IN ('Sat','Sun')
                THEN 'WEEKEND'
            ELSE 'BUSINESS_DAY'
        END AS DAY_TYPE,
        -- Define seasons
        CASE
            WHEN STARTED_MONTH IN (12,1,2)
                THEN 'WINTHER'
            WHEN STARTED_MONTH IN (3,4,5)
                THEN 'SPRING'
            WHEN STARTED_MONTH IN (6,7,8)
                THEN 'SUMMER'
            WHEN STARTED_MONTH IN (9,10,11)
                THEN 'AUTUMN'
        END AS SEASON
        FROM {{ source('demo', 'bike') }}
    )

    SELECT 
    *
    FROM start_date