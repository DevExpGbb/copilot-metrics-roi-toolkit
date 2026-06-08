# Copilot API Schemas

This folder is a self-contained toolkit for documenting GitHub Copilot REST API schemas and refreshing them from live API responses.

> **Warning**
> `.env` is gitignored and must never be committed.
> The PAT stored in `.env` uses broad scopes for Copilot API access, so rotate it regularly at https://github.com/settings/tokens.
> `live-capture/` is also gitignored because real API responses can include PII, usernames, and seat-assignment data.
> If the PAT was ever exposed in chat logs, shell history, screenshots, or any other logs, rotate it immediately.

## Quick start

1. Copy `.env.example` to `.env` and fill in your `GITHUB_TOKEN`, `ENTERPRISE`, `ORG`, `USERNAME`, and optionally `GH_API_VERSION` (default `2026-03-10`).
2. Run:

   ```bash
   bash scripts/fetch-schemas.sh
   ```

   This saves raw responses and derived schemas under `live-capture/`.
3. Compare `live-capture/<id>-schema.json` against the committed `.md` docs to spot schema drift.
4. If schemas changed, update the relevant `.md` file in `usage-metrics/`, `user-management/`, or `billing-usage/`.

## Endpoint inventory

| # | API group | Method | Path | Level | Mutating? | Doc file |
|---|-----------|--------|------|-------|-----------|----------|
| 1 | Usage Metrics | GET | `/enterprises/{enterprise}/copilot/metrics/reports/enterprise-1-day` | enterprise | No | `usage-metrics/enterprise-1-day.md` |
| 2 | Usage Metrics | GET | `/enterprises/{enterprise}/copilot/metrics/reports/enterprise-28-day/latest` | enterprise | No | `usage-metrics/enterprise-28-day-latest.md` |
| 3 | Usage Metrics | GET | `/enterprises/{enterprise}/copilot/metrics/reports/user-teams-1-day` | enterprise | No | `usage-metrics/enterprise-user-teams-1-day.md` |
| 4 | Usage Metrics | GET | `/enterprises/{enterprise}/copilot/metrics/reports/users-1-day` | enterprise | No | `usage-metrics/enterprise-users-1-day.md` |
| 5 | Usage Metrics | GET | `/enterprises/{enterprise}/copilot/metrics/reports/users-28-day/latest` | enterprise | No | `usage-metrics/enterprise-users-28-day-latest.md` |
| 6 | Usage Metrics | GET | `/orgs/{org}/copilot/metrics/reports/organization-1-day` | org | No | `usage-metrics/org-organization-1-day.md` |
| 7 | Usage Metrics | GET | `/orgs/{org}/copilot/metrics/reports/organization-28-day/latest` | org | No | `usage-metrics/org-organization-28-day-latest.md` |
| 8 | Usage Metrics | GET | `/orgs/{org}/copilot/metrics/reports/user-teams-1-day` | org | No | `usage-metrics/org-user-teams-1-day.md` |
| 9 | Usage Metrics | GET | `/orgs/{org}/copilot/metrics/reports/users-1-day` | org | No | `usage-metrics/org-users-1-day.md` |
| 10 | Usage Metrics | GET | `/orgs/{org}/copilot/metrics/reports/users-28-day/latest` | org | No | `usage-metrics/org-users-28-day-latest.md` |
| 11 | User Management | GET | `/enterprises/{enterprise}/copilot/billing/seats` | enterprise | No | `user-management/enterprise-billing-seats.md` |
| 12 | User Management | POST | `/enterprises/{enterprise}/copilot/billing/selected_enterprise_teams` | enterprise | **Yes** | `user-management/enterprise-selected-enterprise-teams.md` |
| 13 | User Management | DELETE | `/enterprises/{enterprise}/copilot/billing/selected_enterprise_teams` | enterprise | **Yes** | `user-management/enterprise-selected-enterprise-teams.md` |
| 14 | User Management | POST | `/enterprises/{enterprise}/copilot/billing/selected_users` | enterprise | **Yes** | `user-management/enterprise-selected-users.md` |
| 15 | User Management | DELETE | `/enterprises/{enterprise}/copilot/billing/selected_users` | enterprise | **Yes** | `user-management/enterprise-selected-users.md` |
| 16 | User Management | GET | `/enterprises/{enterprise}/members/{username}/copilot` | enterprise | No | `user-management/enterprise-member-copilot.md` |
| 17 | User Management | GET | `/orgs/{org}/copilot/billing` | org | No | `user-management/org-billing.md` |
| 18 | User Management | GET | `/orgs/{org}/copilot/billing/seats` | org | No | `user-management/org-billing-seats.md` |
| 19 | User Management | POST | `/orgs/{org}/copilot/billing/selected_teams` | org | **Yes** | `user-management/org-selected-teams.md` |
| 20 | User Management | DELETE | `/orgs/{org}/copilot/billing/selected_teams` | org | **Yes** | `user-management/org-selected-teams.md` |
| 21 | User Management | POST | `/orgs/{org}/copilot/billing/selected_users` | org | **Yes** | `user-management/org-selected-users.md` |
| 22 | User Management | DELETE | `/orgs/{org}/copilot/billing/selected_users` | org | **Yes** | `user-management/org-selected-users.md` |
| 23 | User Management | GET | `/orgs/{org}/members/{username}/copilot` | org | No | `user-management/org-member-copilot.md` |
| 24 | Billing Usage | GET | `/enterprises/{enterprise}/settings/billing/ai_credit/usage` | enterprise | No | `billing-usage/enterprise-ai-credit-usage.md` |
| 25 | Billing Usage | GET | `/organizations/{org}/settings/billing/ai_credit/usage` | org | No | `billing-usage/org-ai-credit-usage.md` |
| 26 | Billing Usage | GET | `/users/{username}/settings/billing/ai_credit/usage` | user | No | `billing-usage/user-ai-credit-usage.md` |

