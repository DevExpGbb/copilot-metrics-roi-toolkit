# Impact Metrics Guide

Delivery and DORA metrics to correlate with Copilot adoption.

---

## Delivery Outcomes to Track

| Metric | How Copilot May Influence It | How to Measure |
|---|---|---|
| **PR Throughput** | More code generated → more PRs | PR creation/merge counts over time |
| **PR Cycle Time** | Faster coding + AI reviews → shorter cycles | Median time open → merge |
| **Time to Merge** | Quicker reviews with Copilot suggestions | Median review + merge duration |
| **Deployment Frequency** | Faster dev loops → more deploys | Deploys per week/month (DORA) |
| **Change Failure Rate** | AI code may reduce or increase defects | Failed / total deployments (DORA) |
| **MTTR** | Faster debugging → quicker recovery | Mean incident open → resolution (DORA) |

---

## Where This Data Lives

| Data | Source | Tool |
|---|---|---|
| PR metrics | GitHub API / repository data | GitHub, DevLake |
| Deployments | CI/CD pipeline | GitHub Actions, Jenkins, DevLake |
| Incidents | Issue tracker | GitHub Issues, Jira, PagerDuty |
| Copilot usage | Copilot Usage Metrics API | DevLake (gh-copilot plugin) |

The correlation happens when you **join** Copilot adoption data with delivery data — by team, time period, or adoption tier. [gh-devlake](https://github.com/DevExpGBB/gh-devlake) does this automatically.

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
    DevLake implements DORA with built-in benchmarking. Configure deployment patterns and incident labels, and DevLake calculates the metrics automatically.

---

## Correlation by Adoption Tier

The most compelling analysis segments teams by Copilot adoption level:

| Tier | Definition | Expected Pattern |
|---|---|---|
| **Low** (<25% active) | Few developers using Copilot | Baseline-like metrics |
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
| Pre-Copilot data available | Use pre-enablement period | 4-8 weeks |
| Copilot already deployed | Low-adoption teams as control | 4-8 weeks |
| No historical data | Current state = baseline | Measure forward 8 weeks |

!!! tip
    Shorter windows are noisy. Account for confounding variables: team changes, process improvements, seasonal patterns.

---

**What to do next:**

- :material-connection: [Use Apache DevLake](apache-devlake.md) if you want a prebuilt way to collect and join this data
- :material-calculator: [ROI Framework](roi-framework.md) to translate metrics into business value
