# Data Samples

Example NDJSON schemas and sample data for testing and understanding the **GitHub Copilot Usage Metrics API** data format. These samples are the canonical reference shape used throughout the AI Coding Agent ROI Toolkit; other AI coding agents expose comparable but vendor-specific schemas.

## Files

| File | Description |
|------|-------------|
| `enterprise-usage-sample.ndjson` | Sample enterprise-level 28-day usage metrics (one record per day) |
| `user-usage-sample.ndjson` | Sample user-level usage metrics (one record per user per day) |

## Schema Overview

### Enterprise Usage Record

Each line in the enterprise NDJSON file represents aggregated metrics for one day:

| Field | Type | Description |
|-------|------|-------------|
| `date` | string | UTC date (YYYY-MM-DD) |
| `total_active_users` | integer | Users with any Copilot interaction |
| `total_engaged_users` | integer | Users who accepted at least one suggestion |
| `copilot_ide_code_completions` | object | Inline completion metrics (suggestions, acceptances, lines) |
| `copilot_ide_chat` | object | Chat interaction metrics |
| `copilot_ide_agent` | object | Agent mode metrics |
| `copilot_pull_requests` | object | PR lifecycle metrics |

### User Usage Record

Each line represents one user's activity for one day:

| Field | Type | Description |
|-------|------|-------------|
| `date` | string | UTC date |
| `user_login` | string | GitHub username |
| `user_id` | integer | GitHub user ID |
| `user_initiated_interaction_count` | integer | Total user-initiated interactions |
| `code_acceptance_activity_count` | integer | Code suggestions accepted |
| `copilot_ide_code_completions` | object | Per-user completion metrics |
| `copilot_ide_chat` | object | Per-user chat metrics |

> **Note**: These are illustrative samples with fictional data. Actual field names and structure may evolve. Always refer to the [official API documentation](https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-usage-metrics) for the current schema.

## Usage

Load these samples into your BI tool or analysis notebook to understand the data structure before connecting to live data.

```bash
# Count records
wc -l enterprise-usage-sample.ndjson

# Pretty-print first record
head -1 enterprise-usage-sample.ndjson | jq .

# Analyze with Python
python -c "
import json
with open('enterprise-usage-sample.ndjson') as f:
    for line in f:
        record = json.loads(line)
        print(f\"{record['date']}: {record['total_active_users']} active users\")
"
```
