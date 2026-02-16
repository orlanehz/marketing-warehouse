# Marketing Analytics Warehouse (dbt + DuckDB)

Projet local pour démontrer:
- modélisation analytique en **schéma en étoile**
- transformation locale avec **dbt**
- réutilisation de logique SQL via **macros**
- historisation des dimensions via **snapshots**
- qualité des données via **tests**
- documentation navigable via **dbt docs**

## Technologies
- Python 3.10+
- dbt-core
- dbt-duckdb
- DuckDB (fichier local, sans cloud)

## Schéma en étoile
- **Fact**: `fact_marketing_performance` (granularité: `campaign_id` x `channel_id` x `date_day`)
- **Dimensions**: `dim_campaign`, `dim_channel`, `dim_date`

## Démarrage rapide
1. Créer un environnement local:
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt
   ```
2. Configurer le profil dbt:
   ```bash
   mkdir -p ~/.dbt
   cp profiles.yml.example ~/.dbt/profiles.yml
   ```
3. Charger et construire:
   ```bash
   dbt seed
   dbt run
   dbt test
   ```
4. Générer la documentation:
   ```bash
   dbt docs generate
   dbt docs serve
   ```

## Structure
- `seeds/`: données marketing d'exemple
- `models/staging/`: normalisation des données sources
- `models/marts/`: dimensions + table de faits
- `macros/`: macros SQL/Jinja réutilisables (ex: calculs KPI)
- `snapshots/`: historisation des changements de dimensions
- `analyses/`: requêtes SQL de démonstration métier
- `tests/`: tests métier complémentaires
- `docs/`: notes fonctionnelles

Documents utiles:
- `docs/insights.md`: synthèse métier des performances marketing
- `docs/warehouse_notes.md`: choix de modélisation et orientations techniques

## Résultats analytiques inclus
`fact_marketing_performance` expose:
- `impressions`, `clicks`, `conversions`, `spend`, `revenue`
- `ctr` (click-through-rate)
- `cpc` (cost-per-click)
- `roas` (return-on-ad-spend)

Note de modélisation:
- `fact_marketing_performance` est matérialisée en `incremental` (delta sur `date_day`, granularité `date_day x campaign_id x channel_id`).

## Commandes utiles
```bash
dbt build        # seed + run + test
dbt snapshot     # historise les campagnes (SCD2)
dbt run --select fact_marketing_performance --full-refresh
dbt ls           # liste des ressources
dbt docs generate
dbt docs serve
```

## Visualisation locale avec Metabase
Un setup Docker est disponible dans `metabase/` pour connecter Metabase à `warehouse.duckdb`.

Lancement rapide:
```bash
cd metabase
cp .env.example .env
docker compose up -d --build
```

Puis ouvrir `http://localhost:3000` et connecter DuckDB avec le chemin:
`/data/warehouse.duckdb`

Le fichier DuckDB monté est configurable dans `metabase/.env` via `DUCKDB_FILE`.

## Analyses exploratoires
Fichiers fournis dans `analyses/`:
- `01_channel_performance_summary.sql`
- `02_campaign_efficiency_ranking.sql`
- `03_daily_kpi_trend.sql`
- `04_objective_channel_mix.sql`

Compiler toutes les analyses:
```bash
dbt compile --select path:analyses/*
```
Les SQL compilées sont ensuite visibles dans `target/compiled/`.
