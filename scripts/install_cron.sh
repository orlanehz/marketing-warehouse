#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CRON_TMP="$(mktemp)"

{
  crontab -l 2>/dev/null | grep -v "daily_refresh.sh" || true
  printf '%s\n' "0 7 * * * ${REPO_ROOT}/scripts/daily_refresh.sh >> ${REPO_ROOT}/logs/cron_daily_refresh.log 2>&1"
} > "${CRON_TMP}"

crontab "${CRON_TMP}"
rm -f "${CRON_TMP}"

echo "Cron installed: daily run at 07:00 local machine time."
