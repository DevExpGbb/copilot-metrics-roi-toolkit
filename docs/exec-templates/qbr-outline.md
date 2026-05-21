# QBR Outline Template

**Quarterly executive deck skeleton**

---

## Preview

<div class="artifact-preview" markdown>
<iframe
  src="https://view.officeapps.live.com/op/embed.aspx?src=https://devexpgbb.github.io/copilot-metrics-roi-toolkit/exec-templates/artifacts/ai-coding-qbr-outline-template.pptx"
  width="100%"
  height="480"
  frameborder="0"
  title="QBR Outline Template preview">
</iframe>

[:material-download: Download PPTX](artifacts/ai-coding-qbr-outline-template.pptx){ .md-button }
</div>

!!! info "Preview details"
    Preview uses **Microsoft Office Online** and requires an internet connection. Supported types: `.docx`, `.pptx`, `.xlsx`. If the preview does not load, use the download button above.

## How to Use

1. **Copy** this deck structure into your presentation tool and keep the slide order unless your audience only needs the trimmed variant.
2. **Replace** every placeholder with one reporting period, one baseline, and one owner so the story stays internally consistent.
3. **Lead** with outcomes, not tooling details: adoption explains reach, engagement explains quality, impact explains delivery evidence, and ROI explains business value.
4. **Show** one visual anchor per slide: a chart, stat card cluster, quote card, heatmap, or roadmap graphic.
5. **Trim** appendix and detail slides aggressively for executive audiences; keep backup material in speaker notes or appendix.

---

## Recommended Deck Arc

| Slide | What leadership should learn | Evidence type |
|-------|-------------------------------|---------------|
| Cover | What quarter, scope, and audience this review covers | Reporting period + owner |
| Executive Summary | What changed, why it matters, what happens next | Three headlines |
| Adoption Snapshot | Whether coverage and usage breadth are healthy | Utilization + active usage trends |
| Engagement Quality | Whether usage is deep enough to matter | Feature mix + stickiness signals |
| Impact Evidence | Whether engineering outcomes moved | Delivery metrics + cohort comparisons |
| ROI Summary | Whether the value case is credible | Cost, value, net, ROI |
| Proof Points | Whether the numbers match lived experience | Quotes + team stories |
| Risks & Actions | What could slow momentum | Issues, owners, mitigations |
| Next-Quarter Plan | What you will improve next | Targets, initiatives, dates |
| Appendix *(optional)* | How the metrics were sourced and caveated | Data sources + limitations |

---

## Cover Slide

**Purpose:** Frame the reporting period, scope, and business context in one glance.

| Element | Fill-in guidance | Example |
|---------|------------------|---------|
| Review title | Use quarter + program name | **AI Coding Agent QBR - Q3 FY26** |
| Scope line | Name the covered population | `420 licensed developers across product engineering` |
| Executive subtitle | State the business theme, not the tooling theme | `From broad adoption to measurable delivery impact` |
| Presenter line | Include accountable owner and review date | `Prepared by DevEx and Platform Engineering - 15 Oct 2026` |

**Visual direction:** Dark title slide with one dominant headline, a short subtitle, and a single supporting motif such as a utilization sparkline, muted grid, or three small KPI chips.

**Bridge to next slide:** *"The next slide answers the only question executives care about first: what improved, what is still at risk, and what we will do next."*

---

## Slide 1: Executive Summary

**Purpose:** Give leaders the quarter in 60 seconds.

| Summary block | Fill-in guidance | Example language |
|---------------|------------------|------------------|
| Adoption headline | Lead with reach and trend | `Seat utilization reached 78%, up 16 points quarter over quarter.` |
| Outcome headline | Tie usage to a delivery or quality signal | `High-adoption teams merged pull requests 19% faster than low-adoption teams.` |
| Focus headline | Name the gap and response | `Agent-mode adoption remains low at 14%; targeted enablement starts next month.` |
| Decision ask | End with one executive ask or endorsement | `Approve continued rollout plus focused enablement for three under-engaged orgs.` |

**Visual direction:** Three large stat cards across the slide plus a narrow footer strip for the decision ask.

**Presenter note:** Keep this slide declarative. Do not explain methods here; save proof for later slides.

**Bridge to next slide:** *"If the summary sounds strong, the next question is whether adoption is broad and durable across the population."*

---

## Slide 2: Adoption Snapshot

**Purpose:** Show whether AI coding agent usage is broad enough to justify continued investment.

