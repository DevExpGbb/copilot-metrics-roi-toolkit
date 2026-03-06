# Quick Start Playbook

**From zero to adoption visibility in 30 minutes**

---

## Prerequisites

- [x] **GitHub Enterprise Cloud** account
- [x] **Copilot Business or Copilot Enterprise** subscription active
- [x] **Enterprise owner** or **organization admin** role

!!! warning "Permissions Required"
    Enterprise owners can access enterprise-level insights. Org admins see org-level data only.

---

## Step 1: Enable the Copilot Usage Metrics Policy

**Path:** Enterprise settings → Policies → Copilot

1. Go to your enterprise account on `github.com`.
2. Click **Policies** → **Copilot** in the sidebar.
3. Set "Copilot Metrics API access policy" to **Enabled** or **No policy**.
4. Click **Save**.

!!! info "Propagation Delay"
    Historical data may take up to 24 hours to populate. New activity appears within a few hours.

---

## Step 2: Review the Usage Metrics Dashboard

**Path:** Enterprise → Insights → Copilot usage

| Metric | Healthy Signal |
|--------|----------------|
| **Daily Active Users (DAU)** | Steady or growing trend |
| **Acceptance Rate** | Stable trend (track direction, not absolute value) |
| **Feature Breakdown** | Broadening adoption across completions, chat, CLI, PR summaries |

---

## Step 3: Review the Code Generation Dashboard

**Path:** Enterprise → Insights → Code generation

| Dimension | Why It Matters |
|-----------|----------------|
| **User vs. Agent split** | How much code comes from Agents vs. interactive suggestions |
| **Language breakdown** | Which languages see the most Copilot-assisted development |
| **Model breakdown** | Which models are used and their relative contribution |

---

## Step 4: Export Your First NDJSON Report

=== "Dashboard UI"

    1. Navigate to the Usage Metrics or Code Generation dashboard.
    2. Click **Export** (top right).
    3. Select your date range and download the `.ndjson` file.

=== "API (curl)"

    ```bash
    curl -L \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer YOUR_PAT" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      "https://api.github.com/enterprises/ENTERPRISE/copilot/usage" \
      -o copilot-usage.ndjson
    ```

    Replace `YOUR_PAT` with a token that has `manage_billing:copilot` scope, and `ENTERPRISE` with your enterprise slug.

---

## Step 5: Set 3 Initial KPIs

| KPI | Target | Why |
|-----|--------|-----|
| **DAU/MAU Ratio** | > 60% | Measures habitual usage vs. one-off trials |
| **Acceptance Rate Trend** | Stable or improving | Declining rates signal quality or onboarding gaps |
| **Seat Utilization** | > 70% | Ensures you're not paying for unused licenses |

---

## Step 6: Schedule a Monthly Review Cadence

**Suggested agenda (30 min):**

1. **Adoption check** (5 min) — DAU/MAU ratio, seat utilization
2. **Quality check** (5 min) — Acceptance rate trend, feature mix
3. **Anecdotes** (10 min) — Qualitative feedback from 2–3 developers
4. **Action items** (10 min) — Address low utilization, plan enablement sessions

---

**After completing this playbook you'll have baseline KPIs, an exported data file, and a monthly review cadence.**

---

## When to Level Up

You've outgrown this playbook when you need team/language/BU slicing, custom dashboards, or automated data collection.

:material-arrow-right: Move to the [Analytics-Ready Playbook](analytics-ready.md).

---

## What to Do Next

- :material-chart-bar: Review your Usage Metrics dashboard **today** and note baseline numbers
- :material-calendar-check: Schedule your **first monthly review** within two weeks
- :material-share-variant: Share KPI targets with engineering leads
- :material-book-open-variant: Read the [Analytics-Ready Playbook](analytics-ready.md) when ready to automate
