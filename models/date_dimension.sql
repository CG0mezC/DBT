WITH CTE as (
select
TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
{{DAY_TYPE('started_at')}} AS DAY_TYPE,
{{get_season('started_at')}} as station_of_year
from 
{{ source('demo', 'bike') }}
where started_at != 'started_at'
)
select 
*
from CTE 