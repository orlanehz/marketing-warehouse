# Marketing Analytics Warehouse (dbt + DuckDB)

Projet portfolio orienté recrutement pour démontrer:
- modélisation analytique en **star schema**
- transformation locale avec **dbt**
- qualité des données via **tests**
- documentation navigable via **dbt docs**

## Stack
- Python 3.10+
- dbt-core
- dbt-duckdb
- DuckDB (fichier local, sans cloud)

## Star schema
- **Fact**: `fact_marketing_performance` (grain: `campaign_id` x `channel_id` x `date_day`)
- **Dimensions**: `dim_campaign`, `dim_channel`, `dim_date`

## Démarrage rapide
1. Créer un environnement local:
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt
   ```
2. Configurer le profile dbt:
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
- `models/staging/`: normalisation des seeds
- `models/marts/`: dimensions + table de faits
- `tests/`: tests métier complémentaires
- `docs/`: notes fonctionnelles

## Résultats analytiques inclus
`fact_marketing_performance` expose:
- `impressions`, `clicks`, `conversions`, `spend`, `revenue`
- `ctr` (click-through-rate)
- `cpc` (cost-per-click)
- `roas` (return-on-ad-spend)

## Commandes utiles
```bash
dbt build        # seed + run + test
dbt ls           # liste des ressources
dbt docs generate
```
