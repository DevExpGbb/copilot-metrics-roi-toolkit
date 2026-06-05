# Get Copilot Users Usage Metrics for a Specific Day (Enterprise)

**Method:** `GET`  
**Path:** `/enterprises/{enterprise}/copilot/metrics/reports/users-1-day`  
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
  "used_copilot_cloud_agent": "<boolean>",
  "ai_adoption_phase": { "phase_number": "<number>", "phase": "<string>", "version": "<string>" }
}
```

## Description
Returns signed download URLs for the per-user enterprise Copilot usage report for a single day. Use this endpoint when you need individual user engagement and feature usage detail rather than enterprise-wide aggregates.

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
  "https://api.github.com/enterprises/avocado-corp/copilot/metrics/reports/users-1-day?day=2025-11-01"
```

### Example Response
```json
{
  "download_links": [
    "https://storage.example.com/signed/enterprise-users-1-day.ndjson?token=abc123&expires=1700000000"
  ],
  "report_day": "2025-11-01"
}
```

## References
- [Official API Documentation](https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-usage-metrics?apiVersion=2026-03-10#get-copilot-users-usage-metrics-for-a-specific-day)
