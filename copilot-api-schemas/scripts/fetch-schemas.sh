#!/usr/bin/env bash
# fetch-schemas.sh — Live-capture API responses for all non-mutating Copilot endpoints
#
# Usage:
#   ./scripts/fetch-schemas.sh              # run all GET endpoints
#   ./scripts/fetch-schemas.sh --dry-run    # print URLs without calling them
#   ./scripts/fetch-schemas.sh --id <id>    # run a single endpoint by manifest id
#
# Output: live-capture/<id>-raw.json and live-capture/<id>-schema.json
# Mutating (POST/DELETE) endpoints are always skipped.
#
# Requirements: curl, jq
# Credentials:  .env with GITHUB_TOKEN, ENTERPRISE, ORG, USERNAME, GH_API_VERSION

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib.sh"

MANIFEST="$SCHEMA_ROOT/manifest.json"
DRY_RUN=false
FILTER_ID=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --dry-run) DRY_RUN=true; shift ;;
    --id) FILTER_ID="$2"; shift 2 ;;
    -h|--help)
      echo "Usage: $0 [--dry-run] [--id <endpoint-id>]"
      exit 0 ;;
    *) echo "Unknown option: $1" >&2; exit 1 ;;
  esac
done

# Read all non-mutating endpoints from manifest
mapfile -t ENDPOINT_IDS < <(jq -r '.endpoints[] | select(.mutating == false) | .id' "$MANIFEST")

PASS=0
FAIL=0
SKIP=0

for id in "${ENDPOINT_IDS[@]}"; do
  # Filter by --id if specified
  if [[ -n "$FILTER_ID" && "$id" != "$FILTER_ID" ]]; then
    continue
  fi

  # Read endpoint metadata
  endpoint=$(jq -r --arg id "$id" '.endpoints[] | select(.id == $id)' "$MANIFEST")
  method=$(echo "$endpoint" | jq -r '.method')
  path_tpl=$(echo "$endpoint" | jq -r '.path')
  query_params=$(echo "$endpoint" | jq -r '.query_params // [] | @json')
  level=$(echo "$endpoint" | jq -r '.level')
  description=$(echo "$endpoint" | jq -r '.description')

  # Safety guard: skip mutating methods even if manifest is wrong
  if [[ "$method" != "GET" ]]; then
    echo "SKIP [$id] — $method is mutating; not executed"
    ((SKIP++)) || true
    continue
  fi

  # Resolve path template
  resolved_path="${path_tpl//\{enterprise\}/$ENTERPRISE}"
  resolved_path="${resolved_path//\{org\}/$ORG}"
  resolved_path="${resolved_path//\{username\}/$USERNAME}"

  # Append required query params with placeholder values
  url="https://api.github.com${resolved_path}"
  if echo "$query_params" | jq -e 'contains(["day"])' > /dev/null 2>&1; then
    # Use yesterday's date as a safe default for day-specific endpoints
    DAY=$(date -d "yesterday" +%Y-%m-%d 2>/dev/null || date -v-1d +%Y-%m-%d 2>/dev/null || echo "2025-11-01")
    url="${url}?day=${DAY}"
  fi

  echo ""
  echo "──────────────────────────────────────────"
  echo "[$id] $method $resolved_path"
  echo "  Description: $description"
  echo "  URL: $url"

  RAW_OUT="$LIVE_CAPTURE_DIR/${id}-raw.json"
  SCHEMA_OUT="$LIVE_CAPTURE_DIR/${id}-schema.json"

  if $DRY_RUN; then
    echo "  DRY-RUN: would fetch $url"
    continue
  fi

  # Fetch
  response=$(gh_get "$url")
  status="$GH_STATUS_CODE"

  echo "  Status: $status"

  # Save raw response
  if echo "$response" | jq . > "$RAW_OUT" 2>/dev/null; then
    echo "  Raw saved: $RAW_OUT"
    # Derive schema
    echo "$response" | derive_schema_from_json > "$SCHEMA_OUT" 2>/dev/null && \
      echo "  Schema saved: $SCHEMA_OUT" || \
      echo "  Schema derivation failed (non-JSON response?)"
    ((PASS++)) || true
  else
    # Save raw as text if not valid JSON
    echo "$response" > "${RAW_OUT%.json}.txt"
    echo "  Non-JSON response saved as ${RAW_OUT%.json}.txt"
    ((FAIL++)) || true
  fi
done

echo ""
echo "══════════════════════════════════════════"
echo "fetch-schemas.sh complete"
echo "  Passed : $PASS"
echo "  Failed : $FAIL"
echo "  Skipped: $SKIP"
echo "  Output : $LIVE_CAPTURE_DIR/"
echo "══════════════════════════════════════════"
