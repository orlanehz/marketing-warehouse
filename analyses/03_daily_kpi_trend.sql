-- Evolution journalière globale des KPI marketing.
select
  d.date_day,
  sum(f.impressions) as impressions,
  sum(f.clicks) as clicks,
  sum(f.conversions) as conversions,
  round(sum(f.spend), 2) as spend,
  round(sum(f.revenue), 2) as revenue,
  round(sum(f.clicks) * 1.0 / nullif(sum(f.impressions), 0), 4) as ctr,
  round(sum(f.revenue) / nullif(sum(f.spend), 0), 4) as roas
from {{ ref('fact_marketing_performance') }} f
join {{ ref('dim_date') }} d using (date_day)
group by 1
order by d.date_day;
