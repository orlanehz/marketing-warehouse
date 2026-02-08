-- Le test échoue si des règles métier critiques sont violées.
select *
from {{ ref('fact_marketing_performance') }}
where
  impressions < 0
  or clicks < 0
  or conversions < 0
  or spend < 0
  or revenue < 0
  or clicks > impressions
  or conversions > clicks
