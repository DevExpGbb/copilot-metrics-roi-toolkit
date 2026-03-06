---
title: FAQ & Glossary
icon: material/frequently-asked-questions
---

# FAQ & Glossary

Common questions about GitHub Copilot metrics, followed by a glossary of key terms used throughout this toolkit.

---

## :material-help-circle: Frequently Asked Questions

??? question "1. What's included in Copilot usage metrics?"

    IDE telemetry for **completions**, **chat**, **agent mode**, and **PR lifecycle** events. This requires telemetry to be enabled in the developer's IDE. Metrics capture how developers interact with Copilot features during their coding workflow.

??? question "2. What's NOT included?"

    The following are **not** included in the Usage Metrics API:

    - GitHub.com Chat (web-based Copilot Chat)
    - GitHub Mobile interactions
    - License and seat assignment data

    !!! tip "For seat information"
        Use the [Copilot User Management API](https://docs.github.com/en/enterprise-cloud@latest/rest/copilot/copilot-user-management) for license and seat data.

??? question "3. How fresh is the data?"

    Data is available within **3 full UTC days**. For example, Monday's data will be visible by **Thursday end-of-day UTC**.

    ```
    Monday activity → available Thursday EOD UTC
    Tuesday activity → available Friday EOD UTC
    ```

??? question "4. Can I get user-level data?"

    Yes. Use the **Users 28-day** and **Users 1-day** API endpoints at the **enterprise level**. These provide per-user breakdowns of Copilot usage across all features.

??? question "5. What about organization-level data?"

    Organization-level data is available from **December 12, 2025** onward. It is based on **org membership**, not seat assignment — meaning a user's activity is attributed to the org they belong to.

??? question "6. Does agent mode show in metrics?"

    Yes — agent mode activity appears in:

    - [x] Current **Usage Metrics API**
    - [x] **Code Generation Dashboard**
    - [ ] ~~Legacy Copilot Metrics API~~ (not included)

??? question "7. What's happening to the legacy APIs?"

    | Legacy API | Sunset Date |
    |---|---|
    | User-Level Feature Engagement API | **March 2, 2026** |
    | Copilot Metrics API | **April 2, 2026** |

    !!! warning "Action required"
        Migrate to the **Copilot Usage Metrics API** before these dates. See the [Dashboards & Data Sources](dashboards-data-sources.md) page for migration guidance.

??? question "8. What PAT scopes do I need?"

    === "Classic PATs"

        - `manage_billing:copilot`
        - `read:enterprise`

    === "Fine-grained tokens"

        - **Enterprise Copilot metrics** (read)

??? question "9. How is acceptance rate calculated?"

    **Accepted suggestions ÷ total suggestions shown.**

    !!! info "Important context"
        Developers use Copilot in many ways — research, verification, confirmation, and learning — so **acceptance rate should not be used as a sole productivity metric**. A low acceptance rate does not necessarily mean low value.

??? question "10. Can I compare metrics across organizations?"

    Organization-level metrics are **not deduplicated** across orgs. A user belonging to multiple orgs will appear in each org's metrics independently.

    !!! tip
        **Enterprise-level** endpoints deduplicate users, making them the correct choice for cross-org comparisons.

??? question "11. What IDEs are supported?"

    | IDE | Minimum Version |
    |---|---|
    | VS Code | 1.101+ |
    | JetBrains | 2024.2.6+ |
    | Visual Studio | 17.14.13+ |
    | Eclipse | 4.31+ |
    | Xcode | 13.2.1+ |

??? question "12. How do I measure ROI?"

    See the [Impact & ROI](impact/index.md) page. The key approach:

    1. **Baseline** — capture pre-Copilot metrics
    2. **Measure deltas** — compare post-adoption changes
    3. **Translate to business value** — quantify time savings, quality improvements
    4. **Compare vs license cost** — calculate net ROI

    Use [gh-devlake](https://github.com/DevExpGBB/gh-devlake) for DORA metric correlation.

??? question "13. What is NDJSON?"

    **Newline-Delimited JSON** — one JSON object per line. It is a standard format for streaming data and is used by the Usage Metrics API download responses.

    ```json
    {"user":"alice","date":"2025-01-15","completions":42}
    {"user":"bob","date":"2025-01-15","completions":37}
    ```

??? question "14. How do I handle Premium Request costs?"

    Use [copilot-metrics-tools](https://github.com/tgrall/copilot-metrics-tools) to analyze premium request consumption **by user and model**. Monitor the ratio of included vs. billed requests to stay within budget.

??? question "15. Can I correlate Copilot usage with delivery outcomes?"

    Yes — using **Apache DevLake** via [gh-devlake](https://github.com/DevExpGBB/gh-devlake). This allows you to correlate adoption tiers with:

    - PR cycle time
    - Deployment frequency
    - DORA metrics (lead time, change failure rate, MTTR)

---

## :material-book-alphabet: Glossary

Alphabetical reference of key terms used throughout this toolkit.

Acceptance Rate
:   Ratio of accepted code suggestions to total suggestions shown. Should not be used as the sole productivity metric — developers derive value from Copilot beyond accepted completions.

CFR (Change Failure Rate)
:   Percentage of deployments causing failures in production. One of the four DORA metrics.

DAU (Daily Active Users)
:   Unique users interacting with Copilot on a given day.

DevLake
:   **Apache DevLake** — an open-source dev data platform for normalizing and correlating DevOps metrics from multiple sources (GitHub, Jira, Jenkins, etc.).

DORA
:   **DevOps Research and Assessment** — a framework measuring four key metrics: deployment frequency, lead time for changes, change failure rate, and MTTR.

Grafana
:   Open-source analytics and visualization platform used with DevLake to build dashboards for DORA metrics and Copilot adoption correlation.

LoC (Lines of Code)
:   In this context, lines suggested, added, or deleted by AI. Used in code generation dashboards to quantify Copilot's contribution.

MAU (Monthly Active Users)
:   Unique users interacting with Copilot in a 28-day window.

MTTR (Mean Time to Recovery)
:   Average time from incident detection to resolution. One of the four DORA metrics.

NDJSON (Newline-Delimited JSON)
:   One JSON object per line, used for streaming data. The Usage Metrics API returns data in this format.

PR Cycle Time
:   Duration from pull request creation to merge. A key delivery velocity indicator that can be correlated with Copilot adoption.

Premium Requests
:   Copilot interactions that consume premium model quota beyond the included allocation. Tracked per user and per model.

SPACE
:   **Satisfaction, Performance, Activity, Communication, Efficiency** — Microsoft's developer productivity framework. Provides a holistic lens for measuring developer experience beyond raw output.

WAU (Weekly Active Users)
:   Unique users interacting with Copilot in a 7-day window.
