# ROI One-Pager Template

**Investment justification narrative**

---

## Preview

<div class="artifact-preview" markdown>
<iframe
  src="https://view.officeapps.live.com/op/embed.aspx?src=https://devexpgbb.github.io/copilot-metrics-roi-toolkit/exec-templates/artifacts/ai-coding-roi-one-pager-template.docx"
  width="100%"
  height="480"
  frameborder="0"
  title="ROI One-Pager Template preview">
</iframe>

[:material-download: Download DOCX](artifacts/ai-coding-roi-one-pager-template.docx){ .md-button }
</div>

!!! info "Preview details"
    Preview uses **Microsoft Office Online** and requires an internet connection. Supported types: `.docx`, `.pptx`, `.xlsx`. If the preview does not load, use the download button above.

## How to Use

1. **Start with one decision** — renewal, expansion, or optimization. The one-pager should make that decision easier, not list every metric you have.
2. **Pick 2-3 value drivers** you can defend with evidence (usually time savings, throughput, and quality). Skip weak claims instead of padding the story.
3. **Use example placeholders as prompts** and replace every bracketed value with your own data, date range, and audience-appropriate wording.
4. **Show a range, not a single heroic number**. Include a conservative/base/upside view or a clear confidence label so finance and procurement reviewers can see how assumptions affect ROI.
5. **Keep it to one page** when you export or present it. Put backup calculations in an appendix, spreadsheet, or supporting slide.

!!! tip "Make the story defensible"
    Anchor each claim to a named source such as AI tool usage data (e.g., GitHub Copilot Usage Metrics API), PR analytics, incident data, or a developer survey. If a value driver is partly estimate-driven, say so directly and downgrade the confidence level instead of implying precision.

---

## 1. Executive Summary

