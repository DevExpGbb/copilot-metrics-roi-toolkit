#!/usr/bin/env bash
# fetch-ndjson-schemas.sh — Download actual NDJSON from usage-metrics signed URLs,
# derive schemas from real records, and save to live-capture/.
#
# Usage:
#   ./scripts/fetch-ndjson-schemas.sh
#
# Requires: curl, jq

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib.sh"

# Usage-metrics endpoint paths (enterprise-level, non-mutating)
declare -A ENDPOINTS=(
  ["enterprise-1-day"]="/enterprises/${ENTERPRISE}/copilot/metrics/reports/enterprise-1-day"
  ["enterprise-28-day-latest"]="/enterprises/${ENTERPRISE}/copilot/metrics/reports/enterprise-28-day/latest"
  ["enterprise-user-teams-1-day"]="/enterprises/${ENTERPRISE}/copilot/metrics/reports/user-teams-1-day"
  ["enterprise-users-1-day"]="/enterprises/${ENTERPRISE}/copilot/metrics/reports/users-1-day"
  ["enterprise-users-28-day-latest"]="/enterprises/${ENTERPRISE}/copilot/metrics/reports/users-28-day/latest"
  ["org-organization-1-day"]="/orgs/${ORG}/copilot/metrics/reports/organization-1-day"
  ["org-organization-28-day-latest"]="/orgs/${ORG}/copilot/metrics/reports/organization-28-day/latest"
  ["org-user-teams-1-day"]="/orgs/${ORG}/copilot/metrics/reports/user-teams-1-day"
  ["org-users-1-day"]="/orgs/${ORG}/copilot/metrics/reports/users-1-day"
  ["org-users-28-day-latest"]="/orgs/${ORG}/copilot/metrics/reports/users-28-day/latest"
)

# Ordered list so output is consistent
ORDERED_IDS=(
  enterprise-1-day
  enterprise-28-day-latest
  enterprise-user-teams-1-day
  enterprise-users-1-day
  enterprise-users-28-day-latest
  org-organization-1-day
  org-organization-28-day-latest
  org-user-teams-1-day
  org-users-1-day
  org-users-28-day-latest
)

# Use a recent past date that should have data (reports are available from Oct 10 2025)
DAY=$(date -d "yesterday" +%Y-%m-%d 2>/dev/null \
  || date -v-1d +%Y-%m-%d 2>/dev/null \
  || echo "2026-06-02")

echo "Using day: $DAY"
echo ""

PASS=0; FAIL=0

for id in "${ORDERED_IDS[@]}"; do
  path="${ENDPOINTS[$id]}"
  url="https://api.github.com${path}"

  # 1-day endpoints require ?day= param
  if [[ "$id" == *"-1-day" ]]; then
    url="${url}?day=${DAY}"
  fi

  echo "──────────────────────────────────────────"
  echo "[$id]"
  echo "  URL: $url"

  WRAPPER_OUT="$LIVE_CAPTURE_DIR/${id}-raw.json"
  NDJSON_OUT="$LIVE_CAPTURE_DIR/${id}-ndjson-raw.ndjson"
  NDJSON_SCHEMA_OUT="$LIVE_CAPTURE_DIR/${id}-ndjson-schema.json"

  # Fetch the wrapper response (contains download_links)
  _tmp=$(mktemp)
  status=$(curl -s -L -o "$_tmp" -w "%{http_code}" \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${GITHUB_TOKEN}" \
    -H "X-GitHub-Api-Version: ${GH_API_VERSION}" \
    "$url")
  wrapper=$(cat "$_tmp"); rm -f "$_tmp"
  echo "  Wrapper status: $status"

  if ! echo "$wrapper" | jq . > "$WRAPPER_OUT" 2>/dev/null; then
    echo "  ❌ Non-JSON wrapper response" 
    echo "$wrapper" > "$LIVE_CAPTURE_DIR/${id}-raw.txt"
    ((FAIL++)) || true
    continue
  fi

  # Extract download links array
  links=$(echo "$wrapper" | jq -r '.download_links[]?' 2>/dev/null || true)

  if [[ -z "$links" ]]; then
    echo "  ⚠️  No download_links in response (may be 204 / no data for this day)"
    echo "$wrapper" | jq .
    ((FAIL++)) || true
    continue
  fi

  # Download first NDJSON link and save raw
  first_link=$(echo "$links" | head -1)
  echo "  Downloading NDJSON: $first_link"

  ndjson_tmp=$(mktemp)
  ndjson_status=$(curl -s -L -o "$ndjson_tmp" -w "%{http_code}" "$first_link")
  echo "  NDJSON fetch status: $ndjson_status"

  if [[ "$ndjson_status" != "200" ]]; then
    echo "  ❌ Failed to download NDJSON (HTTP $ndjson_status)"
    cat "$ndjson_tmp"
    rm -f "$ndjson_tmp"
    ((FAIL++)) || true
    continue
  fi

  # Save raw NDJSON
  cp "$ndjson_tmp" "$NDJSON_OUT"
  line_count=$(wc -l < "$ndjson_tmp" | tr -d ' ')
  echo "  NDJSON saved: $NDJSON_OUT ($line_count lines)"

  # Parse first record and derive schema
  first_record=$(head -1 "$ndjson_tmp")
  rm -f "$ndjson_tmp"

  if echo "$first_record" | jq . > /dev/null 2>&1; then
    echo "$first_record" | derive_schema_from_json > "$NDJSON_SCHEMA_OUT"
    echo "  Schema saved: $NDJSON_SCHEMA_OUT"
    echo "  Schema preview:"
    cat "$NDJSON_SCHEMA_OUT" | jq .
    ((PASS++)) || true
  else
    echo "  ❌ First NDJSON line is not valid JSON"
    echo "$first_record" > "$LIVE_CAPTURE_DIR/${id}-ndjson-raw.txt"
    ((FAIL++)) || true
  fi

  echo ""
done

echo "══════════════════════════════════════════"
echo "fetch-ndjson-schemas.sh complete"
echo "  Passed : $PASS"
echo "  Failed : $FAIL"
echo "══════════════════════════════════════════"
