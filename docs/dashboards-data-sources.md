# Dashboards & Data Sources — GitHub Copilot Reference

!!! info "Vendor scope"
    This page documents the **GitHub Copilot** data sources in depth as the canonical reference implementation, because Copilot currently exposes the most mature first-party telemetry surface (Usage Metrics API, Code Generation Dashboard, premium-request reporting). Most other AI coding agents (Cursor, Sourcegraph Cody, Amazon Q Developer, etc.) expose comparable but vendor-specific APIs and dashboards — apply the same selection criteria (granularity, retention, access control, cost) when adapting this guide to your tool.

GitHub Copilot provides multiple ways to measure adoption, engagement, and impact — from built-in dashboards with visual trends to raw data exports and REST API endpoints. This guide covers every native and API-based data source available for Copilot metrics, so you can choose the right one for your reporting needs.

---

## Native Usage Metrics Dashboard

The Usage Metrics dashboard is the primary built-in view for understanding how Copilot is being adopted across your enterprise.

### How to access

1. Navigate to your **Enterprise account** on GitHub.
2. Go to **Insights → Copilot usage**.

!!! info "Policy prerequisite"
    The **"Copilot usage metrics"** policy must be enabled at the enterprise level before any data appears. An enterprise owner can enable this under **Enterprise settings → Policies → Copilot**.

### What it shows

| Metric Category | Details |
|---|---|
| **Adoption trends** | 28-day rolling view of active users, seat utilization, and onboarding velocity |
| **Engagement breakdown** | Activity split by feature — completions, chat, agent mode, edit mode |
| **Model trends** | Which AI models are being used and how usage shifts over time |
| **Language breakdown** | Top programming languages by Copilot interaction volume |
| **IDE distribution** | Usage across VS Code, JetBrains, Visual Studio, Neovim, and other editors |

### Who can access

| Role | Access Level |
|---|---|
| Enterprise owner | Full access |
| Organization admin | Org-scoped data |
| Billing manager | Full access |
| Custom role | Requires **"View Enterprise Copilot Metrics"** permission |

!!! tip "What to do next"
    - Verify the **"Copilot usage metrics"** policy is enabled in your enterprise settings.
    - Bookmark the **Insights → Copilot usage** page for regular check-ins.
    - Identify teams with low adoption and target them for enablement outreach.

---

## Code Generation Dashboard

The Code Generation dashboard focuses specifically on how AI is influencing code output across your organization.

### How to access

1. Navigate to your **Enterprise account** on GitHub.
2. Go to **Insights → Code generation**.

### What it shows

| Metric Category | Details |
|---|---|
| **Lines of code changed with AI** | Total lines added, modified, or removed where Copilot contributed |
| **User-initiated activity** | Code changes driven by developer-triggered completions and chat |
| **Agent-initiated activity** | Code changes driven by Copilot agent mode autonomously |
| **Model breakdown** | Which models generated the code (e.g., GPT-4o, Claude Sonnet) |
| **Language breakdown** | Lines changed per programming language |

!!! note "Permissions"
    The same permission requirements apply as the Usage Metrics dashboard — enterprise owner, org admin, billing manager, or a custom role with **"View Enterprise Copilot Metrics"** permission.

!!! tip "What to do next"
    - Compare **user-initiated vs. agent-initiated** ratios to understand how teams are leveraging agent mode.
    - Track language-level trends to see where Copilot delivers the most code generation value.
    - Use this data alongside the Usage Metrics dashboard for a complete adoption picture.

---

## NDJSON Export

The NDJSON (Newline-Delimited JSON) export provides raw, granular data from the dashboard for custom analysis in your own BI tools.

### What it is

A downloadable file containing one JSON object per line, representing a single user's activity for a single day. This is the same data that powers the native dashboards, exported in a machine-readable format.

### How to download

1. Open the **Usage Metrics** or **Code Generation** dashboard.
2. Click the **Export** button in the dashboard UI.
3. The browser downloads an `.ndjson` file.

### What's in the file

Each line is a self-contained JSON object with fields including:

