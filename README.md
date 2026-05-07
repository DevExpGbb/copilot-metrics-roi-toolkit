# GitHub Copilot Metrics & ROI Toolkit

A comprehensive, docs-first toolkit for measuring GitHub Copilot adoption and proving ROI. Built for engineering leaders, DevEx teams, FinOps, and platform teams.

## What This Is

This toolkit provides a structured approach to **measuring** GitHub Copilot's impact across two phases:

1. **Adoption** — Who's using Copilot, where, and how deeply?
2. **Impact & ROI** — Is it improving delivery outcomes? How do you quantify ROI defensibly?

> **This is not an adoption guide.** It's a measurement guide. It assumes you've rolled out Copilot and now need to prove value.

## Who It's For

| Audience | What you'll find |
|----------|-----------------|
| **Engineering Leaders** (CTO, VP Eng) | ROI frameworks, executive templates, outcome correlation |
| **DevEx / Platform Teams** | Dashboards, APIs, data pipelines, measurement playbooks |
| **FinOps / Procurement** | Cost analysis, license utilization, ROI one-pagers |
| **Copilot Admins** | Usage metrics, scope/limitations, API reference |
| **Champions & Analysts** | Tool catalog, BI integrations, dashboard recipes |

## Quick Start

Choose your path based on where you are:

| Path | Description | Start Here |
|------|-------------|------------|
| 🟢 **Quick Start** | Native dashboards, minimal setup | [Quick Start](docs/adoption/quick-start.md) |
| 🟡 **Analytics-Ready** | NDJSON exports + BI tools | [Analytics-Ready](docs/adoption/analytics-ready.md) |
| 🔴 **Outcome Correlation** | DORA + Copilot correlation; Apache DevLake is one implementation path | [Using Apache DevLake](docs/impact/apache-devlake.md) |

## Documentation Site

The full toolkit is available as a browsable documentation site:

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
