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
2. **Pick** the 6-8 KPIs that match the decision you need: adoption health, productivity impact, investment value, or scale readiness.
3. **Map** each KPI to one named source of record and one measurement window so leaders know what changed and why.
4. **Set** targets or thresholds before the reporting cycle closes; avoid changing goals after results are known.
5. **Update** Status, Trend, and Commentary each cycle so the table explains both the number and the action.

**Status legend:** 🟢 On/above target · 🟡 Approaching target · 🔴 Below target or needs attention

**Trend legend:** ↑ Improving · ↓ Declining · → Flat

!!! tip "Executive-ready rule"
    Every row should answer: **What changed? Why does it matter? What action are we taking?** If a metric cannot answer those questions, move it to the appendix.

---

## KPI Dashboard — GitHub Copilot

*Reporting period: [START DATE] — [END DATE]*

| KPI | Executive question | Definition | Source of record | Baseline | Current | Target / threshold | Status / trend | Commentary |
|-----|--------------------|------------|------------------|----------|---------|--------------------|----------------|------------|
| Seat Utilization | Are paid licenses being used? | Assigned seats with Copilot activity in the last 28 days ÷ assigned seats | Copilot Usage Dashboard / usage metrics API | [X]% | [Y]% | 🟢 ≥75%; 🟡 60-74%; 🔴 <60% | [🟢/🟡/🔴] [↑/↓/→] | [e.g., enablement focus for teams below 50% active use] |
| Monthly Active Users (MAU) | Is adoption broadening? | Unique users with Copilot activity in the reporting window | Copilot Usage Dashboard / usage metrics API | [X] | [Y] | Trend up quarter over quarter | [🟢/🟡/🔴] [↑/↓/→] | [e.g., growth came from newly onboarded backend teams] |
| DAU/MAU Ratio | Is usage becoming habitual? | Daily active users ÷ monthly active users for the same population | Usage metrics API or BI rollup | [X]% | [Y]% | 🟢 ≥50%; 🟡 35-49%; 🔴 <35% | [🟢/🟡/🔴] [↑/↓/→] | [e.g., run workflow-specific coaching for low-frequency users] |
| Acceptance Rate | Are suggestions relevant enough to use? | Accepted suggestions ÷ shown suggestions for IDE completions | Copilot Usage Dashboard / editor telemetry export | [X]% | [Y]% | Track trend; investigate sustained drops >5 pts | [🟢/🟡/🔴] [↑/↓/→] | [e.g., lower rate may reflect new languages or prompt quality gaps] |
| Chat Engagement | Are developers using Copilot beyond completions? | Chat requests per active user per day or week | Copilot Usage Dashboard / chat metrics export | [X] | [Y] | Increase after enablement; segment by role | [🟢/🟡/🔴] [↑/↓/→] | [e.g., attach examples for test generation, explanation, and migration work] |
| Agent Adoption % | Are teams adopting higher-leverage workflows? | Active users using agent, edit, or multi-file assistance ÷ active users | Code generation dashboard / Copilot feature telemetry | [X]% | [Y]% | 🟢 ≥25%; 🟡 10-24%; 🔴 <10% | [🟢/🟡/🔴] [↑/↓/→] | [e.g., prioritize teams with repeatable modernization or refactoring work] |
| Lines Added with AI | Is Copilot contributing to code throughput? | Accepted AI-generated lines added during the reporting window | Code generation dashboard / usage metrics API | [X] | [Y] | Trend with quality guardrails; avoid using alone | [🟢/🟡/🔴] [↑/↓/→] | [e.g., pair with PR cycle time and change failure rate before claiming impact] |
| PR Cycle Time | Is delivery flow improving? | Median elapsed time from PR open to merge | GitHub API, Apache DevLake, or BI warehouse | [X] hrs | [Y] hrs | 🟢 ≥15% lower than baseline; 🟡 5-14%; 🔴 flat/worse | [🟢/🟡/🔴] [↑/↓/→] | [e.g., faster cycle time in high-adoption teams supports impact story] |
| Deployment Frequency | Is faster development reaching production? | Production deployments per week or month | CI/CD system, Apache DevLake, or DORA dashboard | [X]/wk | [Y]/wk | Increase without higher change failure rate | [🟢/🟡/🔴] [↑/↓/→] | [e.g., report with change failure rate to avoid rewarding unsafe throughput] |
| Developer Satisfaction | Is Copilot improving developer experience? | Average survey score on usefulness, flow, or time saved | Internal pulse survey | [X]/5 | [Y]/5 | 🟢 ≥4.0/5; 🟡 3.5-3.9; 🔴 <3.5 | [🟢/🟡/🔴] [↑/↓/→] | [e.g., cite top verbatim theme, not individual comments] |
| License ROI | Does estimated value exceed cost? | (Estimated value created - license and enablement cost) ÷ cost | ROI model using finance-approved assumptions | [X]% | [Y]% | 🟢 ≥200%; 🟡 100-199%; 🔴 <100% | [🟢/🟡/🔴] [↑/↓/→] | [e.g., separate measured savings from directional productivity signals] |
| Premium Request Utilization | Are advanced features scaled sustainably? | Premium requests used ÷ included or budgeted quota | Copilot admin reporting / billing export | [X]% | [Y]% | 🟢 <75%; 🟡 75-89%; 🔴 ≥90% | [🟢/🟡/🔴] [↑/↓/→] | [e.g., review heavy-use teams before renewal or quota decisions] |

