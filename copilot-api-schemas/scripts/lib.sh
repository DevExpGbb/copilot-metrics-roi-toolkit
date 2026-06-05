#!/usr/bin/env bash
# lib.sh — shared helpers for Copilot API schema scripts
# Source this file: source "$(dirname "$0")/lib.sh"

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCHEMA_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Load .env from schema root (ignore missing keys gracefully)
if [[ -f "$SCHEMA_ROOT/.env" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$SCHEMA_ROOT/.env"
  set +a
else
  echo "ERROR: $SCHEMA_ROOT/.env not found. Copy .env.example → .env and fill in credentials." >&2
  exit 1
fi

# Required vars
: "${GITHUB_TOKEN:?GITHUB_TOKEN must be set in .env}"
: "${GH_API_VERSION:=2026-03-10}"
: "${ENTERPRISE:?ENTERPRISE must be set in .env}"
: "${ORG:?ORG must be set in .env}"
: "${USERNAME:?USERNAME must be set in .env}"

LIVE_CAPTURE_DIR="$SCHEMA_ROOT/live-capture"
mkdir -p "$LIVE_CAPTURE_DIR"

GH_HEADERS=(
  -H "Accept: application/vnd.github+json"
  -H "Authorization: Bearer ${GITHUB_TOKEN}"
  -H "X-GitHub-Api-Version: ${GH_API_VERSION}"
)

# gh_get URL → prints response body to stdout; also sets GH_STATUS_CODE
gh_get() {
  local url="$1"
  local tmp
  tmp=$(mktemp)
  local http_code
  http_code=$(curl -s -L -o "$tmp" -w "%{http_code}" "${GH_HEADERS[@]}" "$url")
  GH_STATUS_CODE="$http_code"
  cat "$tmp"
  rm -f "$tmp"
}

# derive_schema_from_json — reads JSON on stdin, outputs a type-skeleton JSON
# showing the structure with value types replaced by type labels
derive_schema_from_json() {
  jq '
    def type_label:
      if type == "object" then
        with_entries(.value |= type_label)
      elif type == "array" then
        if length == 0 then ["<empty_array>"]
        else [first | type_label]
        end
      elif type == "string" then "<string>"
      elif type == "number" then "<number>"
      elif type == "boolean" then "<boolean>"
      elif . == null then "<null>"
      else "<unknown>"
      end;
    type_label
  '
}
