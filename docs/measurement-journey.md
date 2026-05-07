# Measurement Journey

## From adoption to impact: a two-phase model

Measuring Copilot requires a deliberate progression. This toolkit follows an opinionated two-phase model:

1. **[Phase 1 — Adoption](adoption/index.md):** Confirm usage, track engagement, identify enablement gaps.
2. **[Phase 2 — Impact & ROI](impact/index.md):** Correlate usage with delivery outcomes, build an ROI case.

!!! warning "Don't skip Phase 1"
    Jumping to ROI before stable adoption produces misleading results. Baseline usage first.

---

## Journey Diagram

```mermaid
flowchart TD
    Start([Copilot Rollout]) --> P1

    subgraph P1 [Phase 1 — Adoption]
        A1[Enable & track] --> A2{Adoption stable?}
        A2 -- No --> A3[Enablement plays] --> A1
    end

    subgraph P2 [Phase 2 — Impact & ROI]
        B1[Baseline DORA] --> B2[Measure deltas] --> B3[Calculate ROI]
    end

    A2 -- Yes --> P2
    P2 --> FB[Feedback Loop → Phase 1]

    style P1 fill:#d1ecf1,stroke:#0c5460
    style P2 fill:#d4edda,stroke:#155724
```

---

## Three Maturity Paths

| Path | Tools | Effort | Best For |
|------|-------|:------:|---------|
| 🟢 **Quick Start** | Native dashboards | Low | First visibility into adoption |
| 🟡 **Analytics-Ready** | APIs, NDJSON, Power BI | Medium | Custom reporting and BI |
| 🔴 **Using Apache DevLake** | Apache DevLake (optional) or your existing data stack | High | Prebuilt path to proving engineering impact |

---

## Leading vs Lagging Indicators

| Type | Metric | Phase |
|:----:|--------|:-----:|
| Leading | DAU/WAU growth rate | 1 |
| Leading | Acceptance rate trend | 1 |
| Leading | Agent adoption % | 1 |
| Lagging | PR cycle time delta | 2 |
| Lagging | Deployment frequency delta | 2 |
| Lagging | ROI ratio | 2 |

!!! tip
    Track both simultaneously. A drop in leading indicators foreshadows future outcome regression.

---

## Phase Transition Signals

Move from Phase 1 → Phase 2 when:

| Signal | Threshold |
|--------|-----------|
| DAU/WAU ratio | ≥ 60% of seats active weekly |
| Acceptance rate | Stable for 4+ weeks |
| Feature breadth | ≥ 2 features used by >50% of users |
| Elapsed time | ≥ 30 days since enablement |

!!! info "Additive, not a switch"
    You don't stop Phase 1 when entering Phase 2. You add outcome metrics on top.

---

**What to do next:**

- :material-rocket-launch: [Start Phase 1](adoption/index.md) if you're early in your journey
- :material-chart-scatter-plot: [Start Phase 2](impact/index.md) if adoption is stable
- :material-tools: [Browse the Tool Catalog](tool-catalog.md) to pick your tools
