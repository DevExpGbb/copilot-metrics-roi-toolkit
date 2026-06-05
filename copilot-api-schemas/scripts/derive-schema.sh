#!/usr/bin/env bash
# derive-schema.sh — reads JSON from stdin and prints a type-skeleton schema
# Usage: cat response.json | ./derive-schema.sh
# Or: ./derive-schema.sh < response.json
#
# This is useful for deriving the schema of a live API response to compare
# against or update the documented schema in the endpoint .md files.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib.sh" 2>/dev/null || true

# If lib.sh loaded successfully, use shared function; otherwise inline jq
if declare -f derive_schema_from_json > /dev/null 2>&1; then
  derive_schema_from_json
else
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
fi
