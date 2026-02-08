select
  channel_id,
  channel_name,
  channel_group
from {{ ref('stg_channels') }}