```json
{
  "date": "2025-01-15",
  "user": "octocat",
  "feature": "completions",
  "interactions": 42,
  "acceptances": 28,
  "language": "python",
  "editor": "vscode",
  "model": "gpt-4o"
}
```

| Field Category | Examples |
|---|---|
| **Identity** | User login, team, organization |
| **Interaction counts** | Suggestions shown, acceptances, dismissals |
| **Acceptance activity** | Lines accepted, acceptance rate per feature |
| **Feature usage** | Completions, chat, agent mode, edit mode |
| **Context** | Language, editor, model, date |

### Use cases

| Tool | How to Use |
|---|---|
| **Power BI** | Import the NDJSON file as a JSON data source and build executive dashboards |
| **Jupyter Notebooks** | Load with `pandas.read_json('export.ndjson', lines=True)` for ad-hoc analysis |
| **Data warehouses** | Ingest into Snowflake, BigQuery, or Azure Synapse for long-term trend analysis |
| **Excel** | Use Power Query to transform NDJSON into tabular format |

!!! tip "Use Copilot Chat for analysis"
    Upload your exported NDJSON file to **Copilot Chat** and ask questions like _"Which teams have the highest acceptance rate?"_ or _"Show me adoption trends over the last 4 weeks."_ Copilot can analyze the data and generate insights directly.

!!! tip "What to do next"
    - Export your first NDJSON file and explore it in your preferred BI tool.
    - Set up a recurring workflow to pull exports weekly for trend tracking.
    - Combine NDJSON data with your internal systems (e.g., JIRA, Azure DevOps) for ROI correlation.

---

## REST API Endpoints

For programmatic access, GitHub provides REST API endpoints that return Copilot usage metrics at various scopes.

### Available endpoints

| Endpoint | Scope | What It Returns | Key Parameters |
|---|---|---|---|
| **Enterprise 28-day report** | Enterprise | Aggregated 28-day metrics across all orgs | `enterprise` slug |
| **Enterprise 1-day report** | Enterprise | Single-day aggregated metrics | `enterprise` slug, `day` (YYYY-MM-DD) |
| **Users 28-day report** | Enterprise (user-level) | Per-user 28-day metrics for every seat | `enterprise` slug |
| **Users 1-day report** | Enterprise (user-level) | Per-user metrics for a single day | `enterprise` slug, `day` (YYYY-MM-DD) |
| **Org 28-day report** | Organization | Org-level 28-day aggregated metrics | `org` slug |
| **Org 1-day report** | Organization | Org-level single-day metrics | `org` slug, `day` (YYYY-MM-DD) |

### Authentication

| Auth Method | Required Scope |
|---|---|
| **Personal Access Token (classic)** | `manage_billing:copilot` or `read:enterprise` |
| **Fine-grained PAT** | **"Enterprise Copilot metrics"** — read permission |

Example API call:

```bash
curl -H "Authorization: Bearer YOUR_PAT" \
     -H "Accept: application/json" \
     "https://api.github.com/enterprises/{enterprise}/copilot/usage"
```

### Response format

The API returns a JSON response containing a `download_links` array. Each entry provides a signed URL pointing to an NDJSON file:

```json
{
  "download_links": [
    {
      "url": "https://github-cloud.s3.amazonaws.com/...",
      "expires_at": "2025-01-16T12:00:00Z",
      "content_type": "application/x-ndjson"
    }
  ]
}
```

Download the signed URL to retrieve the raw NDJSON data for processing.

!!! info "Full API documentation"
    See the complete endpoint reference, request/response schemas, and pagination details at:
    [Copilot Usage Metrics API docs](https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-usage-metrics)

!!! tip "What to do next"
    - Generate a PAT with the appropriate scope and test a 28-day enterprise report call.
    - Build an automated pipeline that pulls data daily and loads it into your data warehouse.
    - Use the user-level endpoints to build per-team adoption dashboards.

---

## Legacy APIs & Sunset Timeline

