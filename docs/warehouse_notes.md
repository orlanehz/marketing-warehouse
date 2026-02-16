# Notes de conception

## Pourquoi ce modèle
- Priorité au cas d'usage: un pipeline simple, clair et testable.
- Schéma en étoile pour illustrer les bonnes pratiques BI classiques.
- Granularité explicite au niveau de la table de fait pour éviter les ambiguïtés.

## Choix techniques
- DuckDB: exécution locale rapide, pas de dépendance cloud.
- Seeds: données reproductibles pour faciliter l'analyse.
- Tests dbt: qualité structurelle + règles métier.
- Macros: centralisation des calculs KPI (`kpi_ctr`, `kpi_cpc`) pour éviter la duplication SQL.
- Snapshot dbt: historisation des changements de campagne avec `snp_campaigns` (SCD2).
- SCD2 (Slowly Changing Dimension Type 2): on n'écrase pas une ancienne valeur; on clôture l'ancienne version et on insère une nouvelle ligne pour conserver l'historique.
- Table de fait en incrémental: `fact_marketing_performance` chargée par delta sur `date_day` pour accélérer les reruns.
- `is_incremental()`: applique le filtre delta uniquement en run incrémental; ignoré au premier run et avec `--full-refresh`.

## Évolutions possibles
- Ajouter une dimension audience (segment client).
