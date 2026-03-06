# Analytics-Ready Playbook

**Custom dashboards and BI integration in half a day**

---

## Prerequisites

- [x] **Quick Start playbook completed** — baseline KPIs and review cadence in place
- [x] **Personal Access Token (PAT)** with `manage_billing:copilot` scope
- [x] **A BI or visualization tool** — Power BI, Tableau, Jupyter, Grafana, or similar

!!! warning "PAT Security"
    Store your PAT securely. Never commit it to source control. Use a secret manager or environment variable.

---

## Step 1: Set Up API Access

### Create a PAT

1. **Settings → Developer settings → Personal access tokens → Fine-grained tokens**.
2. Set resource owner to your **enterprise**.
3. Enable **`manage_billing:copilot`** (read).
4. Generate and copy the token.

### Test Your Access

```bash
curl -s -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer YOUR_PAT" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/enterprises/ENTERPRISE/copilot/usage" \
  | head -c 500
```

!!! success "Expected Result"
    NDJSON output with `day`, `total_active_users`, `total_engaged_users`, and `breakdown` arrays. A `401`/`403` means incorrect PAT scopes or enterprise slug.

---

## Step 2: Automate Data Collection

Replace manual exports with a scheduled daily job.

=== "GitHub Actions"

    Create `.github/workflows/copilot-metrics-collect.yml`:

    ```yaml
    name: Collect Copilot Metrics
    on:
      schedule:
        - cron: '0 6 * * *'  # Daily at 6 AM UTC
      workflow_dispatch: {}

    jobs:
      collect:
        runs-on: ubuntu-latest
        steps:
          - name: Pull Copilot usage data
            env:
              GH_TOKEN: ${{ secrets.COPILOT_METRICS_PAT }}
              ENTERPRISE: your-enterprise-slug
            run: |
              DATE=$(date -u +%Y-%m-%d)
              curl -s -L \
                -H "Accept: application/vnd.github+json" \
                -H "Authorization: Bearer $GH_TOKEN" \
                -H "X-GitHub-Api-Version: 2022-11-28" \
                "https://api.github.com/enterprises/$ENTERPRISE/copilot/usage" \
                -o "copilot-usage-${DATE}.ndjson"

          - name: Upload artifact
            uses: actions/upload-artifact@v4
            with:
              name: copilot-metrics-${{ github.run_id }}
              path: copilot-usage-*.ndjson
              retention-days: 90
    ```

=== "Scheduled Script (cron / Task Scheduler)"

    ```bash
    #!/bin/bash
    DATE=$(date -u +%Y-%m-%d)
    OUTDIR="/data/copilot-metrics"
    mkdir -p "$OUTDIR"

    curl -s -L \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer $COPILOT_METRICS_PAT" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      "https://api.github.com/enterprises/$ENTERPRISE/copilot/usage" \
      -o "$OUTDIR/copilot-usage-${DATE}.ndjson"

    echo "[$(date)] Collected metrics for $DATE" >> "$OUTDIR/collection.log"
    ```

    Schedule with cron: `0 6 * * * /path/to/collect-copilot-metrics.sh`

!!! tip "Data Retention"
    The API returns up to 28 days of history. Set up alerting on your job to catch failures before gaps form.

---

## Step 3: Choose a Visualization Tool

| Tool | Best For | Effort | Customization |
|------|----------|--------|---------------|
| **Power BI / Tableau** | Enterprise BI teams | Medium | Full |
| **[copilot-metrics-viewer](https://github.com/github-copilot-resources/copilot-metrics-viewer)** | Quick standalone dashboard | Low | Moderate |
| **Jupyter / Python** | Data science, ad-hoc exploration | Low | Full |
| **Grafana** | Teams already on Grafana | Medium | Full |

All tools ingest NDJSON — pick what your team already knows.

---

## Step 4: Build Your First Dashboard

Include these four panels in your initial dashboard.

#### Panel 1: DAU / WAU / MAU Trend
:material-chart-line: **Line chart** — Daily, 7-day rolling, and 28-day rolling active users. Primary adoption health signal.

#### Panel 2: Acceptance Rate by Language
:material-chart-bar: **Stacked bar** — Acceptance rate per language. Low rates flag training or prompt-quality opportunities.

#### Panel 3: Seat Utilization
:material-gauge: **Gauge / KPI card** — Active ÷ assigned seats (target: 70%). Show inactive seat count (no activity in 30 days).

#### Panel 4: Feature Mix Over Time
:material-chart-timeline-variant: **Stacked area** — Completions, chat, CLI, PR summaries. Broadening mix = deepening adoption.

### Sample Dashboard Layout

```
┌─────────────────────────────────┬──────────────────────┐
│                                 │                      │
│   DAU / WAU / MAU Trend         │  Seat Utilization    │
│   (line chart, full width)      │  (gauge + KPI card)  │
│                                 │                      │
├─────────────────────────────────┼──────────────────────┤
│                                 │                      │
│   Acceptance Rate by Language   │  Feature Mix Over    │
│   (stacked bar chart)           │  Time (stacked area) │
│                                 │                      │
└─────────────────────────────────┴──────────────────────┘
```

---

## Step 5: Map Stakeholders to Metrics

| Stakeholder | Key Metrics | Cadence |
|-------------|-------------|---------|
| **Engineering Managers** | DAU/MAU, acceptance rate, feature mix | Weekly |
| **VP of Engineering** | Seat utilization, adoption trend, cost per active user | Monthly |
| **CFO / Finance** | Seat utilization, cost per active user, inactive seats | Quarterly |
| **CISO / Security** | Policy enablement, allowed/blocked features | Quarterly |
| **Developers** | Personal acceptance rate, language-specific quality | On demand |

!!! tip "Tailor the Message"
    Create filtered views per audience — managers want team detail; finance wants cost efficiency.

---

## Step 6: Establish Reporting Cadence

### :material-calendar-week: Weekly Ops Review (15 min)

**Audience:** Engineering managers, platform team

- DAU trend, acceptance rate changes, new feature adoption
- Action: Address adoption blockers

### :material-calendar-month: Monthly Executive Summary (30 min)

**Audience:** VP of Engineering, department heads

- MoM adoption growth, seat utilization, top 3 wins
- Action: Adjust seat allocation, plan enablement

### :material-calendar-text: Quarterly Business Review (60 min)

**Audience:** CFO, CTO, CISO

- Quarterly trajectory, cost per active user, ROI estimate (hours saved × blended rate), compliance posture
- Action: Budget decisions, policy updates, expansion plans

---

**Result:** Automated daily collection, a four-panel dashboard, stakeholder-aligned reporting from weekly ops to quarterly QBR.

---

## When to Level Up

You've outgrown this playbook when leadership asks **"Is Copilot making us ship faster?"** and you need to correlate usage with DORA metrics or build an ROI narrative for budget renewal.

:material-arrow-right: Move to the [Outcome Correlation Playbook](../impact/outcome-correlation.md).

---

## What to Do Next

- :material-cog: Set up **automated data collection** today
- :material-view-dashboard: Build your **first dashboard** with the four panels above
- :material-account-group: Schedule a **stakeholder alignment meeting** on metrics and cadence
- :material-book-open-variant: Read the [Outcome Correlation Playbook](../impact/outcome-correlation.md) when ready to prove impact
