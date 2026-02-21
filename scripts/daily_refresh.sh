#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG_DIR="${REPO_ROOT}/logs"
LOCK_DIR="${REPO_ROOT}/.daily_refresh.lock"
VENV_DBT="${REPO_ROOT}/.venv/bin/dbt"

run_with_retry() {
  local attempts="${1}"
  local delay_seconds="${2}"
  shift 2
  local n=1
  until "$@"; do
    if [ "${n}" -ge "${attempts}" ]; then
      return 1
    fi
    n=$((n + 1))
    sleep "${delay_seconds}"
  done
}

mkdir -p "${LOG_DIR}"

if ! mkdir "${LOCK_DIR}" 2>/dev/null; then
  echo "Another daily_refresh run is already in progress."
  exit 0
fi

cleanup() {
  rmdir "${LOCK_DIR}" 2>/dev/null || true
}
trap cleanup EXIT

if [ ! -x "${VENV_DBT}" ]; then
  echo "dbt not found at ${VENV_DBT}. Run 'make install' first."
  exit 1
fi

cd "${REPO_ROOT}"
run_with_retry 2 30 make daily
