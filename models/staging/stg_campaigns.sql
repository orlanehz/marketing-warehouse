select
  cast(campaign_id as integer) as campaign_id,
  trim(campaign_name) as campaign_name,
  trim(objective) as objective,
  cast(start_date as date) as start_date,
  cast(end_date as date) as end_date
from {{ ref('raw_campaigns') }}
