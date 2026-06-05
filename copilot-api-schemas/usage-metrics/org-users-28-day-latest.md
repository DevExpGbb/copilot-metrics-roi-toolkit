# Get Copilot Organization Users Usage Metrics — Latest 28-Day

**Method:** `GET`  
**Path:** `/orgs/{org}/copilot/metrics/reports/users-28-day/latest`  
**API Version:** `2026-03-10`  
**Category:** Usage Metrics  
**Level:** Org

## NDJSON Record Schema (live-captured)

> Schema derived from a real API response against `avocado-corp` on 2026-06-02. Each line of the downloaded NDJSON file is one JSON record matching this structure.

```json
{
  "report_start_day": "<string>",
  "report_end_day": "<string>",
  "day": "<string>",
  "organization_id": "<string>",
  "enterprise_id": "<string>",
  "user_id": "<number>",
  "user_login": "<string>",
  "user_initiated_interaction_count": "<number>",
  "code_generation_activity_count": "<number>",
  "code_acceptance_activity_count": "<number>",
  "totals_by_ide": [],
  "totals_by_feature": [{ "feature": "<string>", "user_initiated_interaction_count": "<number>", "code_generation_activity_count": "<number>", "code_acceptance_activity_count": "<number>", "loc_suggested_to_add_sum": "<number>", "loc_suggested_to_delete_sum": "<number>", "loc_added_sum": "<number>", "loc_deleted_sum": "<number>" }],
  "totals_by_language_feature": [{ "language": "<string>", "feature": "<string>", "code_generation_activity_count": "<number>", "code_acceptance_activity_count": "<number>", "loc_suggested_to_add_sum": "<number>", "loc_suggested_to_delete_sum": "<number>", "loc_added_sum": "<number>", "loc_deleted_sum": "<number>" }],
  "totals_by_language_model": [{ "language": "<string>", "model": "<string>", "code_generation_activity_count": "<number>", "code_acceptance_activity_count": "<number>", "loc_suggested_to_add_sum": "<number>", "loc_suggested_to_delete_sum": "<number>", "loc_added_sum": "<number>", "loc_deleted_sum": "<number>" }],
  "totals_by_model_feature": [{ "model": "<string>", "feature": "<string>", "user_initiated_interaction_count": "<number>", "code_generation_activity_count": "<number>", "code_acceptance_activity_count": "<number>", "loc_suggested_to_add_sum": "<number>", "loc_suggested_to_delete_sum": "<number>", "loc_added_sum": "<number>", "loc_deleted_sum": "<number>" }],
  "used_agent": "<boolean>",
  "used_chat": "<boolean>",
  "loc_suggested_to_add_sum": "<number>",
  "loc_suggested_to_delete_sum": "<number>",
  "loc_added_sum": "<number>",
  "loc_deleted_sum": "<number>",
  "used_cli": "<boolean>",
  "totals_by_cli": { "session_count": "<number>", "request_count": "<number>", "prompt_count": "<number>", "token_usage": { "output_tokens_sum": "<number>", "prompt_tokens_sum": "<number>", "avg_tokens_per_request": "<number>" }, "last_known_cli_version": { "sampled_at": "<string>", "cli_version": "<string>" } },
  "used_copilot_coding_agent": "<boolean>",
  "used_copilot_cloud_agent": "<boolean>"
}
```

## Description
Returns signed download URLs for the most recent complete 28-day per-user Copilot usage report for an organization. Use this endpoint to track rolling individual adoption and engagement within the organization.

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
| _None_ | - | No | This endpoint does not accept query parameters. |

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
  "report_start_day": "<date>",
  "report_end_day": "<date>"
}
```

## Example

### Request
```bash
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2026-03-10" \
  "https://api.github.com/orgs/eldrick-test-org/copilot/metrics/reports/users-28-day/latest"
```

### Example Response
```json
{
  "download_links": [
    "https://storage.example.com/signed/org-users-28-day.ndjson?token=abc123&expires=1700000000"
  ],
  "report_start_day": "2025-10-05",
  "report_end_day": "2025-11-01"
}
```

## References
- [Official API Documentation](https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-usage-metrics?apiVersion=2026-03-10#get-copilot-organization-users-usage-metrics)
