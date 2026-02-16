{{
  config(
    materialized='incremental',
    incremental_strategy='delete+insert',
    unique_key=['date_day', 'campaign_id', 'channel_id']
  )
}}

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
  {% if is_incremental() %}
    where d.date_day >= (select coalesce(max(date_day), cast('1900-01-01' as date)) from {{ this }})
  {% endif %}
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
  {{ kpi_ctr('clicks', 'impressions') }} as ctr,
  {{ kpi_cpc('spend', 'clicks') }} as cpc,
  case when spend = 0 then null else round(revenue / spend, 4) end as roas
from base
