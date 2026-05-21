# Impact Metrics Guide

Use Developer Experience signals, delivery outcomes, and business-value measures together to find friction, reduce it, and show whether your AI coding agent is improving the engineering system.

Good Developer Experience measurement does more than correlate DORA metrics. It looks for points of friction in the developer loop, tracks whether they are getting easier to navigate, and then connects those improvements to delivery speed, quality, satisfaction, and business value.

---

## Delivery and Developer Experience Outcomes to Track

| Metric | How an AI Coding Agent May Influence It | How to Measure |
|---|---|---|
| **Developer Satisfaction** | Less friction can improve confidence, flow, and willingness to keep using the tool | Pulse surveys, recurring sentiment questions, qualitative comments |
| **Self-Reported Time Saved / Friction Reduced** | AI assistance can reduce repetitive work, waiting, and context switching | Short developer surveys, recurring pulse checks, retrospective comments |
| **PR Throughput** | More code generated → more PRs | PR creation/merge counts over time |
| **PR Cycle Time** | Faster coding + AI reviews → shorter cycles | Median time open → merge |
| **Time to Merge** | Quicker reviews with AI suggestions | Median review + merge duration |
| **Deployment Frequency** | Faster dev loops → more deploys | Deploys per week/month (DORA) |
| **Change Failure Rate** | AI code may reduce or increase defects | Failed / total deployments (DORA) |
| **MTTR** | Faster debugging → quicker recovery | Mean incident open → resolution (DORA) |

---

## Why Surveys Matter

Surveys highlight friction that telemetry misses: confidence, perceived quality, time lost to repetitive work, and whether developers feel the AI tool is helping them stay in flow. Use them alongside delivery metrics, not instead of them.

!!! info "Developer survey starters"
    Example Microsoft Forms survey links (may require Microsoft 365 access):

    - [Developer survey 1](https://forms.office.com/Pages/ShareFormPage.aspx?id=v4j5cvGGr0GRqy180BHbR34hWRZZ-8pFpBporu7qxHBUNFpSOFZORjNFNEg2OTRFSUlQRTlPNEc4Sy4u&sharetoken=rWoZYGvI2EhPesse1YCv)
    - [Developer survey 2](https://forms.office.com/Pages/ShareFormPage.aspx?id=v4j5cvGGr0GRqy180BHbR34hWRZZ-8pFpBporu7qxHBUOUtRTDBRVlRPS1RCTlM1OFIxWjgyRjE5Uy4u&sharetoken=0Q5OivxWN0pb9Oq9lkDx)
    - [Developer survey 3](https://forms.office.com/Pages/ShareFormPage.aspx?id=v4j5cvGGr0GRqy180BHbR34hWRZZ-8pFpBporu7qxHBUOFBGOVFTMkw0WFBJTUtFQzA5OE85Vk1JVy4u&sharetoken=ukwlljw1HXjO92V9Lmo9)
    - [Developer survey 4](https://forms.office.com/Pages/ShareFormPage.aspx?id=v4j5cvGGr0GRqy180BHbR34hWRZZ-8pFpBporu7qxHBUN1FLNEVTRTJPN0I1U1JVUFkyNjVHWjcyRi4u&sharetoken=u03lk7G9SQoaPlxf6Ckx)

---

## Where This Data Lives

| Data | Source | Typical tools / destinations |
|---|---|---|
| Developer surveys | Microsoft Forms or another internal survey platform | Microsoft Forms, Qualtrics, Google Forms, Culture Amp |
| PR metrics | GitHub API / repository data | GitHub, Apache DevLake, Power BI, Splunk, or another analytics stack |
| Deployments | CI/CD pipeline | GitHub Actions, Jenkins, Apache DevLake, Splunk, or another analytics stack |
| Incidents | Issue tracker | GitHub Issues, Jira, PagerDuty, Splunk, or another analytics stack |
| Copilot usage | Vendor usage telemetry — for example, the **GitHub Copilot Usage Metrics API** / dashboard exports | GitHub native dashboards, Apache DevLake, Power BI, Splunk, or another BI stack |

If you already use Power BI, Splunk, Tableau, or another BI stack, feed your AI tool usage data and your delivery data into that platform and build the views there. If you want a prebuilt open-source path, **Apache DevLake** ingests AI tool usage (currently with a `gh-copilot` plugin for GitHub Copilot), GitHub, and delivery data into a common schema and ships Grafana dashboards for adoption-tier and DORA-style analysis.

→ For native data collection and BI ingestion patterns, see the [Analytics-Ready Playbook](../adoption/analytics-ready.md).

---

## DORA Framework

DORA (DevOps Research and Assessment) provides four key metrics with industry benchmarks:

| DORA Metric | Elite | High | Medium | Low |
|---|---|---|---|---|
| **Deployment Frequency** | On demand | Daily–weekly | Weekly–monthly | Monthly+ |
| **Lead Time for Changes** | < 1 hour | 1 day–1 week | 1–6 months | 6+ months |
| **Change Failure Rate** | < 5% | 5–10% | 10–15% | 15%+ |
| **MTTR** | < 1 hour | < 1 day | 1 day–1 week | 1 week+ |

!!! info
    Apache DevLake includes built-in DORA models and dashboards once deployment patterns and incident labels are configured. Other BI stacks can support the same analysis, but you will define more of the model yourself.

---

## Correlation by Adoption Tier

The most compelling analysis segments teams by AI tool adoption level:

| Tier | Definition | Expected Pattern |
|---|---|---|
| **Low** (<25% active) | Few developers using the AI tool | Baseline-like metrics |
| **Medium** (25-50%) | Moderate adoption | Moderate improvement |
| **High** (50-75%) | Most of team using regularly | Clear improvement |
| **Very High** (>75%) | Near-universal adoption | Strongest improvement |

A visible **gradient** across tiers is stronger evidence than a single before/after comparison.

```
Tier 1 (Low):    PR Cycle Time = 4.5 days
Tier 2 (Medium): PR Cycle Time = 3.2 days  
Tier 3 (High):   PR Cycle Time = 2.4 days
```

---

## Baseline Requirements

| Scenario | Baseline Approach | Minimum Duration |
|---|---|---|
| Pre-rollout data available | Use pre-enablement period | 4-8 weeks |
| AI tool already deployed | Low-adoption teams as control | 4-8 weeks |
| No historical data | Current state = baseline | Measure forward 8 weeks |

!!! tip
    Shorter windows are noisy. Account for confounding variables: team changes, process improvements, seasonal patterns.

Baseline should include at least one short developer survey so you can compare perceived friction and satisfaction over time, not just operational metrics.

---

## Further Reading

- [Shared metrics references](../references.md) - includes the cross-phase GitHub Copilot Metrics PDF with adoption and ROI metrics
- [DORA Research](https://dora.dev/research/)

---

**What to do next:**

- :material-calculator: [ROI Framework](roi-framework.md) to translate metrics into business value
- :material-connection: [Use Apache DevLake](apache-devlake.md) if you want a prebuilt way to collect and correlate this data
