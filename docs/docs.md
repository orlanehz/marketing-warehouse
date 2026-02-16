{% docs project_pitch %}
Ce projet montre une chaîne analytique locale de bout en bout: ingestion de données marketing, modélisation en schéma en étoile, contrôles qualité et documentation dbt.
{% enddocs %}

{% docs fact_marketing_performance %}
Table de faits à la granularité **campagne x canal x jour**. Elle centralise les KPI de performance d'acquisition et de conversion.
{% enddocs %}

{% docs metric_ctr %}
Click-through-rate: `clicks / impressions`.
{% enddocs %}

{% docs metric_cpc %}
Cost-per-click: `spend / clicks`.
{% enddocs %}

{% docs metric_roas %}
Return-on-ad-spend: `revenue / spend`.
{% enddocs %}

{% docs macro_kpi_ctr %}
Macro de calcul du CTR.

Formule: `clicks / impressions`.

Règle métier: retourne `0` si `impressions = 0`.
{% enddocs %}

{% docs macro_kpi_cpc %}
Macro de calcul du CPC.

Formule: `spend / clicks`.

Règle métier: retourne `0` si `clicks = 0`.
{% enddocs %}
