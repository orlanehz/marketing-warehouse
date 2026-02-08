-- Classement des campagnes par efficacité économique.
select
  c.campaign_name,
  c.objective,
  min(f.date_day) as first_day_seen,
  max(f.date_day) as last_day_seen,
  round(sum(f.spend), 2) as total_spend,
  round(sum(f.revenue), 2) as total_revenue,
  sum(f.conversions) as total_conversions,
  round(sum(f.spend) / nullif(sum(f.conversions), 0), 2) as cost_per_conversion,
  round(sum(f.revenue) / nullif(sum(f.spend), 0), 4) as roas
from {{ ref('fact_marketing_performance') }} f
join {{ ref('dim_campaign') }} c using (campaign_id)
group by 1, 2
order by roas desc nulls last, cost_per_conversion asc nulls last;
