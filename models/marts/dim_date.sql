with base as (
  select distinct date_day
  from {{ ref('stg_campaign_channel_daily') }}
)

select
  date_day,
  extract(year from date_day) as year,
  extract(month from date_day) as month,
  extract(day from date_day) as day,
  extract(quarter from date_day) as quarter,
  strftime(date_day, '%w') in ('0', '6') as is_weekend
from base
