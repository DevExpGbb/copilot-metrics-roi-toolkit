# Get Copilot Enterprise Usage Metrics for a Specific Day

**Method:** `GET`  
**Path:** `/enterprises/{enterprise}/copilot/metrics/reports/enterprise-1-day`  
**API Version:** `2026-03-10`  
**Category:** Usage Metrics  
**Level:** Enterprise

## NDJSON Record Schema (live-captured)

> Schema derived from a real API response against `avocado-corp` on 2026-06-02. Each line of the downloaded NDJSON file is one JSON record matching this structure.

```json
{
  "day": "<string>",
  "enterprise_id": "<string>",
  "daily_active_users": "<number>",
  "daily_active_cli_users": "<number>",
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
  "totals_by_ide": [{ "ide": "<string>", "user_initiated_interaction_count": "<number>", "code_generation_activity_count": "<number>", "code_acceptance_activity_count": "<number>", "loc_suggested_to_add_sum": "<number>", "loc_suggested_to_delete_sum": "<number>", "loc_added_sum": "<number>", "loc_deleted_sum": "<number>" }],
  "totals_by_feature": [{ "feature": "<string>", "user_initiated_interaction_count": "<number>", "code_generation_activity_count": "<number>", "code_acceptance_activity_count": "<number>", "loc_suggested_to_add_sum": "<number>", "loc_suggested_to_delete_sum": "<number>", "loc_added_sum": "<number>", "loc_deleted_sum": "<number>" }],
  "totals_by_language_feature": [{ "language": "<string>", "feature": "<string>", "code_generation_activity_count": "<number>", "code_acceptance_activity_count": "<number>", "loc_suggested_to_add_sum": "<number>", "loc_suggested_to_delete_sum": "<number>", "loc_added_sum": "<number>", "loc_deleted_sum": "<number>" }],
  "totals_by_language_model": [{ "language": "<string>", "model": "<string>", "code_generation_activity_count": "<number>", "code_acceptance_activity_count": "<number>", "loc_suggested_to_add_sum": "<number>", "loc_suggested_to_delete_sum": "<number>", "loc_added_sum": "<number>", "loc_deleted_sum": "<number>" }],
  "totals_by_model_feature": [{ "model": "<string>", "feature": "<string>", "user_initiated_interaction_count": "<number>", "code_generation_activity_count": "<number>", "code_acceptance_activity_count": "<number>", "loc_suggested_to_add_sum": "<number>", "loc_suggested_to_delete_sum": "<number>", "loc_added_sum": "<number>", "loc_deleted_sum": "<number>" }],
  "loc_suggested_to_add_sum": "<number>",
  "loc_suggested_to_delete_sum": "<number>",
  "loc_added_sum": "<number>",
  "loc_deleted_sum": "<number>",
  "pull_requests": {
    "total_reviewed": "<number>", "total_created": "<number>", "total_created_by_copilot": "<number>",
    "total_reviewed_by_copilot": "<number>", "total_merged": "<number>", "median_minutes_to_merge": "<number>",
    "total_suggestions": "<number>", "total_applied_suggestions": "<number>",
    "total_merged_created_by_copilot": "<number>", "median_minutes_to_merge_copilot_authored": "<number>",
    "total_copilot_suggestions": "<number>", "total_copilot_applied_suggestions": "<number>",
    "total_merged_reviewed_by_copilot": "<number>",
    "copilot_suggestions_by_comment_type": [{ "comment_type": "<string>", "total_copilot_suggestions": "<number>", "total_copilot_applied_suggestions": "<number>" }]
  },
  "totals_by_cli": { "session_count": "<number>", "request_count": "<number>", "token_usage": { "output_tokens_sum": "<number>", "prompt_tokens_sum": "<number>", "avg_tokens_per_request": "<number>" }, "prompt_count": "<number>" },
  "daily_active_copilot_code_review_users": "<number>",
  "weekly_active_copilot_code_review_users": "<number>",
  "monthly_active_copilot_code_review_users": "<number>",
  "daily_passive_copilot_code_review_users": "<number>",
  "weekly_passive_copilot_code_review_users": "<number>",
  "monthly_passive_copilot_code_review_users": "<number>",
  "totals_by_ai_adoption_phase": [{ "phase": "<string>", "phase_number": "<number>", "total_engaged_users": "<number>", "avg_user_initiated_interactions": "<number>", "avg_code_generation_activities": "<number>", "avg_code_acceptance_activities": "<number>", "avg_loc_added": "<number>", "avg_loc_deleted": "<number>", "avg_pull_requests_reviewed": "<number>", "avg_pull_requests_created": "<number>", "avg_pull_requests_merged": "<number>", "avg_pull_requests_median_minutes_to_merge": "<number>" }]
}
```

## Description
Returns signed download URLs for the enterprise-level Copilot usage metrics report for a single calendar day. Use this endpoint when you want aggregated daily usage data across the entire enterprise rather than per-user detail.

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
  "https://api.github.com/enterprises/avocado-corp/copilot/metrics/reports/enterprise-1-day?day=2025-11-01"
```

### Example Response
```json
{
  "download_links": [
    "https://storage.example.com/signed/enterprise-1-day-part1.ndjson?token=abc123&expires=1700000000"
  ],
  "report_day": "2025-11-01"
}
```

## References
- [Official API Documentation](https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-usage-metrics?apiVersion=2026-03-10#get-copilot-enterprise-usage-metrics-for-a-specific-day)
