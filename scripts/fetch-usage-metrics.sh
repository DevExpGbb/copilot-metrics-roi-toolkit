#!/usr/bin/env bash
# fetch-usage-metrics.sh
# Fetches GitHub Copilot usage metrics via the REST API
# Usage: ./fetch-usage-metrics.sh --enterprise <slug> [--day YYYY-MM-DD] [--output-dir ./data]
#
# Prerequisites:
#   - GITHUB_TOKEN environment variable set with manage_billing:copilot or read:enterprise scope
#   - curl and jq installed

set -euo pipefail

# Defaults
OUTPUT_DIR="./data"
REPORT_TYPE="enterprise-28-day"
API_VERSION="2022-11-28"
BASE_URL="https://api.github.com"

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --enterprise) ENTERPRISE="$2"; shift 2 ;;
    --day) DAY="$2"; REPORT_TYPE="enterprise-1-day"; shift 2 ;;
    --output-dir) OUTPUT_DIR="$2"; shift 2 ;;
    --users) REPORT_TYPE="users-28-day"; shift ;;
    --users-day) REPORT_TYPE="users-1-day"; DAY="$2"; shift 2 ;;
    -h|--help)
      echo "Usage: $0 --enterprise <slug> [--day YYYY-MM-DD] [--users] [--output-dir ./data]"
      echo ""
      echo "Options:"
      echo "  --enterprise  Enterprise slug (required)"
      echo "  --day         Fetch single-day report (YYYY-MM-DD)"
      echo "  --users       Fetch user-level 28-day report"
      echo "  --users-day   Fetch user-level single-day report (YYYY-MM-DD)"
      echo "  --output-dir  Output directory (default: ./data)"
      exit 0
      ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

# Validate
if [[ -z "${ENTERPRISE:-}" ]]; then
  echo "Error: --enterprise is required"
  exit 1
fi

if [[ -z "${GITHUB_TOKEN:-}" ]]; then
  echo "Error: GITHUB_TOKEN environment variable is not set"
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

# Build URL
if [[ "$REPORT_TYPE" == "enterprise-1-day" || "$REPORT_TYPE" == "users-1-day" ]]; then
  URL="${BASE_URL}/enterprises/${ENTERPRISE}/copilot/metrics/reports/${REPORT_TYPE}?day=${DAY}"
else
  URL="${BASE_URL}/enterprises/${ENTERPRISE}/copilot/metrics/reports/${REPORT_TYPE}/latest"
fi

echo "Fetching ${REPORT_TYPE} report for enterprise: ${ENTERPRISE}..."

# Fetch report metadata
RESPONSE=$(curl -s -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GITHUB_TOKEN}" \
  -H "X-GitHub-Api-Version: ${API_VERSION}" \
  "$URL")

# Extract download links
LINKS=$(echo "$RESPONSE" | jq -r '.download_links[]?' 2>/dev/null)

if [[ -z "$LINKS" ]]; then
  echo "Error: No download links found. Response:"
  echo "$RESPONSE" | jq . 2>/dev/null || echo "$RESPONSE"
  exit 1
fi

# Download each NDJSON file
FILE_NUM=1
for LINK in $LINKS; do
  FILENAME="${OUTPUT_DIR}/${ENTERPRISE}-${REPORT_TYPE}-${FILE_NUM}.ndjson"
  echo "Downloading part ${FILE_NUM} → ${FILENAME}"
  curl -s -L -o "$FILENAME" "$LINK"
  LINES=$(wc -l < "$FILENAME")
  echo "  → ${LINES} records"
  FILE_NUM=$((FILE_NUM + 1))
done

echo ""
echo "Done! Files saved to ${OUTPUT_DIR}/"
echo "Report type: ${REPORT_TYPE}"
echo "$RESPONSE" | jq '{report_start_day, report_end_day, report_day}' 2>/dev/null || true
