select
  campaign_id,
  campaign_name,
  objective,
  start_date,
  end_date
from {{ ref('stg_campaigns') }}
