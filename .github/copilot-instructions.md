# Copilot Instructions

## Project Overview

This is a **docs-first toolkit** (not a software application) for measuring GitHub Copilot adoption and ROI. The deliverable is a MkDocs Material documentation site. There is no application code, tests, or CI pipeline — content is the product.

## Build & Serve

```bash
pip install mkdocs-material
mkdocs serve          # Local dev at http://localhost:8000
mkdocs build          # Validate — must complete with no errors before submitting a PR
```

## Architecture

- **`docs/`** — All content, organized into a two-phase measurement framework:
  - **Phase 1 (Adoption):** `docs/adoption/` — usage metrics, dashboards, analytics playbooks
  - **Phase 2 (Impact & ROI):** `docs/impact/` — DORA correlation, ROI framework, outcome metrics
  - **Templates:** `docs/exec-templates/` — reusable executive artifacts (QBR, ROI one-pager, KPI table)
  - **Reference:** `docs/dashboards-data-sources.md`, `docs/tool-catalog.md`, `docs/faq-glossary.md`
- **`mkdocs.yml`** — Site config and navigation. New pages must be added to the `nav:` section here.
- **`scripts/`** — Bash helper scripts (e.g., `fetch-usage-metrics.sh` for pulling Copilot metrics via the GitHub REST API)
- **`data-samples/`** — Example NDJSON files showing Copilot usage data schemas (enterprise-level and user-level)

## Content Conventions

- **Skimmable format:** Use headings, bullets, short tables, and callouts — not long prose.
- **End sections with "What to do next":** 1–3 actionable bullets.
- **Link, don't rewrite:** Prefer linking to authoritative sources over reproducing content.
- **Admonitions for scope/warnings:**
  ```markdown
  !!! warning "Scope Limitation"
      Usage metrics do not include GitHub.com Chat or Mobile activity.
  ```
- **Mermaid diagrams:** Keep simple (max 10–12 nodes). No external diagram tools — everything stays in-page.
- **MkDocs Material features:** Use admonitions, tabs (`pymdownx.tabbed`), task lists, and `content.code.copy`.

## Adding Content

- **New page:** Create the `.md` file under `docs/`, then add it to the `nav:` in `mkdocs.yml`.
- **New tool in catalog:** Follow the template in `docs/tool-catalog.md` (What it's for, When to use, Setup effort, Data retention, Cost notes, Links, Quick start).
- **New playbook:** Add to `docs/playbooks/` and register in `mkdocs.yml` nav.