Mutating endpoints (`POST`/`DELETE`) are documented only. `fetch-schemas.sh` never executes them.

## Scripts reference

| Script | Purpose |
|--------|---------|
| `scripts/fetch-schemas.sh` | Calls all non-mutating GET endpoints; saves raw + derived schemas under `live-capture/` |
| `scripts/lib.sh` | Shared helpers sourced by other scripts (env loader, `gh_get()`, jq schema deriver) |
| `scripts/derive-schema.sh` | Reads JSON from stdin, outputs a type-skeleton showing field names and types |

## Output layout (`live-capture/`)

After running `fetch-schemas.sh`, `live-capture/` contains:

- `<endpoint-id>-raw.json` — the actual API response, or `.txt` if the response was non-JSON or an error payload.
- `<endpoint-id>-schema.json` — the derived type-skeleton showing field names and types without example values.
- For usage-metrics endpoints that return download links: `<endpoint-id>-ndjson-raw.ndjson` and `<endpoint-id>-ndjson-schema.json` if the script successfully followed the signed URL.

The naming convention matches the `id` field in `manifest.json`.

## Keeping schemas up to date

GitHub may add, remove, or change fields without much notice. Run `fetch-schemas.sh` periodically (for example, monthly), diff the generated output against the committed docs, and update the affected `.md` files whenever you detect schema drift. The API version is pinned in `.env` via `GH_API_VERSION`; bump that value when you want to test against a newer preview or dated version.

## References

- GitHub Copilot Usage Metrics API: https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-usage-metrics
- GitHub Copilot User Management API: https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-user-management
- GitHub Billing Usage API (enterprise): https://docs.github.com/en/enterprise-cloud@latest/rest/billing/usage
- GitHub Billing Usage API (organization/user): https://docs.github.com/en/rest/billing/usage
- API version used: `2026-03-10`
