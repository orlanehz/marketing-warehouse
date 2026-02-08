select
  cast(date_day as date) as date_day,
  cast(campaign_id as integer) as campaign_id,
  cast(channel_id as integer) as channel_id,
  cast(impressions as bigint) as impressions,
  cast(clicks as bigint) as clicks,
  cast(conversions as bigint) as conversions,
  cast(spend as double) as spend,
  cast(revenue as double) as revenue
from {{ ref('raw_campaign_channel_daily') }}
