# Marketing Insights Snapshot

Périmètre analysé: données du `2025-04-01` au `2025-04-03` issues de `fact_marketing_performance`.

## Executive summary
- Performance globale: `91,100` de revenu pour `12,354.5` de dépense, soit un **ROAS global de 7.3738**.
- Efficacité média: l'**Owned (Email Lifecycle)** domine avec un **ROAS de 26.495** et un coût très faible.
- Campagne la plus rentable: **Newsletter Premium** (objectif Retention), **ROAS 28.4799**.
- Point d'attention qualité des données: le `2025-04-03` contient `4` lignes campagne-canal (vs `5` les jours précédents), ce qui explique une baisse mécanique des volumes.

## KPI globaux
- Impressions: `776,730`
- Clicks: `29,075`
- Conversions: `3,302`
- Spend: `12,354.5`
- Revenue: `91,100`
- CTR: `3.74%`
- CPC: `0.4249`
- ROAS: `7.3738`

## Canal: performance comparative
- **Email Lifecycle (Owned)**: spend `796.0`, revenue `21,090.0`, conversions `1,262`, ROAS `26.495`.
- **Google Ads (Paid Search)**: spend `7,448.5`, revenue `47,450.0`, conversions `1,362`, ROAS `6.3704`.
- **Meta Ads (Paid Social)**: spend `4,110.0`, revenue `20,980.0`, conversions `593`, ROAS `5.1046`.
- **SEO (Organic)**: spend `0.0`, revenue `1,580.0`, conversions `85` (ROAS non défini car pas de spend).

Lecture business:
- Le canal Owned est un moteur de rentabilité fort.
- Les canaux payants apportent plus de volume absolu, mais une rentabilité inférieure.

## Campagnes: efficacité économique
- **Newsletter Premium (Retention)**: spend `796.0`, revenue `22,670.0`, conversions `1,347`, CPA `0.59`, ROAS `28.4799`.
- **Retargeting Q2 (Conversion)**: spend `4,638.0`, revenue `32,285.0`, conversions `972`, CPA `4.77`, ROAS `6.961`.
- **Spring New Collection (Acquisition)**: spend `6,920.5`, revenue `36,145.0`, conversions `983`, CPA `7.04`, ROAS `5.2229`.

Lecture business:
- Le triptyque acquisition > conversion > retention montre bien un arbitrage classique volume vs efficacité.
- Retention offre le meilleur rendement unitaire, acquisition consomme plus de budget pour un ROAS plus bas.

## Trend journalière
- `2025-04-01`: revenue `32,500.0`, conversions `1,130`, lignes `5`.
- `2025-04-02`: revenue `33,545.0`, conversions `1,182`, lignes `5`.
- `2025-04-03`: revenue `25,055.0`, conversions `990`, lignes `4`.

Interprétation:
- La baisse du `2025-04-03` ne doit pas être lue immédiatement comme une dégradation média: le dataset du jour est partiellement alimenté (1 combinaison campagne-canal manquante).

## Points de vigilance et suites
- Confirmer la complétude du chargement du `2025-04-03` avant toute décision budgétaire (1 combinaison campagne-canal manquante).
- Comparer la rentabilité par canal avec une fenêtre plus longue pour éviter les biais sur 3 jours.
- Ajouter des segments d'audience pour affiner les arbitrages entre acquisition, conversion et retention.
