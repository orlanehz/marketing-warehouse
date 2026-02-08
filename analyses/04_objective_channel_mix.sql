-- Mix objectif x canal pour discuter allocation budgétaire.
select
  c.objective,
  ch.channel_group,
  round(sum(f.spend), 2) as spend,
  round(sum(f.revenue), 2) as revenue,
  sum(f.conversions) as conversions,
  round(sum(f.revenue) / nullif(sum(f.spend), 0), 4) as roas,
  round(sum(f.conversions) * 1.0 / nullif(sum(f.clicks), 0), 4) as conversion_rate_after_click
from {{ ref('fact_marketing_performance') }} f
join {{ ref('dim_campaign') }} c using (campaign_id)
join {{ ref('dim_channel') }} ch using (channel_id)
group by 1, 2
order by objective, roas desc nulls last;