> [ORGANIZATION NAME] invested in [AI CODING AGENT, e.g., GitHub Copilot Enterprise / Cursor Business / Sourcegraph Cody Enterprise] for [NUMBER, e.g., 250] developers beginning [START DATE]. Over a [DURATION, e.g., 6]-month measurement period, we observed [KEY FINDING #1, e.g., 24% lower PR cycle time] and [KEY FINDING #2, e.g., 2.1 hours saved per developer per week]. Using a [CONFIDENCE LEVEL, e.g., moderate-confidence] estimate based on [METHOD, e.g., telemetry + survey + finance-reviewed labor rate], the program is tracking to [ROI OUTCOME, e.g., 180%-260% annual ROI].

**Decision framing:** [Continue / Expand / Optimize] because [one sentence tying the investment decision to the strongest evidence].

---

## 2. Investment

| Item | Details |
|------|---------|
| License type | [AI tool license tier, e.g., GitHub Copilot Business/Enterprise, Cursor Business, Cody Enterprise] |
| Contract scope | [NUMBER, e.g., 250] seats covering [engineering / product / platform teams] |
| License cost assumption | [e.g., $39 per user per month x 12 months] |
| **Annual license cost** | **$[AMOUNT, e.g., 117,000]** |
| Additional program costs | [e.g., $18,000 for enablement, change management, or supporting analytics] |
| **All-in annual cost** | **$[GRAND TOTAL, e.g., 135,000]** |

---

## 3. Baseline Period

| Item | Details |
|------|---------|
| Baseline period | [START DATE] — [END DATE] |
| Measurement period | [START DATE] — [END DATE] |
| Cohort in scope | [e.g., 180 production engineers with active seats] |
| Baseline methodology | [e.g., 6-week pre-rollout average or low-adoption cohort comparison] |
| Comparison note | [e.g., excluded release-freeze weeks and teams in major re-org] |

**Key baseline metrics:**

| Metric | Baseline Value |
|--------|---------------|
| Median PR cycle time | [e.g., 4.8 days] |
| Deployment frequency | [e.g., 9 deploys/month] |
| Developer time spent on repetitive tasks | [e.g., 5.0 hrs/dev/week from survey] |
| Code review turnaround | [e.g., 19 hours] |
| Quality metric | [e.g., 14 Sev2+ incidents/quarter or 22 escaped defects/month] |

---

## 4. Measured Improvements

*Measurement period: [START DATE] — [END DATE]*

| Metric | Baseline | Current | Delta | Evidence basis | Confidence |
|--------|----------|---------|-------|----------------|------------|
| PR cycle time (median) | [e.g., 4.8 days] | [e.g., 3.6 days] | [e.g., -25%] | [e.g., Git analytics across 12 weeks] | [High / Medium / Low] |
| Deployment frequency | [e.g., 9/month] | [e.g., 11/month] | [e.g., +22%] | [e.g., CI/CD release logs] | [High / Medium / Low] |
| Developer time savings | [e.g., 0 baseline] | [e.g., 2.1 hrs/dev/week saved] | [e.g., +2.1 hrs/dev/week] | [e.g., pulse survey of 87 developers] | [High / Medium / Low] |
| Code review turnaround | [e.g., 19 hrs] | [e.g., 14 hrs] | [e.g., -26%] | [e.g., pull request review timestamps] | [High / Medium / Low] |
| Quality improvement | [e.g., 14 Sev2+ incidents/qtr] | [e.g., 10 Sev2+ incidents/qtr] | [e.g., -29%] | [e.g., incident tracker] | [High / Medium / Low] |

**Narrative note:** [Explain in 1-2 sentences why these deltas are relevant to the decision, and name any major confounding factors you already adjusted for.]

---

## 5. Value Translation

| Value driver | Conservative assumption | Example calculation placeholder | Estimated annual value | Confidence |
|-------------|-------------------------|---------------------------------|------------------------|------------|
| Time savings | [e.g., count only 50% of self-reported hours saved] | [[2.1 hrs] x [180 active developers] x [46 working weeks] x [$95 blended rate] x [50% realization]] | $[VALUE] | [High / Medium / Low] |
| Throughput gain | [e.g., include only releases shipped earlier, not every merged PR] | [[6 earlier releases/year] x [$40,000 value per release]] | $[VALUE] | [High / Medium / Low] |
| Quality improvement | [e.g., use only avoided incident cost already recognized by engineering operations] | [[4 avoided incidents/quarter] x [$12,000 per incident] x [4 quarters]] | $[VALUE] | [High / Medium / Low] |
| **Base-case annual value** |  |  | **$[TOTAL VALUE]** | **[Overall confidence]** |

**Blended rate note:** Use fully loaded cost (salary + benefits + overhead), not salary alone. If finance provides a standard internal labor rate, use that instead of inventing your own.

**Procurement note:** If a value driver is directional but not yet finance-validated, keep it in the narrative and exclude it from the base-case total until it is reviewed.

---

## 6. Sensitivity Check

| Scenario | Included value drivers | Estimated annual value | Net value | ROI |
|----------|------------------------|------------------------|-----------|-----|
| Conservative | [e.g., time savings only, discounted for realization] | $[VALUE] | $[NET] | [X]% |
| Base case | [e.g., time savings + quality + limited throughput] | $[VALUE] | $[NET] | [X]% |
| Upside | [e.g., base case plus acceleration benefits] | $[VALUE] | $[NET] | [X]% |

**Recommended number to headline:** [Conservative / Base case] because [brief reason, e.g., it relies only on tracked savings and finance-reviewed assumptions].

---

## 7. Caveats & Methodology

| Item | Details |
|------|---------|
| Data sources | [e.g., AI tool telemetry (GitHub Copilot Usage Metrics API or vendor equivalent), PR analytics, CI/CD logs, incident tracker, developer survey] |
| Measurement period | [START] — [END] |
| Attribution model | [e.g., pre/post comparison, low-vs-high adoption cohort, or survey-supported estimate] |
| Confidence level | [High / Medium / Low, with one sentence explaining why] |
| Confounding factors | [e.g., release process changes, staffing shifts, parallel platform investments] |
| Known limitations | [e.g., survey response rate 62%, no randomized control group, one business unit excluded] |
| Review status | [e.g., finance-reviewed on DATE / pending procurement review] |

**Important:** These are directional financial estimates, not a claim of perfect causal attribution. State what is measured, what is estimated, and where judgment was applied.

---

## 8. Recommendation

- [ ] **Continue** — Maintain current seat count and monitor trends
- [ ] **Expand** — Increase seat count to [TARGET] based on demonstrated value
- [ ] **Optimize** — Maintain seats but focus on adoption enablement for underutilizing teams
- [ ] **Review** — Insufficient evidence to justify current investment; conduct deeper analysis

**Recommended action:** [SELECT ONE AND EXPLAIN IN 1-2 SENTENCES USING THE STRONGEST EVIDENCE, THE HEADLINE ROI SCENARIO, AND ANY APPROVAL NEEDED]

**Next review date:** [DATE]
