-- Function to define seasons
{% macro get_season(date) %}

    CASE 
        WHEN MONTH(TO_TIMESTAMP({{date}})) IN (12,1,2)
            THEN 'WINTHER'
        WHEN MONTH(TO_TIMESTAMP({{date}})) IN (3,4,5)
            THEN 'SPRING'
        WHEN MONTH(TO_TIMESTAMP({{date}})) IN (6,7,8)
            THEN 'SUMMER'
        WHEN MONTH(TO_TIMESTAMP({{date}})) IN (9,10,11)
            THEN 'AUTUMN'
    END

{% endmacro %}

-- Function to define the day of the week
{% macro get_day_of_the_week(date) %}

    CASE
        WHEN DAYNAME({{date}}) IN ('Sat','Sun')
            THEN 'WEEKEND'
        ELSE 'BUSINESS_DAY'
    END

{% endmacro %}