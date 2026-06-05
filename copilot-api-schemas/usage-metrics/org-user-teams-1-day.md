# Get Copilot Organization User-Teams Report for a Specific Day

**Method:** `GET`  
**Path:** `/orgs/{org}/copilot/metrics/reports/user-teams-1-day`  
**API Version:** `2026-03-10`  
**Category:** Usage Metrics  
**Level:** Org

## NDJSON Record Schema

> The API returned HTTP 204 (no data) for the test org on `2026-06-02`, so no live NDJSON sample was available. Based on the matching enterprise 1-day endpoint pattern, each line of the downloaded NDJSON file is expected to be one JSON record matching this structure.

```json
{
  "user_id": "<number>",
  "user_login": "<string>",
  "day": "<string>",
  "organization_id": "<string>",
  "team_id": "<number>",
  "slug": "<string>"
}
```

## Description
Returns signed download URLs for the organization user-to-team membership report for a specific day. Use this endpoint to build team-level analytics by joining the mapping data to organization user-level usage reports.

## Required Permissions
- **Fine-grained:** View Organization Copilot Metrics
- **PAT (classic) scopes:** `read:org`

## Parameters

### Path Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| org | string | Yes | The organization login, for example `eldrick-test-org`. |

### Query Parameters
| Name | Type | Required | Description |
|------|------|----------|-------------|
| day | string | Yes | The report date in `YYYY-MM-DD` format. |

## HTTP Status Codes
| Code | Meaning |
|------|---------|
| 200 | OK |
| 204 | No Content |
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
  "https://api.github.com/orgs/eldrick-test-org/copilot/metrics/reports/user-teams-1-day?day=2025-11-01"
```

### Example Response
```json
{
  "download_links": [
    "https://storage.example.com/signed/org-user-teams-1-day.ndjson?token=abc123&expires=1700000000"
  ],
  "report_day": "2025-11-01"
}
```

## References
- [Official API Documentation](https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-usage-metrics?apiVersion=2026-03-10#get-copilot-organization-user-teams-report-for-a-specific-day)
