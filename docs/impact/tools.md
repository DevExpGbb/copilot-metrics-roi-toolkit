# Phase 2: Tools & Resources

Tools for measuring engineering impact and building ROI narratives.

---

## gh-devlake (DORA + Copilot Correlation)

| | |
|---|---|
| **Setup** | :material-circle-multiple: High — Docker or Azure, multi-tool config |
| **Best for** | Correlating Copilot adoption with DORA delivery metrics |
| **Data** | Full history in DevLake MySQL database |
| **Cost** | Free locally (Docker). ~$30-50/mo on Azure |

Deploys Apache DevLake with GitHub + Copilot plugins. Includes pre-built Grafana dashboards:

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
| gh-devlake | Adoption → Impact correlation | High | **Yes** | No |
| copilot-metrics-tools | Premium request costs | Low | No | **Yes** |

→ Full catalog including Phase 1 tools: [Tool Catalog](../tool-catalog.md)

---

**What to do next:**

- :material-connection: [Use Apache DevLake](apache-devlake.md) for a prebuilt DORA correlation stack
- :material-currency-usd: Run [copilot-metrics-tools](#copilot-metrics-tools-premium-request-usage) to check premium request spend
