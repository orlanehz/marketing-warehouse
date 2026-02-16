# Notes de conception

## Pourquoi ce modèle
- Priorité au cas d'usage: un pipeline simple, clair et testable.
- Schéma en étoile pour illustrer les bonnes pratiques BI classiques.
- Grain explicite au niveau de la table de fait pour éviter les ambiguïtés.

## Choix techniques
- DuckDB: exécution locale rapide, pas de dépendance cloud.
- Seeds: données reproductibles pour faciliter l'analyse.
- Tests dbt: qualité structurelle + règles métier.

## Évolutions possibles
- Ajouter une dimension audience (segment client).
- Ajouter une table de fait incrémentale avec historisation.
- Ajouter des snapshots pour le suivi des modifications de campagne.
