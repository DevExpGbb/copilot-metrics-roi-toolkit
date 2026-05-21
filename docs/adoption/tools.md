# Phase 1: Tools & Resources

Tools for measuring and visualizing AI coding agent adoption. The current catalog is GitHub Copilot–first because Copilot has the most mature public telemetry; the same patterns (native dashboard → API export → BI dashboard) apply to other vendors that expose comparable data.

---

## Native Usage Metrics Dashboard

| | |
|---|---|
| **Setup** | :material-circle: None — built into GitHub Enterprise Cloud |
| **Best for** | First look at adoption trends |
| **Data** | 28-day rolling window |

Navigate to **Enterprise → Insights → Copilot usage**. Requires "Copilot usage metrics" policy enabled.

[:octicons-arrow-right-24: Documentation](https://docs.github.com/en/copilot/how-tos/administer-copilot/view-usage-and-adoption)

---

## Code Generation Dashboard

| | |
|---|---|
| **Setup** | :material-circle: None — built into GitHub Enterprise Cloud |
| **Best for** | User vs agent code output, language/model breakdown |
| **Data** | 28-day rolling window |

Navigate to **Enterprise → Insights → Code generation**.

[:octicons-arrow-right-24: Documentation](https://docs.github.com/en/enterprise-cloud@latest/copilot/how-tos/administer-copilot/view-code-generation)

---

## Copilot Usage Metrics API + NDJSON Export

| | |
|---|---|
| **Setup** | :material-circle-half-full: Low — PAT + API calls |
| **Best for** | Custom reporting, historical data, BI integration |
| **Data** | Up to 1 year via API |

Create a PAT with `manage_billing:copilot` scope → call enterprise/org endpoints → download NDJSON from signed URLs.

[:octicons-arrow-right-24: API Reference](https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-usage-metrics)

---

## copilot-metrics-viewer

| | |
|---|---|
| **Setup** | :material-circle-half-full: Medium — Node.js app |
| **Best for** | Ready-made web dashboard with team comparison |
| **Data** | Via legacy Copilot Metrics API |

!!! warning "Uses legacy API (sunsetting April 2, 2026). Check repo for updates."

```bash
git clone <repo> && npm install && npm start
```

[:octicons-arrow-right-24: GitHub Repo](https://github.com/github-copilot-resources/copilot-metrics-viewer)

---

## Power BI Adoption Viewer

| | |
|---|---|
| **Setup** | :material-circle-half-full: Medium — Power BI Desktop + NDJSON |
| **Best for** | Organizations already using Power BI |
| **Data** | As much NDJSON as you export |

Export NDJSON → open `.pbix` → update data source → refresh.

[:octicons-arrow-right-24: GitHub Repo](https://github.com/jasonmoodie/copilot-adoption-viewer-power-bi)

---

## Comparison

| Tool | Setup | User-Level | Agent Metrics | Cost |
|------|-------|:----------:|:-------------:|------|
| Native Dashboard | None | No | Yes | Included |
| Code Gen Dashboard | None | No | Yes | Included |
| Usage Metrics API | Low | Yes | Yes | Free |
| copilot-metrics-viewer | Medium | No | No (legacy) | Free |
| Power BI Viewer | Medium | Yes | Yes | Free* |

→ Full catalog including Phase 2 tools: [Tool Catalog](../tool-catalog.md)

---

**What to do next:**

- :material-rocket-launch: Start with the [native dashboard](#native-usage-metrics-dashboard) — zero setup
- :material-chart-timeline-variant: Need custom reports? Set up the [API + NDJSON](#copilot-usage-metrics-api-ndjson-export)
