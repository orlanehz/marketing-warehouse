# Notes de conception

## Pourquoi ce modèle
- Priorité au cas d'usage: un pipeline simple, clair et testable.
- Star schema pour illustrer les bonnes pratiques BI classiques.
- Grain explicite au niveau de la fact pour éviter les ambiguïtés.

## Choix techniques
- DuckDB: exécution locale rapide, pas de dépendance cloud.
- Seeds: données reproductibles pour démonstration.
- Tests dbt: qualité structurelle + règles métier.

## Evolution possible
- Ajouter une dimension audience (segment client).
- Ajouter une fact incrémentale avec historisation.
- Ajouter des snapshots pour le suivi des modifications de campagne.
