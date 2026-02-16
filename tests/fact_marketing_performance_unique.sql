-- Le test échoue si l'unicité (date_day, campaign_id, channel_id) n'est pas respectée.
select
  date_day,
  campaign_id,
  channel_id,
  count(*) as row_count
from {{ ref('fact_marketing_performance') }}
group by 1, 2, 3
having count(*) > 1
