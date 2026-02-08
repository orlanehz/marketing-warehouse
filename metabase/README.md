# Metabase local (Docker)

Ce dossier lance Metabase localement et active le driver DuckDB communautaire.

## Prérequis
- Docker Desktop (ou moteur Docker + Docker Compose)
- Fichier `warehouse.duckdb` présent à la racine du projet

## Démarrage
Depuis la racine du projet:

```bash
cd metabase
cp .env.example .env
docker compose up -d --build
```

Accès UI: `http://localhost:3000`

## Connexion à DuckDB dans Metabase
Dans l'interface Metabase:
1. Ajouter une base de données
2. Type: `DuckDB`
3. Database path: `/data/warehouse.duckdb`
4. Sauvegarder puis lancer la synchronisation

Vérification rapide dans l'éditeur SQL Metabase:
```sql
select table_schema, table_name
from information_schema.tables
order by 1, 2;
```

## Arrêt
```bash
cd metabase
docker compose down
```

Redémarrage propre (si les tables ne remontent pas):
```bash
cd metabase
docker compose down -v
docker compose up -d --build
```

## Notes
- Le volume `metabase_data` conserve la configuration Metabase.
- Si tu reconstruis `warehouse.duckdb` avec dbt, un rescan dans Metabase peut être nécessaire.
