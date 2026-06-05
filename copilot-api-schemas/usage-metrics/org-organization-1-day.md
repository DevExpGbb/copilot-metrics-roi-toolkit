# Get Copilot Organization Usage Metrics for a Specific Day

**Method:** `GET`  
**Path:** `/orgs/{org}/copilot/metrics/reports/organization-1-day`  
**API Version:** `2026-03-10`  
**Category:** Usage Metrics  
**Level:** Org

## NDJSON Record Schema (live-captured)

> Schema derived from a real API response against `avocado-corp` on 2026-06-02. Each line of the downloaded NDJSON file is one JSON record matching this structure.

```json
{
  "day": "<string>",
  "organization_id": "<string>",
  "enterprise_id": "<string>",
  "daily_active_users": "<number>",
  "daily_active_copilot_cloud_agent_users": "<number>",
  "weekly_active_users": "<number>",
  "weekly_active_copilot_cloud_agent_users": "<number>",
  "monthly_active_users": "<number>",
  "monthly_active_chat_users": "<number>",
  "monthly_active_agent_users": "<number>",
  "monthly_active_copilot_cloud_agent_users": "<number>",
  "user_initiated_interaction_count": "<number>",
  "code_generation_activity_count": "<number>",
  "code_acceptance_activity_count": "<number>",
  "totals_by_ide": [],
  "totals_by_feature": [],
  "totals_by_language_feature": [],
  "totals_by_language_model": [],
  "totals_by_model_feature": [],
  "loc_suggested_to_add_sum": "<number>",
  "loc_suggested_to_delete_sum": "<number>",
  "loc_added_sum": "<number>",
  "loc_deleted_sum": "<number>",
  "pull_requests": {
    "total_reviewed": "<number>", "total_created": "<number>", "total_created_by_copilot": "<number>",
    "total_reviewed_by_copilot": "<number>", "total_merged": "<number>", "median_minutes_to_merge": "<number>",
    "total_suggestions": "<number>", "total_applied_suggestions": "<number>",
    "total_merged_created_by_copilot": "<number>", "total_copilot_suggestions": "<number>",
    "total_copilot_applied_suggestions": "<number>", "total_merged_reviewed_by_copilot": "<number>",
    "copilot_suggestions_by_comment_type": []
  },
  "daily_active_copilot_code_review_users": "<number>",
  "weekly_active_copilot_code_review_users": "<number>",
  "monthly_active_copilot_code_review_users": "<number>",
  "daily_passive_copilot_code_review_users": "<number>",
  "weekly_passive_copilot_code_review_users": "<number>",
  "monthly_passive_copilot_code_review_users": "<number>"
}
```

## Description
Returns signed download URLs for an organization's aggregated Copilot usage metrics for a specific day. This is the organization-scoped daily aggregate report; if no report data exists for the day, the API can return `204 No Content`.

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
  "https://api.github.com/orgs/eldrick-test-org/copilot/metrics/reports/organization-1-day?day=2025-11-01"
```

### Example Response
```json
{
  "download_links": [
    "https://storage.example.com/signed/org-1-day.ndjson?token=abc123&expires=1700000000"
  ],
  "report_day": "2025-11-01"
}
```

## References
- [Official API Documentation](https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-usage-metrics?apiVersion=2026-03-10#get-copilot-organization-usage-metrics-for-a-specific-day)