!!! warning "Legacy API Retirement"
    Two older Copilot metrics APIs are being retired. Migrate to the **Copilot Usage Metrics API** before the sunset dates.

    - **User-Level Feature Engagement Metrics API**: Sunset **March 2, 2026**
    - **Copilot Metrics API** (`/copilot/metrics`): Sunset **April 2, 2026**
    - **Action required**: Migrate all integrations to the current Copilot Usage Metrics API endpoints.
    - The legacy Copilot Metrics API does **NOT** include Agent mode or Edit mode telemetry.

### API comparison

| API Resource | Scope | Key Differences |
|---|---|---|
| **Copilot Usage Metrics API** (current) | Enterprise, Org, User | Unified telemetry across completions, chat, and agent. Actively maintained. Supports user-level granularity. |
| **Copilot Metrics API** (legacy, sunsetting) | Enterprise, Org, Team | Aggregated data only. No agent/edit mode telemetry. No user-level data. Sunset April 2, 2026. |
| **Copilot User Management API** | License / Seat | Seat assignments and license state. Source of truth for licensing. Not affected by sunset. |

### Migration checklist

1. **Inventory** all scripts and integrations that call `/copilot/metrics` endpoints.
2. **Map** legacy fields to their equivalents in the Copilot Usage Metrics API.
3. **Update** authentication — ensure tokens have `manage_billing:copilot` or `read:enterprise` scope.
4. **Test** in a non-production environment before switching over.
5. **Decommission** legacy API calls well before the sunset dates.

!!! tip "What to do next"
    - Audit your existing integrations for any calls to the legacy `/copilot/metrics` endpoints.
    - Plan your migration timeline — aim to complete migration at least 30 days before sunset.
    - Review the [Copilot Usage Metrics API docs](https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-usage-metrics) for the current endpoint reference.

---

## Data Freshness

Understanding when metrics data becomes available is important for setting expectations with stakeholders and scheduling automated reports.

| Aspect | Details |
|---|---|
| **Processing delay** | Data is available within **3 full UTC days** of the activity |
| **Example** | Monday's usage data becomes visible by **end of day Thursday UTC** |
| **Weekend effect** | Weekend activity may add up to **4 calendar days** of delay due to processing schedules |
| **Time zone** | All timestamps and daily boundaries are based on **UTC** |

```text
Activity Day    Available By (latest)
──────────────  ─────────────────────
Monday          Thursday EOD UTC
Tuesday         Friday EOD UTC
Wednesday       Saturday EOD UTC
Thursday        Sunday EOD UTC
Friday          Monday EOD UTC
Saturday        Tuesday–Wednesday EOD UTC
Sunday          Wednesday–Thursday EOD UTC
```

!!! tip "What to do next"
    - Schedule automated report generation to run **no earlier than 4 days after** the target date.
    - Communicate the 3-day lag to stakeholders so they don't expect real-time data.
    - Use the freshness window to batch daily pulls into a weekly cadence if real-time granularity isn't needed.

---

## Permissions & Policy Prerequisites

A quick-reference summary of everything required to access Copilot metrics data.

| Requirement | Details |
|---|---|
| **Policy** | **"Copilot usage metrics"** must be enabled at the enterprise level |
| **Roles (enterprise)** | Enterprise owner, org admin, billing manager, or custom role with **"View Enterprise Copilot Metrics"** permission |
| **Roles (org-only)** | Custom role with **"View organization Copilot metrics"** permission for org-scoped visibility |
| **API auth (classic PAT)** | `manage_billing:copilot` or `read:enterprise` scope |
| **API auth (fine-grained PAT)** | **"Enterprise Copilot metrics"** — read permission |

!!! info "Custom roles"
    If you need to grant metrics access without full admin or billing privileges, create a **custom enterprise role** with only the **"View Enterprise Copilot Metrics"** permission. For org-scoped access, use the **"View organization Copilot metrics"** permission on a custom org role.

!!! tip "What to do next"
    - Confirm the **"Copilot usage metrics"** policy is enabled in **Enterprise settings → Policies → Copilot**.
    - Create a dedicated **service account PAT** with minimal scopes for automated API access.
    - Set up custom roles for team leads who need metrics visibility without admin privileges.
    - Review token expiration policies and set up rotation schedules for API credentials.
