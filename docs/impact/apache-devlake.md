# Using Apache DevLake for DORA + Copilot Correlation

**One implementation path for proving engineering impact**

---

This playbook shows one implementation path: deploy **Apache DevLake** with the `gh-devlake` CLI, then use Apache DevLake to ingest Copilot, GitHub, and delivery data into a common model for dashboarding and analysis.

!!! note "One option, not a requirement"
    You do **not** need Apache DevLake to correlate Copilot adoption with delivery outcomes. Use this playbook when you want a prebuilt open-source stack for ingestion, normalization, and dashboards. If you already have another engineering analytics platform, reuse the same baseline, segmentation, and ROI steps with your existing data stack.

!!! info "Decision-maker deck"
    Download the [Apache DevLake decision-maker guide](../assets/devlake-decision-makers-guide.pptx) for a concise overview of DevLake architecture, fit vs. alternatives, cost and ownership tradeoffs, phased adoption guidance, and example Copilot impact dashboards.

---

## Prerequisites

- [x] **Analytics-Ready playbook completed** — automated data collection and dashboards in place
- [x] **Docker** installed locally, or an **Azure subscription** for cloud deployment
- [x] **GitHub PAT** with scopes: `repo`, `read:org`, `manage_billing:copilot`

!!! warning "Time Investment"
    Plan 1–3 days depending on organization size and GitHub project complexity.

---

## Step 1: Deploy Apache DevLake via gh-devlake CLI

Install the `gh-devlake` CLI extension and deploy:

=== "Local (Docker)"

    ```bash
    gh extension install DevExpGBB/gh-devlake
    gh devlake deploy local --dir ./devlake
    ```

    !!! info "System Requirements"
        Requires Docker with at least **4 GB RAM**. Stack includes Apache DevLake, its backing services, and Grafana.

=== "Azure"

    ```bash
    gh extension install DevExpGBB/gh-devlake
    gh devlake deploy azure \
      --resource-group devlake-rg \
      --location eastus
    ```

    !!! tip "Azure Costs"
        ACI typically costs **$2–5/day**. Stop the instance when not in use.

---

## Step 2: Configure the GitHub Connection

```bash
gh devlake configure connection add \
  --plugin github \
  --org my-org
```

You'll be prompted for your PAT. Apache DevLake ingests repositories, PRs, deployments, and commits.

!!! note "Multiple Organizations"
    Repeat for each org. Apache DevLake aggregates data across orgs.

---

## Step 3: Configure the Copilot Connection

```bash
gh devlake configure connection add \
  --plugin gh-copilot \
  --org my-org
```

This configures Apache DevLake's `gh-copilot` plugin to pull daily active users, acceptance rates, feature-level usage, and seat utilization.

---

## Step 4: Add Scopes and Create a Project

```bash
gh devlake configure full
```

This interactive command lists connections, lets you select repositories (start with 3–5 key repos), creates a project, and triggers the initial Apache DevLake sync.

!!! tip "Start Small"
    Pick 3–5 representative repositories with active development. Expand later.

---

## Step 5: Wait for Initial Sync

| Org Size | Repos | Sync Time |
|----------|-------|-----------|
| Small | < 20 | 5–15 min |
| Medium | 20–100 | 15–30 min |
| Large | 100+ | 30–90 min |

```bash
gh devlake status
```

Or check the Config UI at `localhost:4000` (local) or your Azure endpoint.

!!! warning
    Incomplete syncs produce misleading dashboards. Wait for completion.

---

## Step 6: Open Grafana and Review Dashboards

**URL:** `http://localhost:3002` (local) or Azure Grafana endpoint · **Credentials:** admin / admin

Apache DevLake ships Grafana dashboards once the data is synced.

#### Adoption Dashboard

| Panel | Shows |
|-------|-------|
| **Active Users Over Time** | DAU/WAU/MAU trend with adoption tiers |
| **Acceptance Rate Trend** | Suggestion quality perception over time |
| **Feature Usage Mix** | Completions vs. chat vs. CLI vs. PR summaries |
| **Seat Utilization** | Active seats ÷ assigned seats |

#### Impact Dashboard

| Panel | Shows |
|-------|-------|
| **PR Cycle Time by Tier** | Do high-adoption teams merge faster? |
| **Deployment Frequency** | Are high-adoption teams deploying more? |
| **Change Failure Rate** | Is quality maintained as velocity rises? |
| **Code Review Duration** | Are reviews faster with Copilot-assisted code? |

---

## Step 7: Establish a Baseline Period

| Scenario | Baseline Approach |
|----------|-------------------|
| **Pre-Copilot data available** | Use 4–8 weeks before Copilot enablement |
| **Copilot already deployed** | Use low-adoption teams/repos as control group |
| **No historical data** | Set current metrics as baseline; measure over next 8 weeks |

**Metrics to baseline:** median PR cycle time, deployment frequency, change failure rate, code review turnaround.

---

## Step 8: Analyze Correlation Patterns

### PR Cycle Time by Adoption Tier

| Tier | Definition | Expected Pattern |
|------|-----------|-----------------|
| **High** | > 80% daily usage | Shorter PR cycle time |
| **Medium** | 40–80% daily usage | Moderate improvement |
| **Low** | < 40% daily usage | Baseline-like |

Look for high-adoption teams closing PRs **15–30% faster** than low-adoption teams.

### Deployment Frequency

Track deploys/week per tier. Look for a positive trend as adoption increases. Flat frequency + shorter cycle time may indicate more effective batching.

### Change Failure Rate

!!! success "Ideal"
    CFR stays **flat or decreasing** while velocity increases — faster without sacrificing quality.

!!! danger "Red Flag"
    Rising CFR alongside higher velocity — investigate whether reviews or test coverage are being skipped.

### Code Review Duration

Compare median time from PR open → first review for high- vs. low-adoption teams. Hypothesis: Copilot-assisted code follows conventions more consistently, speeding reviews.

---

## Step 9: Build the ROI Narrative

```
ROI = (Time Saved × Blended Developer Rate) - Copilot License Cost
```

1. **Quantify time saved** — e.g., 20% PR cycle time reduction × 500 PRs/month × 2 hrs = 200 hrs saved/month
2. **Apply blended rate** — 200 hrs × $85/hr = $17,000/month recaptured
3. **Subtract license cost** — 200 seats × $19 = $3,800/month
4. **Net ROI** — $17,000 − $3,800 = **$13,200/month**

!!! abstract "ROI One-Pager Template"
    Use the [ROI one-pager template](../exec-templates/roi-one-pager.md) to create a polished executive summary.

!!! warning "Correlation ≠ Causation"
    This analysis identifies **correlations**, not causation. Present findings as *"teams with higher adoption also show improved DORA metrics."* Strengthen claims with controlled rollouts, developer surveys, time-series analysis, and confound analysis.

---

**Result:** A working Apache DevLake environment for correlating Copilot usage with DORA metrics, plus baseline measurements, correlation analysis, and an executive-ready ROI narrative.

---

## What to Do Next

- :material-server: Deploy Apache DevLake and start your **initial data sync** today
- :material-chart-scatter-plot: Identify your **baseline period** and document pre-Copilot metrics
- :material-account-multiple-check: Share the **Impact Dashboard** with your VP of Engineering within 2 weeks
- :material-presentation: Build your **ROI one-pager** using the [template](../exec-templates/roi-one-pager.md)
