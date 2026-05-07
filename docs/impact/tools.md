# Phase 2: Tools & Resources

Tools for measuring engineering impact and building ROI narratives.

---

## Apache DevLake (with gh-devlake helper)

| | |
|---|---|
| **Setup** | :material-circle-multiple: High — Docker or Azure, multi-tool config |
| **Best for** | Correlating Copilot adoption with DORA delivery metrics |
| **Data** | Full history in Apache DevLake's backing database |
| **Cost** | Free locally (Docker). ~$30-50/mo on Azure |

Apache DevLake is the platform that ingests GitHub, Copilot, and delivery data into a common model and exposes pre-built Grafana dashboards. `gh-devlake` is the CLI helper used to deploy and configure that stack.

Includes pre-built Grafana dashboards:

- **Adoption Dashboard** — DAU/WAU/MAU, acceptance rates, seat effectiveness
- **Impact Dashboard** — Correlates adoption tiers with PR velocity, deployment frequency, CFR, MTTR

```bash
gh extension install DevExpGBB/gh-devlake
gh devlake deploy local --dir ./devlake
cd devlake && docker compose up -d
gh devlake configure full
# Open Grafana at http://localhost:3002
```

[:octicons-arrow-right-24: GitHub Repo](https://github.com/DevExpGBB/gh-devlake) · [:octicons-arrow-right-24: Blog Post](https://devblogs.microsoft.com/all-things-azure/measuring-actual-ai-impact-for-engineering-with-apache-devlake/)

---

## Existing BI stack (Splunk, Power BI, Tableau, and similar)

| | |
|---|---|
| **Setup** | :material-circle-half-full: Medium — requires API ingestion, data modeling, and dashboard design |
| **Best for** | Teams that already standardize on Splunk, Power BI, Tableau, Fabric, or another analytics platform |
| **Data** | Depends on your retained API exports, GitHub data, CI/CD data, incidents, and survey responses |
| **Cost** | Existing platform and licensing costs |

Use the Copilot Usage Metrics API and dashboard exports as the Copilot input, then combine them with GitHub, CI/CD, incident, and survey data in the analytics stack your organization already trusts.

---

## copilot-metrics-tools (Premium Request Usage)

| | |
|---|---|
| **Setup** | :material-circle-half-full: Low — bash script or Next.js app |
| **Best for** | Understanding premium request costs and top consumers |
| **Data** | Point-in-time reports |
| **Cost** | Free |

Analyzes premium request consumption by user and model. Tracks included vs billed requests.

=== "Bash"

    ```bash
    export GITHUB_TOKEN="ghp_..."
    export GITHUB_ENTERPRISE="your-enterprise"
    ./scripts/copilot-report.sh --year 2026 --month 2 > report.json
    ```

=== "Web Dashboard"

    ```bash
    cp .env.local.example .env.local  # edit with your token
    npm install && npm run dev
    # Open http://localhost:3000
    ```

[:octicons-arrow-right-24: GitHub Repo](https://github.com/tgrall/copilot-metrics-tools)

---

## Comparison

| Tool | Focus | Setup | DORA | Cost Analysis |
|------|-------|-------|:----:|:-------------:|
| Apache DevLake | Adoption → Impact correlation | High | **Yes** | No |
| Existing BI stack | Custom dashboards and correlation | Medium | Yes | Possible |
| copilot-metrics-tools | Premium request costs | Low | No | **Yes** |

→ Full catalog including Phase 1 tools: [Tool Catalog](../tool-catalog.md)

---

**What to do next:**

- :material-connection: [Use Apache DevLake](apache-devlake.md) for a prebuilt DORA correlation stack
- :material-chart-bar: Already use Splunk or Power BI? Start with your existing analytics stack and the [Analytics-Ready Playbook](../adoption/analytics-ready.md)
- :material-currency-usd: Run [copilot-metrics-tools](#copilot-metrics-tools-premium-request-usage) to check premium request spend
