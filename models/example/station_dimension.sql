WITH bike AS
(
    SELECT
    DISTINCT
    STARTSTATIONID,
    STARTSTATIONNAME,
    STARTLATITUDE,
    STARTLONGITUDE
    FROM {{ source('demo', 'bike') }}
)

SELECT
*
FROM bike