| KPI | What to show | Why it matters |
|-----|--------------|----------------|
| Seat utilization | Current quarter, prior quarter, delta | Reveals coverage and license hygiene |
| Monthly active users | Current quarter, prior quarter, delta | Shows whether assigned seats translate to real use |
| DAU/MAU ratio | Current quarter, prior quarter, delta | Indicates repeat usage rather than trial behavior |
| Acceptance rate | Current quarter, prior quarter, delta | Shows suggestion usefulness and workflow fit |
| Chat engagement | Average requests per active user | Highlights whether usage is broad but shallow or broad and deep |

**Commentary prompt:** Explain the two most important movements, what caused them, and whether the change is durable or seasonal.

**Executive headline example:** *"Adoption is no longer the bottleneck: coverage is healthy, and repeat usage rose alongside acceptance quality."*

**Visual direction:** One trend chart for utilization and active users, plus a compact KPI table or stat row for supporting metrics.

**Bridge to next slide:** *"Coverage alone is not enough; the next slide shows whether developers are using the higher-value capabilities that tend to correlate with stronger outcomes."*

---

## Slide 3: Engagement Quality

**Purpose:** Show how people are using the AI coding agent, not just whether they opened it.

| Lens | Fill-in guidance | Example insight |
|------|------------------|-----------------|
| Feature mix | Break out completions, chat, edits/agents, PR review help | `Chat and edit-mode usage grew faster than raw completions, suggesting deeper workflow integration.` |
| Top languages | Show accepted suggestions and acceptance rate by language | `TypeScript and Python drive most accepted suggestions; Java remains an enablement opportunity.` |
| IDE distribution | Show active users by editor family | `JetBrains adoption improved after plugin rollout; Visual Studio remains stable.` |
| Agent or edit trend | Show the last 3-4 months | `Agent usage doubled from 7% to 14% of active users after pilot training.` |

**Commentary prompt:** Call out one behavior that signals maturity and one behavior that signals under-realized value.

**Visual direction:** Use a 2x2 layout: feature-mix chart, language table, IDE split, and a small line chart for agent adoption.

**Bridge to next slide:** *"This is the point where the audience asks whether deeper engagement changed engineering outcomes; answer that directly on the next slide."*

---

## Slide 4: Impact Evidence

**Purpose:** Connect adoption and engagement to delivery outcomes with honest confidence levels.

| Metric | Baseline prompt | Current prompt | Confidence prompt |
|--------|-----------------|----------------|-------------------|
| PR cycle time | Use a pre-rollout or prior-quarter baseline | Show current median or p75 | Rate confidence based on data quality and competing changes |
| Deployment frequency | Keep the same team cohort as baseline | Show current weekly or monthly rate | Mark low confidence if release process changed materially |
| Time to first review | Use the same PR population | Show current review turnaround | Note if team mix changed |
| Change failure rate | Use the same service set | Show current rate | Call out where the signal is directional, not causal |

**Cohort analysis prompt:** Compare high-, medium-, and low-adoption teams to show directional correlation without overstating causality.

**Executive headline example:** *"The strongest evidence of impact is faster review and merge flow among teams that combine high utilization with heavier chat and edit-mode usage."*

**Visual direction:** Left side for a comparison table or bars, right side for a short narrative callout on what the evidence does and does not prove.

**Bridge to next slide:** *"Once the delivery signal is clear, translate it into the business lens executives will use to judge the program: value versus cost."*

---

## Slide 5: ROI Summary

**Purpose:** Turn engineering improvement signals into a defensible financial story.

| ROI block | Fill-in guidance | Example |
|-----------|------------------|---------|
| Quarterly cost | Use the actual seat count and pricing basis | `$31,500 in quarterly license cost` |
| Estimated value created | Sum only the value drivers you can defend | `$118,000 in modeled quarterly value` |
| Net value | Subtract cost from estimated value | `$86,500 net value this quarter` |
| Annualized ROI | Annualize carefully and label assumptions | `275% annualized ROI based on current run rate` |

**Value-driver prompt:** Break value into 2-4 drivers such as developer time saved, throughput improvement, incident avoidance, or reduced review latency.

**Method note:** Link back to the [ROI One-Pager](roi-one-pager.md) for calculation detail rather than overloading this slide.

**Visual direction:** One oversized ROI number, two supporting mini-cards for cost and value, and a short driver table beneath them.

**Bridge to next slide:** *"Numbers land better when they sound true to the people closest to the work; bring in proof points from teams on the next slide."*

---

## Slide 6: Proof Points and Success Stories

**Purpose:** Make the program credible with team-level examples that sound like lived experience, not marketing copy.

