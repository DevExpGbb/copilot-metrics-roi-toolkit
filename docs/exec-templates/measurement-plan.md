# Measurement Plan Template

**Define what to measure, how, and when**

---

## How to Use

1. **Copy** this template into your planning tool (Confluence, Notion, Google Docs, etc.).
2. **Work through each section** with your stakeholders — this is as much an alignment tool as a planning tool.
3. **Check boxes** as you complete each item.
4. **Revisit** at the start of each quarter to update targets and adjust methodology.

---

## 1. Stakeholders

*Who cares about this data, and what do they need?*

| Name | Role | What They Care About | Reporting Cadence |
|------|------|---------------------|-------------------|
| [Name] | CTO / VP Eng | ROI, adoption trends, strategic value | Quarterly |
| [Name] | Engineering Manager | Team-level adoption, productivity impact | Monthly |
| [Name] | DevEx / Platform Lead | Engagement depth, enablement effectiveness | Bi-weekly |
| [Name] | Finance / Procurement | License cost, utilization, ROI | Quarterly |
| [Name] | Security / Compliance | Policy compliance, data handling | As needed |

---

## 2. Goals

*What does success look like for your Copilot program?*

- [ ] Achieve >[X]% seat utilization within [Y] months of rollout
- [ ] Demonstrate measurable improvement in at least one DORA metric
- [ ] Achieve developer satisfaction score of >[X]/5 in post-rollout survey
- [ ] Produce a defensible ROI estimate for license renewal decision
- [ ] Identify and enable low-adoption teams with targeted interventions
- [ ] Establish a repeatable measurement and reporting cadence
- [ ] [Add your own goal]
- [ ] [Add your own goal]

---

## 3. Metrics Selected

*What are you measuring, where does the data come from, and who owns it?*

| Metric | Definition | Data Source | Owner | Target | Cadence |
|--------|-----------|-------------|-------|--------|---------|
| Seat Utilization | Active users ÷ assigned seats (28d) | GitHub Usage Dashboard | [Name] | >[X]% | Weekly |
| Monthly Active Users | Unique users with activity in 28d | GitHub API | [Name] | — | Monthly |
| DAU/MAU Ratio | Daily actives ÷ monthly actives | GitHub API | [Name] | >[X]% | Monthly |
| Acceptance Rate | Suggestions accepted ÷ shown | GitHub Usage Dashboard | [Name] | Track trend | Monthly |
| Chat Engagement | Avg chat requests per user per day | GitHub API | [Name] | Increasing | Monthly |
| Agent Adoption | % users using agent/edit modes | Code Gen Dashboard | [Name] | >[X]% | Monthly |
| PR Cycle Time | Median time from PR open to merge | [Git analytics tool] | [Name] | Decreasing | Bi-weekly |
| Deployment Frequency | Deploys per week | [CI/CD tool] | [Name] | Increasing | Monthly |
| Developer Satisfaction | Survey score (1–5) | Internal survey | [Name] | >[X]/5 | Quarterly |
| License ROI | (Value − Cost) ÷ Cost | Calculated | [Name] | >[X]% | Quarterly |
| [Add metric] | [Definition] | [Source] | [Name] | [Target] | [Cadence] |

---

## 4. Data Sources & Access

*Where does your data live, and can you get to it?*

| Source | Access Method | Permissions Needed | Status |
|--------|--------------|-------------------|--------|
| GitHub Usage Dashboard | Browser (admin access) | Org owner or billing manager | ☐ Confirmed ☐ Pending |
| GitHub Copilot API | REST API with PAT or GitHub App | Org owner token scope | ☐ Confirmed ☐ Pending |
| Code Gen Dashboard | Browser (admin access) | Org owner or billing manager | ☐ Confirmed ☐ Pending |
| Git analytics (DevLake, LinearB, etc.) | [Method] | [Permissions] | ☐ Confirmed ☐ Pending |
| CI/CD platform | [Method] | [Permissions] | ☐ Confirmed ☐ Pending |
| Survey tool | [Method] | [Permissions] | ☐ Confirmed ☐ Pending |
| HR / headcount data (for ROI calc) | [Method] | [Permissions] | ☐ Confirmed ☐ Pending |

---

## 5. Tooling

*What tools are you using to collect, process, and report data?*

| Tool | Purpose | Status |
|------|---------|--------|
| copilot-metrics-roi-toolkit | Usage data collection and ROI calculation | ☐ Deployed ☐ Planned ☐ Not needed |
| GitHub Usage Dashboard | Visual usage metrics | ☐ Deployed ☐ Planned ☐ Not needed |
| [DevLake / LinearB / Jellyfish] | DORA metrics, PR analytics | ☐ Deployed ☐ Planned ☐ Not needed |
| [Survey tool, e.g., Google Forms] | Developer satisfaction surveys | ☐ Deployed ☐ Planned ☐ Not needed |
| [BI tool, e.g., Power BI, Looker] | Dashboard and visualization | ☐ Deployed ☐ Planned ☐ Not needed |
| [Scheduling tool, e.g., cron, GitHub Actions] | Automated data collection | ☐ Deployed ☐ Planned ☐ Not needed |

