WITH bike AS
(
    SELECT
    DISTINCT
    STARTSTATIONID,
    STARTSTATIONNAME,
    STARTLATITUDE,
    STARTLONGITUDE
    FROM {{ ref('stage_bike') }}
)

SELECT
*
FROM bike