| Story element | Fill-in guidance | Example |
|---------------|------------------|---------|
| Team or persona | Choose 2-3 varied examples | `Payments platform team`, `Frontend guild lead`, `New hire cohort` |
| Situation | Name the workflow or pain point | `Large API migrations and repetitive test updates` |
| Result | Tie to a measurable or observable change | `Review-ready pull requests now land one day sooner` |
| Quote | Use plainspoken, attributable language | `"Copilot is most valuable when we use chat and edits together during refactors."` |

**Collection prompt:** Prefer short quotes from surveys, retrospectives, office hours, or manager interviews collected during the same quarter.

**Visual direction:** Two quote cards plus one compact proof-point card with a metric, team name, and before/after comparison.

**Bridge to next slide:** *"Credibility also requires acknowledging what is not working yet and how you are handling it."*

---

## Slide 7: Risks and Blockers

**Purpose:** Show disciplined program management, not just optimistic reporting.

| Risk area | What to include | Example |
|-----------|-----------------|---------|
| Low adoption pockets | Name the org or workflow lagging | `Security engineering remains below 35% seat utilization.` |
| Capability gap | Note missing behaviors such as low chat or agent usage | `High completion use but weak chat/edit usage limits deeper workflow gains.` |
| Data limitation | Identify evidence gaps | `No team-level satisfaction pulse this quarter; survey refresh scheduled next month.` |
| Policy or change-management issue | Note compliance, enablement, or tool friction | `Restricted network policy slows extension rollout in one business unit.` |

**Action prompt:** Every risk should show current status, owner, mitigation, and the point at which leadership should intervene.

**Visual direction:** Risk heatmap or status table with strong status colors and one action-owner column.

**Bridge to next slide:** *"Close by showing the concrete plan that addresses these blockers and moves the next quarter forward."*

---

## Slide 8: Next-Quarter Plan

**Purpose:** Convert the review into a forward-looking operating plan.

| Plan element | Fill-in guidance | Example |
|--------------|------------------|---------|
| Initiative | Name the enablement, rollout, or optimization action | `Expand agent-mode enablement to five pilot teams` |
| Business target | State the measurable outcome | `Increase agent usage to 25% of active users` |
| Timing | Use quarter-relative timing | `Weeks 2-6 of Q4` |
| Owner | Name one accountable lead | `Director, Developer Experience` |

**Target prompt:** Include 3-5 next-quarter targets spanning adoption, engagement, impact, and program health.

**Executive closing example:** *"The program does not need a strategy reset; it needs targeted enablement, clearer proof by cohort, and tighter license optimization in low-use pockets."*

**Visual direction:** Roadmap or three-lane action plan with milestones on top and target KPI cards below.

---

## Appendix: Data Sources and Methodology *(optional)*

**Purpose:** Keep the deck executive-friendly while preserving analytical defensibility.

| Data point | Source | Collection method | Limitation to disclose |
|-----------|--------|-------------------|------------------------|
| Utilization, MAU | Vendor usage dashboard or API (e.g., GitHub Copilot) | Automated export | Rolling-window definitions can shift week to week |
| Acceptance, chat engagement | Vendor usage dashboard or API (e.g., GitHub Copilot) | Automated export | Often aggregate, not user-level |
| Code generation and edit usage | Code generation dashboard or API | Automated export | Language and feature detail can vary by plan |
| Delivery outcomes | DevLake, git analytics, CI/CD tooling | Cohort comparison or trend analysis | Multiple process changes may affect attribution |
| Developer sentiment | Internal pulse survey | Survey or interview synthesis | Self-reported and response-rate sensitive |
| ROI calculations | Derived model | Finance-reviewed assumptions | Estimate, not proof of sole causality |

**Visual direction:** Clean reference table with no more than six rows; move any long methods detail to speaker notes.

---

## Audience Trimming Guide

| Audience | Keep | Trim | Emphasize |
|----------|------|------|-----------|
| C-suite / board | Cover, Slides 1, 2, 5, 7, 8 | Slide 3 detail, most of appendix, extra stories | ROI, delivery signal, top risks, executive ask |
| VP Engineering / directors | Cover, Slides 1-8 | Appendix only if questioned | Adoption quality, impact evidence, operator actions |
| Team leads / engineering managers | Slides 2-8 plus appendix | Compress ROI to one section if time is short | Behavior change, team examples, blockers, next actions |

**Timing guide:** 10-15 minutes for C-suite, 20-30 minutes for VP Engineering, 30-45 minutes for manager-level reviews with discussion.

## What to do next

- :material-file-powerpoint: Download the [PPTX template](artifacts/ai-coding-qbr-outline-template.pptx) and customize it for your next review.
- :material-finance: Pair this outline with the [ROI One-Pager](roi-one-pager.md) when leadership wants calculation detail.
- :material-table: Use the [KPI Table](kpi-table.md) as the appendix or data backup for this deck.
