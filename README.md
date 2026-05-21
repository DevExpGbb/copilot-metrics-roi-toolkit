# AI Coding Agent ROI Toolkit

A comprehensive, docs-first toolkit for measuring AI coding agent adoption and proving ROI. Built for engineering leaders, DevEx teams, FinOps, and platform teams.

## What This Is

This toolkit provides a structured approach to **measuring** the impact of AI coding agents (GitHub Copilot, and other AI-assisted development tools) across two phases:

1. **Adoption** — Who's using AI coding agents, where, and how deeply?
2. **Impact & ROI** — Is it improving delivery outcomes? How do you quantify ROI defensibly?

> **This is not an adoption guide.** It's a measurement guide. It assumes you've rolled out an AI coding agent and now need to prove value.

!!! info "Copilot-first reference module"
    The deepest worked examples (Usage Metrics API, NDJSON export, Apache DevLake `gh-copilot` plugin, premium-request analytics) target **GitHub Copilot** because it has the most mature public telemetry today. The metrics, KPIs, ROI framework, and templates are vendor-neutral and apply to any AI coding agent that exposes equivalent usage data.

## Who It's For

| Audience | What you'll find |
|----------|-----------------|
| **Engineering Leaders** (CTO, VP Eng) | ROI frameworks, executive templates, delivery outcome analysis |
| **DevEx / Platform Teams** | Dashboards, APIs, data pipelines, measurement playbooks |
| **FinOps / Procurement** | Cost analysis, license utilization, ROI one-pagers |
| **AI Tool Admins** (e.g., Copilot, Cursor, Cody admins) | Usage metrics, scope/limitations, API reference |
| **Champions & Analysts** | Tool catalog, BI integrations, dashboard recipes |

## Quick Start

Choose your path based on where you are:

| Path | Description | Start Here |
|------|-------------|------------|
| 🟢 **Quick Start** | Native dashboards, minimal setup | [Quick Start](docs/adoption/quick-start.md) |
| 🟡 **Analytics-Ready** | NDJSON exports + BI tools | [Analytics-Ready](docs/adoption/analytics-ready.md) |
| 🔴 **Using Apache DevLake** | Prebuilt DORA + AI coding tool correlation path; your existing analytics stack can follow the same method | [Using Apache DevLake](docs/impact/apache-devlake.md) |

## Documentation Site

The full toolkit is available as a browsable documentation site:

- Live site: [https://devexpgbb.github.io/copilot-metrics-roi-toolkit/](https://devexpgbb.github.io/copilot-metrics-roi-toolkit/)

```bash
# Local development
pip install mkdocs-material
mkdocs serve
```

Then open [http://localhost:8000](http://localhost:8000).

## What's Inside

```
docs/                    # All documentation content
├── index.md             # Home page
├── measurement-journey  # The 2-phase framework
├── adoption/            # Phase 1: Adoption metrics, playbooks, tools
├── impact/              # Phase 2: Impact, ROI framework, DORA correlation
├── dashboards-data-sources  # Native dashboards, APIs, exports
├── tool-catalog         # 7 tools compared
├── exec-templates/      # Reusable exec artifacts
├── faq-glossary         # Common questions + terms
└── references           # All sources
scripts/                 # Helper scripts for data pulls
data-samples/            # Example NDJSON schemas + mock data
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to update and extend this toolkit.

## License

[MIT](LICENSE)
