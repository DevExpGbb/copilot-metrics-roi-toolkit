# Adoption Metrics Guide

Definitions, scope, and interpretation for Phase 1 metrics.

Use this page to answer four questions:

| Question | Primary metrics |
|---|---|
| **Reach** - how many licensed users are active? | DAU, WAU, MAU, seat utilization |
| **Depth** - are users moving beyond simple completions? | Feature mix, chat requests per user, agent adoption % |
| **Quality** - are suggestions useful enough to keep trust? | Acceptance rate, lines added with AI |
| **Context** - where is adoption strongest or weakest? | IDE, language, and model distribution |

---

## Metric Definitions

| Metric | What it measures | How to use it | Scope |
|---|---|---|---|
| **DAU** | Unique users interacting with Copilot on a given day | Best weekly operating signal for day-to-day adoption momentum | Enterprise, Org |
| **WAU** | Unique users in a 7-day rolling window | Use with DAU to see whether usage is habitual vs. occasional | Enterprise, Org |
| **MAU** | Unique users in a 28-day rolling window | Best high-level view of sustained adoption | Enterprise, Org |
| **Seat Utilization** | Active users divided by assigned seats | Flags over-licensing or inactive cohorts that need enablement | Enterprise, Org |
| **Acceptance Rate** | Accepted suggestions divided by suggestions shown | Best proxy for suggestion relevance and developer trust | Enterprise, Org, User |
| **Chat Requests / User** | Average chat interactions per active user | Shows whether users are moving from completions into conversational workflows | Enterprise, Org |
| **Agent Adoption %** | Share of active users using agent or edit modes | Good signal that teams are exploring more advanced Copilot workflows | Enterprise, Org |
| **Feature Mix** | Usage split across completions, chat, CLI, PR summaries, and agent workflows | Use to tell whether adoption is broadening or stuck in one mode | Enterprise, Org |
| **Lines Added with AI** | Lines accepted into the editor from suggestions | Useful output-volume indicator, but not a productivity metric on its own | Enterprise, Org |
| **IDE Distribution** | Usage breakdown by editor | Helps identify unsupported or under-configured IDE cohorts | Enterprise, Org |
| **Language Distribution** | Usage breakdown by programming language | Helps spot where Copilot is most relevant or least trusted | Enterprise, Org |
| **Model Distribution** | Usage breakdown by AI model | Useful for change management when model usage shifts after policy or feature changes | Enterprise, Org |

!!! tip "Interpretation heuristics"
    - Acceptance rate of **25-35%** is common, but the trend matters more than the number.
    - A **DAU/MAU ratio above 50%** usually indicates repeat usage; **60%+** is a strong Phase 2 readiness signal.
    - **Seat utilization above 70%** is generally healthy. Lower rates usually mean licensing or enablement cleanup is needed.
    - Rising **feature mix breadth** is often a stronger adoption signal than lines added alone.

---

## How to Read the Native Dashboards

| Dashboard | Review each week | Why it matters |
|---|---|---|
| **Usage & Adoption** | DAU, WAU, MAU, seat utilization, feature mix | Tells you whether Copilot is spreading and becoming routine |
| **Code Generation** | Agent adoption, lines added with AI, model and language mix | Tells you how deeply developers are using more advanced flows |

### Weekly review sequence

1. **Check active users first** - Is DAU or WAU moving in the right direction?
2. **Check quality next** - Is acceptance rate stable or improving?
3. **Check breadth** - Are more users trying chat, CLI, or agent workflows?
4. **Check breakdowns** - Are low-adoption pockets concentrated in one IDE, language, or team?

!!! info "Good operating rhythm"
    Review leading indicators weekly, then summarize lagging indicators monthly for leadership.

---

## Diagnosing Adoption Patterns