---

## 6. Reporting Cadence

*Who gets what, how often, and in what format?*

| Audience | Format | Frequency | Owner | Distribution Method |
|----------|--------|-----------|-------|-------------------|
| C-Suite / Board | Executive summary (1-page) | Quarterly | [Name] | [Email / Slide deck] |
| VP Eng / Directors | QBR deck | Quarterly | [Name] | [Meeting + deck] |
| Engineering Managers | Dashboard + commentary | Monthly | [Name] | [Slack / Email / Wiki] |
| DevEx / Platform team | Detailed metrics report | Bi-weekly | [Name] | [Wiki / Dashboard] |
| All developers | Adoption highlights | Monthly | [Name] | [Newsletter / Slack] |

---

## 7. Baseline Plan

*Establish your starting point before measuring change.*

| Item | Details |
|------|---------|
| Baseline period | [START DATE] — [END DATE] |
| Baseline type | ☐ Pre-rollout (no Copilot) ☐ Early rollout (first month) |
| Duration | [X] weeks |

**Metrics to baseline:**

- [ ] PR cycle time (median, P75, P90)
- [ ] Deployment frequency (weekly average)
- [ ] Developer satisfaction (pre-rollout survey)
- [ ] Code review turnaround time
- [ ] Time spent on repetitive tasks (survey-based)
- [ ] [Add your own]

**Methodology notes:**

- Use the same data sources and definitions for baseline and ongoing measurement.
- If a pre-rollout baseline is not possible, document why and use the first full month as baseline.
- Consider seasonal effects (holidays, release cycles) when choosing your baseline period.

---

## 8. Success Criteria

*What constitutes success at each phase?*

### Phase 1: Foundation (Months 1–3)

- [ ] Data pipeline is operational and producing consistent data
- [ ] Baseline metrics are documented
- [ ] First report delivered to stakeholders
- [ ] Seat utilization >[X]%
- [ ] At least [X] teams actively using Copilot

### Phase 2: Evidence (Months 4–6)

- [ ] Trend data shows directional improvement in at least [X] metrics
- [ ] Developer satisfaction survey completed with >[X]% response rate
- [ ] First ROI estimate produced and reviewed with finance
- [ ] Low-adoption teams identified and enablement plans created

### Phase 3: Optimization (Months 7–12)

- [ ] ROI estimate refined with [X] months of data
- [ ] Renewal recommendation delivered with supporting evidence
- [ ] Measurement process is repeatable and sustainable
- [ ] Reporting cadence is running on schedule without manual intervention

---

## 9. Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Insufficient API access or permissions | Medium | High | Confirm access early; escalate to org owner if needed |
| Low survey response rate | High | Medium | Keep surveys short (<5 min); incentivize; send reminders |
| Confounding variables (process changes, team changes) | High | Medium | Document concurrent changes; note in caveats |
| Data gaps in DORA metrics | Medium | Medium | Start with available data; plan instrumentation for gaps |
| Stakeholder misalignment on what to measure | Medium | High | Run alignment session before starting; use this template |
| Tool or API changes | Low | Medium | Monitor GitHub changelog; abstract data collection layer |
| [Add your own] | [L/M/H] | [L/M/H] | [Mitigation] |

---

## 10. Owner & Timeline

### RACI

| Activity | Responsible | Accountable | Consulted | Informed |
|----------|------------|-------------|-----------|----------|
| Data collection setup | [Name] | [Name] | [Name] | [Name] |
| Baseline measurement | [Name] | [Name] | [Name] | [Name] |
| Ongoing data collection | [Name] | [Name] | [Name] | [Name] |
| Report creation | [Name] | [Name] | [Name] | [Name] |
| Stakeholder presentation | [Name] | [Name] | [Name] | [Name] |
| Survey design & distribution | [Name] | [Name] | [Name] | [Name] |
| ROI calculation | [Name] | [Name] | [Name] | [Name] |

### Key Milestones

| Milestone | Target Date | Status |
|-----------|-----------|--------|
| Measurement plan approved | [DATE] | ☐ Done ☐ In Progress ☐ Not Started |
| Data access confirmed | [DATE] | ☐ Done ☐ In Progress ☐ Not Started |
| Tooling deployed | [DATE] | ☐ Done ☐ In Progress ☐ Not Started |
| Baseline period complete | [DATE] | ☐ Done ☐ In Progress ☐ Not Started |
| First stakeholder report | [DATE] | ☐ Done ☐ In Progress ☐ Not Started |
| First ROI estimate | [DATE] | ☐ Done ☐ In Progress ☐ Not Started |
| Renewal recommendation | [DATE] | ☐ Done ☐ In Progress ☐ Not Started |
