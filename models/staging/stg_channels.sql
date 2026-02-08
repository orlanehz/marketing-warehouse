select
  cast(channel_id as integer) as channel_id,
  trim(channel_name) as channel_name,
  trim(channel_group) as channel_group
from {{ ref('raw_channels') }}
