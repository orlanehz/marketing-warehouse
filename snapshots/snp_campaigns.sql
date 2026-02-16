{% snapshot snp_campaigns %}
{{
  config(
    target_schema='snapshots',
    unique_key='campaign_id',
    strategy='check',
    check_cols=['campaign_name', 'objective', 'start_date', 'end_date'],
    invalidate_hard_deletes=true
  )
}}

select
  campaign_id,
  campaign_name,
  objective,
  start_date,
  end_date
from {{ ref('stg_campaigns') }}

{% endsnapshot %}