| Pattern | What it usually means | Action |
|---|---|---|
| **Low DAU + many assigned seats** | Enablement or licensing gap | Run onboarding, reclaim inactive seats, confirm extension rollout |
| **High DAU + low acceptance** | Suggestions are visible but not trusted | Review language coverage, coding patterns, and prompt habits |
| **High acceptance + low chat / agent usage** | Teams use Copilot only for inline completions | Promote chat, edit, and multi-step workflows |
| **Strong usage in one IDE, weak in another** | Platform friction | Audit IDE versions, extension deployment, and policy support |
| **Healthy MAU + weak DAU/MAU ratio** | Lots of trial, limited habit formation | Focus on weekly use cases and team-level champions |
| **High lines added + flat feature mix** | Output volume is growing, but workflow depth is not | Pair enablement with examples beyond code completion |

---

## Scope, Freshness, and Limitations

!!! warning "What IS included"
    IDE telemetry for completions, chat, agent mode, and PR-related workflows. **Users must have telemetry enabled.**

!!! danger "What is NOT included"
    - Copilot Chat on GitHub.com
    - GitHub Mobile activity
    - License or seat assignment administration data (use the [Copilot User Management API](https://docs.github.com/en/rest/copilot/copilot-user-management))

!!! info "Freshness and time windows"
    - New activity usually appears within a few hours, but historical data can take up to **24 hours** to populate.
    - **WAU** is a rolling 7-day view and **MAU** is a rolling 28-day view - they will move more slowly than DAU.
    - If you need retention beyond the native API window, set up daily exports or automated collection.

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

- **Org-level** metrics are based on org membership, not seat assignment. A user can appear in multiple orgs.
- **Enterprise-level** metrics deduplicate users across orgs.
- **Org-level data** is available from **December 12, 2025** onward.
- **Double-counting is expected** when you sum org totals across an enterprise with shared users.

!!! warning "Do not compare unmatched scopes"
    Enterprise MAU and the sum of org MAUs are answering different questions. Use one scope consistently in executive reporting.

---

## Leading vs Lagging Indicators

| Type | Metric | Best use |
|---|---|---|
| **Leading** | DAU/WAU growth | Weekly adoption operations |
| **Leading** | Acceptance rate trend | Detect trust or quality issues early |
| **Leading** | Agent adoption % | Track advanced workflow uptake |
| **Leading** | Feature mix breadth | Confirm adoption is deepening |
| **Lagging** | MAU (28-day) | Monthly or quarterly adoption summaries |
| **Lagging** | Seat utilization trend | License optimization and renewal discussions |
| **Lagging** | Lines added with AI | Output volume context for exec narratives |

!!! tip
    Use leading indicators for team actions and lagging indicators for monthly or quarterly business reviews.

---

## Common Analysis Mistakes

- Treating **acceptance rate** as a leaderboard instead of a trend signal
- Comparing **lines added** across languages with very different coding styles
- Declaring ROI from **adoption metrics alone** before adding delivery outcomes
- Ignoring **feature mix** and focusing only on active-user counts
- Summing org metrics across an enterprise and assuming the result is deduplicated

---

## Further Reading

- [GitHub Copilot Metrics PDF](../assets/GitHub_Copilot_Metrics.pdf) - repo-hosted reference PDF courtesy of **Warren Joubert** (Microsoft, Senior Software Solutions Engineer)
- [GitHub Copilot usage metrics concepts](https://docs.github.com/en/copilot/concepts/copilot-usage-metrics/copilot-metrics)
- [View usage and adoption](https://docs.github.com/en/copilot/how-tos/administer-copilot/view-usage-and-adoption)
- [Interpret Copilot metrics](https://docs.github.com/en/copilot/reference/interpret-copilot-metrics)
- [View code generation metrics](https://docs.github.com/en/enterprise-cloud@latest/copilot/how-tos/administer-copilot/view-code-generation)
- [References](../references.md)

---

**What to do next:**

- :material-checkbox-marked: Audit IDE versions and telemetry coverage before judging low adoption
- :material-chart-bar: Set up a dashboard separating weekly leading indicators from monthly lagging indicators
- :material-arrow-right: [Quick Start](quick-start.md) to get your first dashboard running
