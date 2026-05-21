# Measurement Plan Template

**Define owners, data readiness, baseline method, and reporting rhythm for Copilot measurement**

---

## Preview

<div class="artifact-preview" markdown>
<iframe
  src="https://view.officeapps.live.com/op/embed.aspx?src=https://devexpgbb.github.io/copilot-metrics-roi-toolkit/exec-templates/artifacts/copilot-measurement-plan-template.docx"
  width="100%"
  height="480"
  frameborder="0"
  title="Measurement Plan Template preview">
</iframe>

[:material-download: Download DOCX](artifacts/copilot-measurement-plan-template.docx){ .md-button }
</div>

!!! info "Preview details"
    Preview uses **Microsoft Office Online** and requires an internet connection. Supported types: `.docx`, `.pptx`, `.xlsx`. If the preview does not load, use the download button above.

## How to Use

1. **Fill the owner and readiness sections first** so the plan has accountable people, not just metrics.
2. **Lock the baseline method** before sharing trends or ROI claims.
3. **Review cadence and risks quarterly** with engineering leadership and finance.

---

## 1. Snapshot and Owners

| Item | Details |
|------|---------|
| Organization / population | [NAME / TEAMS IN SCOPE] |
| Copilot plan and seats | [Business / Enterprise, seat count] |
| Primary business question | [e.g., Is Copilot improving delivery speed enough to justify renewal?] |
| Measurement window | [START DATE] - [END DATE] |
| Executive readout date | [DATE] |
| Renewal / investment decision date | [DATE] |

| Role | Owner | Accountable for |
|------|-------|-----------------|
| Executive sponsor | [Name] | Success criteria, escalations, investment narrative |
| Program owner | [Name] | Plan quality, milestones, stakeholder alignment |
| Copilot admin | [Name] | Policies, dashboard access, seat and usage exports |
| DevEx / platform lead | [Name] | Engineering context, enablement actions, workflow metrics |
| Analytics / BI owner | [Name] | Data pipeline, metric definitions, dashboard QA |
| Finance partner | [Name] | Cost inputs, ROI assumptions, renewal support |

---

## 2. Readiness Checklist

- [ ] Executive sponsor agrees on the top 1-3 questions the program must answer.
- [ ] Copilot usage metrics policy is enabled and dashboard access is confirmed.
- [ ] API credentials or exports are available for repeatable data collection.
- [ ] PR, deployment, review-turnaround, survey, and cost sources are identified.
- [ ] Baseline period, reporting audiences, and first readout date are documented.
- [ ] Low-adoption teams have an enablement follow-up path.
- [ ] Data freshness expectations are understood; Copilot usage data can lag by about 3 full UTC days.

!!! tip "If a box is not checked"
    Record the blocker in this plan before building reports. Do not assume another team will fill the gap later.

---

## 3. KPIs and Data Sources

| Question | KPI or signal | Source | Owner | Decision use |
|----------|---------------|--------|-------|--------------|
| Are seats being used? | Seat utilization, MAU, DAU/MAU | Usage dashboard / API | [Name] | Renewal risk, enablement focus |
| Is adoption deepening? | Acceptance rate, chat engagement, agent/edit mode adoption | Usage + Code Generation dashboards | [Name] | Adoption maturity and training needs |
| Are outcomes improving? | PR cycle time, deployment frequency, review turnaround | Git analytics + CI/CD | [Name] | Delivery impact evidence |
| Are developers seeing value? | Satisfaction score, qualitative themes | Survey / interviews | [Name] | Friction and enablement priorities |
| Is ROI defensible? | Value created, license cost, confidence level | Calculated + finance inputs | [Name] | Renewal or expansion recommendation |

### Data-quality checks

- [ ] Metric definitions, team filters, and time windows are written down.
- [ ] Baseline and ongoing reporting use the same sources and definitions.
- [ ] Known gaps and manual transformations have named owners.

---

## 4. Baseline Method

| Item | Decision |
|------|----------|
| Baseline period | [START DATE] - [END DATE] |
| Duration | [4-8 weeks recommended] |
| Baseline type | [ ] Pre-rollout [ ] Early rollout [ ] First stable month |
| Comparison approach | [ ] Whole program [ ] Pilot vs control [ ] Adoption tiers |
| Metrics included | [Leading indicators + outcome metrics] |
| Anomalies to note | [Holidays, freezes, org changes, process changes] |

Guardrails:

- Use the same population, sources, and definitions for baseline and follow-on reporting.
- Include at least one qualitative input, such as a pulse survey or stakeholder interview.
- If no pre-rollout data exists, document why and use the first stable reporting window as the anchor.

---

## 5. Reporting Cadence and Risks

| Audience | Format | Frequency | Action expected |
|----------|--------|-----------|-----------------|
| Program working group | Dashboard + action log | Weekly / bi-weekly | Clear blockers and assign enablement follow-up |
| Engineering managers | Dashboard + commentary | Monthly | Validate local context and coach low-adoption teams |
| Executive sponsor / VP Eng | KPI table or one-pager | Monthly / quarterly | Adjust goals, approve interventions, track value |
| Finance / procurement | ROI summary | Quarterly | Review cost, value, and renewal assumptions |

| Risk | Mitigation |
|------|------------|
| Missing permissions or disabled metrics policy | Validate access and policy status before the first milestone |
| Weak baseline or inconsistent definitions | Lock definitions and baseline scope in this document |
| Confounding operational changes | Maintain a log of process, staffing, tooling, and release changes |
| Low survey response rate | Keep surveys short and report response rate with results |
| ROI assumptions challenged late | Review cost model with finance before the first quarterly readout |

---

## 6. Milestones and Sign-Off

| Milestone | Target date | Owner | Exit criteria |
|-----------|-------------|-------|---------------|
| Plan approved | [DATE] | [Name] | Owners, questions, and baseline method agreed |
| Data ready | [DATE] | [Name] | Dashboards, exports, and source mappings confirmed |
| Baseline captured | [DATE] | [Name] | Baseline window documented with caveats |
| First executive readout | [DATE] | [Name] | KPI summary shared with next actions |
| First ROI review | [DATE] | [Name] | Finance-reviewed value and cost framing delivered |

Sign-off: Executive sponsor [NAME / DATE] | Program owner [NAME / DATE] | Finance partner [NAME / DATE] | Analytics owner [NAME / DATE]

---

**What to do next:**

- :material-database: Confirm access paths with [Dashboards & Data Sources](../dashboards-data-sources.md)
- :material-table: Turn agreed KPIs into an executive summary with the [KPI Table Template](kpi-table.md)
- :material-file-chart: Package ROI with the [ROI One-Pager Template](roi-one-pager.md)
