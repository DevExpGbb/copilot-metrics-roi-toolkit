# Adoption Metrics Guide

Definitions, scope, and interpretation for Phase 1 metrics.

---

## Metric Definitions

| Metric | Definition | Source | Scope |
|---|---|---|---|
| **DAU** | Unique users interacting with Copilot on a given day | Usage Metrics API / Dashboard | Enterprise, Org |
| **WAU** | Unique users in a 7-day rolling window | Usage Metrics API / Dashboard | Enterprise, Org |
| **MAU** | Unique users in a 28-day rolling window | Usage Metrics API / Dashboard | Enterprise, Org |
| **Acceptance Rate** | Accepted suggestions / total suggestions shown | Usage Metrics API / Dashboard | Enterprise, Org, User |
| **Chat Requests / User** | Average chat interactions per active user | Usage Metrics API / Dashboard | Enterprise, Org |
| **Agent Adoption %** | Users using agent or edit modes | Code Generation Dashboard | Enterprise, Org |
| **Lines Added with AI** | Lines accepted into editor from suggestions | Code Generation Dashboard | Enterprise, Org |
| **IDE Distribution** | Usage breakdown by editor | Usage Metrics API / Dashboard | Enterprise, Org |
| **Language Distribution** | Usage breakdown by programming language | Usage Metrics API / Dashboard | Enterprise, Org |
| **Model Distribution** | Usage breakdown by AI model | Usage Metrics API / Dashboard | Enterprise, Org |

!!! tip "Interpretation"
    - Acceptance rate: 25-35% is typical. Focus on **trends**, not absolutes.
    - DAU/MAU ratio >50% indicates habitual usage.
    - Agent adoption >20% signals advanced feature uptake.

---

## Diagnosing Adoption Patterns

| Pattern | Signal | Action |
|---|---|---|
| Low DAU + seats assigned | Enablement gap | Training, awareness, onboarding |
| High DAU + low acceptance | Suggestion quality mismatch | Prompt engineering workshops, language coverage review |
| High acceptance + no chat usage | Completions-only | Promote chat and agent workflows |
| Uneven IDE distribution | Platform friction | Audit IDE versions, extension availability |

---

## Scope & Limitations

!!! warning "What IS included"
    IDE telemetry: completions, chat, agent mode, PR lifecycle. **Users must have telemetry enabled.**

!!! danger "What is NOT included"
    - Copilot Chat on GitHub.com
    - GitHub Mobile activity
    - License/seat management data (use [Copilot User Management API](https://docs.github.com/en/rest/copilot/copilot-user-management))

!!! info "Minimum IDE Versions"
    | IDE | Minimum Version |
    |---|---|
    | VS Code | 1.101+ |
    | JetBrains | 2024.2.6+ |
    | Visual Studio | 17.14.13+ |
    | Eclipse | 4.31+ |
    | Xcode | 13.2.1+ |

---

## Attribution Rules

- **Org-level**: Based on membership, not seat assignment. Users appear in ALL orgs they belong to.
- **Enterprise-level**: Deduplicates users across orgs.
- **Org-level data**: Available from December 12, 2025 onward.
- **Double-counting**: Sum of org MAUs > enterprise MAU when users span orgs.

---

## Leading vs Lagging Indicators

| Type | Metric | Predicts/Confirms |
|---|---|---|
| **Leading** | DAU/WAU growth | Adoption momentum |
| **Leading** | Acceptance rate trend | Suggestion trust |
| **Leading** | Agent adoption % | Advanced uptake |
| **Lagging** | MAU (28-day) | Sustained adoption |
| **Lagging** | Lines added (monthly) | AI output volume |

!!! tip
    Use leading indicators for weekly ops decisions. Use lagging for quarterly executive reports.

---

**What to do next:**

- :material-checkbox-marked: Audit IDE versions against minimums above
- :material-chart-bar: Set up a dashboard separating leading vs lagging metrics
- :material-arrow-right: [Quick Start](quick-start.md) to get your first dashboard running
