# Get Copilot Enterprise User-Teams Report for a Specific Day

**Method:** `GET`  
**Path:** `/enterprises/{enterprise}/copilot/metrics/reports/user-teams-1-day`  
**API Version:** `2026-03-10`  
**Category:** Usage Metrics  
**Level:** Enterprise

## NDJSON Record Schema (live-captured)

> Schema derived from a real API response against `avocado-corp` on 2026-06-02. Each line of the downloaded NDJSON file is one JSON record matching this structure.

```json
{
  "user_id": "<number>",
  "user_login": "<string>",
  "day": "<string>",
  "enterprise_id": "<string>",
  "team_id": "<number>",
  "slug": "<string>"
}
```

## Description
Returns signed download URLs for the enterprise user-to-team membership report for a specific day. Use this endpoint to map users to teams before joining team membership data to per-user usage reports.

## Required Permissions
- **Fine-grained:** View Enterprise Copilot Metrics
- **PAT (classic) scopes:** `manage_billing:copilot` or `read:enterprise`

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| enterprise | string | Yes | The enterprise slug, for example `avocado-corp`. |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| day | string | Yes | The report date in `YYYY-MM-DD` format. |

## HTTP Status Codes
| Code | Meaning |
|------|---------|
| 200 | OK |
| 403 | Forbidden |
| 404 | Not Found |
| 500 | Internal Server Error |

## Response Schema (Status 200)
> **Note:** This endpoint returns signed download URLs to NDJSON report files, not metrics inline. The downloaded file contains NDJSON records; see the NDJSON Record Schema section below.

```json
{
  "download_links": ["<uri>"],
  "report_day": "<date>"
}
```

## Example

### Request
```bash
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2026-03-10" \
  "https://api.github.com/enterprises/avocado-corp/copilot/metrics/reports/user-teams-1-day?day=2025-11-01"
```

### Example Response
```json
{
  "download_links": [
    "https://storage.example.com/signed/user-teams-1-day.ndjson?token=abc123&expires=1700000000"
  ],
  "report_day": "2025-11-01"
}
```

## References
- [Official API Documentation](https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-usage-metrics?apiVersion=2026-03-10#get-copilot-enterprise-user-teams-report-for-a-specific-day)
