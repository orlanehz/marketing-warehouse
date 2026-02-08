-- Vue synthétique par canal: volume, coût et rentabilité.
select
  ch.channel_group,
  ch.channel_name,
  sum(f.impressions) as impressions,
  sum(f.clicks) as clicks,
  sum(f.conversions) as conversions,
  round(sum(f.spend), 2) as spend,
  round(sum(f.revenue), 2) as revenue,
  round(sum(f.clicks) * 1.0 / nullif(sum(f.impressions), 0), 4) as ctr,
  round(sum(f.spend) / nullif(sum(f.clicks), 0), 4) as cpc,
  round(sum(f.revenue) / nullif(sum(f.spend), 0), 4) as roas
from {{ ref('fact_marketing_performance') }} f
join {{ ref('dim_channel') }} ch using (channel_id)
group by 1, 2
order by roas desc nulls last, conversions desc;