---

## Notes: Filling In Your Values

### Baseline

- Choose a consistent baseline period (e.g., the month before Copilot rollout, or your first full month of data).
- If no pre-Copilot baseline exists, use your first reporting period as the baseline and track deltas going forward.
- Use the same population for baseline and current values whenever possible; if the seat pool changed, note it in Commentary.
- Document the baseline date range: **[BASELINE PERIOD]**

### Current

- Pull current values from the source of record listed in the table.
- For API-sourced metrics, use the toolkit's export or the GitHub Copilot usage endpoints directly.
- Align the "current" window with your reporting cadence (weekly snapshot, monthly rollup, etc.).
- Add the refresh date or data-lag note when a dashboard trails real-time usage.

### Source Mapping

- Use **Copilot dashboards/API** for adoption, engagement, and feature utilization.
- Use **GitHub, DevLake, CI/CD, or BI** for delivery and DORA-style outcomes.
- Use **surveys and finance models** for satisfaction, time savings, and ROI assumptions.
- Name one owner for each source so executives know who can explain variance.

### Targets

- Set thresholds collaboratively with leadership before the period closes.
- Use green/yellow/red bands when a metric has an operational decision tied to it.
- Use "track trend" only when directional improvement matters more than a hard target.
- Revisit targets quarterly and adjust as your program matures.

### Status, Trend, and Commentary

- **Status** compares Current to the Target / threshold for this period.
- **Trend** compares Current to the previous reporting period, not to baseline.
- **Commentary** should be one sentence: driver, implication, or next action.
- Mark a metric yellow when the number is acceptable but the trend needs attention.

---

## How to Present This

**For executive audiences (CTO, VP Eng, Board):**

- Lead with the top 3–5 KPIs most relevant to their priorities.
- Use status colors to draw attention — green means "no discussion needed," red means "here's what we're doing about it."
- Keep the full table as a backup slide or appendix and summarize the decision needed in the first sentence.

**For operational audiences (engineering managers, platform teams):**

- Show the full table.
- Add sparklines or month-over-month deltas if your tooling supports them.
- Pair status changes with the team, language, or workflow driving the movement.

**For procurement/finance audiences:**

- Focus on Seat Utilization, License ROI, and Premium Request Utilization.
- Pair with the [ROI One-Pager](roi-one-pager.md) for investment justification context.

**What to do next:**

- :material-chart-line: Pair this table with the [ROI One-Pager](roi-one-pager.md) when preparing renewal or expansion decisions.
- :material-database: Use [Dashboards & Data Sources](../dashboards-data-sources.md) to confirm where each metric should come from.
