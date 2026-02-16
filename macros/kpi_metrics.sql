{% macro kpi_ctr(clicks_col, impressions_col, precision=4) %}
case
  when {{ impressions_col }} = 0 then 0
  else round(({{ clicks_col }} * 1.0) / {{ impressions_col }}, {{ precision }})
end
{% endmacro %}

{% macro kpi_cpc(spend_col, clicks_col, precision=4) %}
case
  when {{ clicks_col }} = 0 then 0
  else round({{ spend_col }} / {{ clicks_col }}, {{ precision }})
end
{% endmacro %}
