# Measurement Journey

<div class="section-intro" markdown>

<span class="eyebrow">Start here</span>

## From adoption to impact: a two-phase model

Measuring AI coding agent impact works best as a progression. This toolkit uses an opinionated two-phase model so you can baseline usage first, then connect it to delivery outcomes and ROI without skipping the evidence chain.

1. **[Phase 1 — Adoption](adoption/index.md):** Confirm usage, track engagement, identify enablement gaps.
2. **[Phase 2 — Impact & ROI](impact/index.md):** Correlate usage with delivery outcomes, build an ROI case.

!!! warning "Don't skip Phase 1"
    Jumping to ROI before stable adoption produces misleading results. Baseline usage first.

</div>

---

## Journey Diagram

```mermaid
flowchart TD
    Start([AI Coding Agent Rollout]) --> P1

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

## How-to's on setting up metrics

| How-to | Tools | Effort | Best For |
|--------|-------|:------:|---------|
| 🟢 **[Adoption: Quick Start](adoption/quick-start.md)** | Native dashboards | Low | First visibility into adoption |
| 🟡 **[Adoption: Deeper Analytics](adoption/analytics-ready.md)** | APIs, NDJSON, Power BI | Medium | Custom reporting and BI |
| 🔴 **[Impact: Using Apache DevLake for ROI](impact/apache-devlake.md)** | Apache DevLake (optional) or your existing data stack | High | Prebuilt path to proving engineering impact |

---

## Your Go-to Metrics

| Type | Metric | Phase |
|:----:|--------|:-----:|
| Leading | DAU/WAU growth rate | 1 |
| Leading | Acceptance rate trend | 1 |
| Leading | Agent adoption % | 1 |
| Lagging | PR cycle time delta | 2 |
| Lagging | Deployment frequency delta | 2 |
| Lagging | Time savings (hours/dev/week) | 2 |
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

- :material-rocket-launch: [Start with Adoption](adoption/index.md) if you still need baseline visibility
- :material-chart-scatter-plot: [Move to Impact & ROI](impact/index.md) once adoption is stable
- :material-file-document: [Open Templates](exec-templates/index.md) when you need an executive artifact
