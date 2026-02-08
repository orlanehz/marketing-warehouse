with base as (
  select
    d.date_day,
    d.campaign_id,
    d.channel_id,
    d.impressions,
    d.clicks,
    d.conversions,
    d.spend,
    d.revenue
  from {{ ref('stg_campaign_channel_daily') }} d
)

select
  date_day,
  campaign_id,
  channel_id,
  impressions,
  clicks,
  conversions,
  spend,
  revenue,
  case when impressions = 0 then 0 else round(clicks * 1.0 / impressions, 4) end as ctr,
  case when clicks = 0 then 0 else round(spend / clicks, 4) end as cpc,
  case when spend = 0 then null else round(revenue / spend, 4) end as roas
from base
