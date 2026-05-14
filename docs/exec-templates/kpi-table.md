# KPI Table Template

**Executive-view metrics dashboard**

---

## Preview

<div class="artifact-preview" markdown>
<iframe
  src="https://view.officeapps.live.com/op/embed.aspx?src=https://devexpgbb.github.io/copilot-metrics-roi-toolkit/exec-templates/artifacts/copilot-kpi-table-template.docx"
  width="100%"
  height="480"
  frameborder="0"
  title="KPI Table Template preview">
</iframe>

[:material-download: Download DOCX](artifacts/copilot-kpi-table-template.docx){ .md-button }
</div>

!!! info "Preview details"
    Preview uses **Microsoft Office Online** and requires an internet connection. Supported types: `.docx`, `.pptx`, `.xlsx`. If the preview does not load, use the download button above.

## How to Use

1. **Copy** this template into your reporting tool (Google Slides, PowerPoint, Confluence, Notion, etc.).
2. **Fill in** the Baseline column with your pre-Copilot or initial measurement values.
3. **Update** the Current column with the latest data from the listed sources.
4. **Set** Target values that align with your organization's goals.
5. **Update** Status and Trend each reporting cycle to show progress at a glance.

**Status legend:** 🟢 On/above target · 🟡 Approaching target · 🔴 Below target or needs attention

**Trend legend:** ↑ Improving · ↓ Declining · → Flat

---

## KPI Dashboard — GitHub Copilot

*Reporting period: [START DATE] — [END DATE]*

| KPI | Definition | Source | Baseline | Current | Target | Status | Trend |
|-----|-----------|--------|----------|---------|--------|--------|-------|
| Seat Utilization | % of assigned seats with activity in 28 days | Usage Dashboard | — | — | >70% | 🔴🟡🟢 | ↑↓→ |
| Monthly Active Users (MAU) | Unique users with activity in 28-day window | Usage Dashboard | — | — | — | 🔴🟡🟢 | ↑↓→ |
| DAU/MAU Ratio | Daily engagement depth (daily actives ÷ monthly actives) | API | — | — | >50% | 🔴🟡🟢 | ↑↓→ |
| Acceptance Rate | Suggestions accepted ÷ suggestions shown | Usage Dashboard | — | — | Track trend | 🔴🟡🟢 | ↑↓→ |
| Chat Engagement | Avg chat requests per active user per day | Usage Dashboard | — | — | Increasing | 🔴🟡🟢 | ↑↓→ |
| Agent Adoption % | % of active users using agent or edit modes | Code Gen Dashboard | — | — | >20% | 🔴🟡🟢 | ↑↓→ |
| Lines Added with AI | Lines of code accepted into editor (28-day window) | Code Gen Dashboard | — | — | Increasing | 🔴🟡🟢 | ↑↓→ |
| PR Cycle Time | Median time from PR open to merge | Apache DevLake / Git analytics | — | — | Decreasing | 🔴🟡🟢 | ↑↓→ |
| Deployment Frequency | Number of production deploys per week | CI/CD + DevLake | — | — | Increasing | 🔴🟡🟢 | ↑↓→ |
| Developer Satisfaction | Average developer survey score (1–5 scale) | Internal survey | — | — | >4.0/5 | 🔴🟡🟢 | ↑↓→ |
| License ROI | (Value Created − License Cost) ÷ License Cost | Calculated | — | — | >200% | 🔴🟡🟢 | ↑↓→ |
| Premium Request Utilization | Premium requests used ÷ included quota | copilot-metrics-tools | — | — | <90% | 🔴🟡🟢 | ↑↓→ |

---

## Notes: Filling In Your Values

### Baseline

- Choose a consistent baseline period (e.g., the month before Copilot rollout, or your first full month of data).
- If no pre-Copilot baseline exists, use your first reporting period as the baseline and track deltas going forward.
- Document the baseline date range: **[BASELINE PERIOD]**

### Current

- Pull current values from the source listed in the table.
- For API-sourced metrics, use the toolkit's export or the GitHub Copilot usage endpoints directly.
- Align the "current" window with your reporting cadence (weekly snapshot, monthly rollup, etc.).

### Targets

- Targets should be set collaboratively with leadership.
- Not every metric needs a hard target — some are "track trend" metrics where directional improvement matters more than a specific number.
- Revisit targets quarterly and adjust as your program matures.

---

## How to Present This

**For executive audiences (CTO, VP Eng, Board):**

- Lead with the top 3–5 KPIs most relevant to their priorities.
- Use status colors to draw attention — green means "no discussion needed," red means "here's what we're doing about it."
- Keep the full table as a backup slide or appendix.

**For operational audiences (engineering managers, platform teams):**

- Show the full table.
- Add sparkline trends or month-over-month deltas if your tooling supports it.
- Pair with qualitative commentary on what's driving changes.

**For procurement/finance audiences:**

- Focus on Seat Utilization, License ROI, and Premium Request Utilization.
- Pair with the [ROI One-Pager](roi-one-pager.md) for investment justification context.
