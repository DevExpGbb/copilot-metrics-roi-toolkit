# Copilot Instructions

## Project Overview

This repository is a docs-first toolkit for measuring **AI coding agent adoption and ROI** (the *AI Coding Agent ROI Toolkit*). The product is the MkDocs Material site, so `docs/` and `mkdocs.yml` are the source of truth; `site/` is generated output.

The toolkit is vendor-neutral by default but ships a **GitHub Copilot reference module** (Usage Metrics API, NDJSON export, dashboards, Apache DevLake `gh-copilot` plugin, premium-request tooling) because Copilot has the most mature public telemetry. When editing pages, keep generic framing in default copy and clearly scope Copilot-specific instructions inside the reference module.

## Build and Validation Commands

```bash
pip install mkdocs-material
mkdocs serve          # Local preview at http://localhost:8000
mkdocs build --strict # Same validation mode used by the GitHub Pages workflow
```

There is no automated test suite or linter configured in this repository. For page-level validation, preview the changed page with `mkdocs serve`, then finish with `mkdocs build --strict`.

## High-Level Architecture

- The site is organized around a two-phase measurement model defined across `README.md`, `docs/index.md`, `docs/measurement-journey.md`, `docs/adoption/index.md`, and `docs/impact/index.md`:
  - **Phase 1 - Adoption** (`docs/adoption/`): usage metrics, dashboard setup, analytics-ready playbooks, tool guidance.
  - **Phase 2 - Impact & ROI** (`docs/impact/`): DORA correlation, ROI framing, outcome-oriented tooling.
  - **Executive templates** (`docs/exec-templates/`): KPI tables, ROI one-pagers, QBR outlines, measurement-plan artifacts.
  - **Reference pages** (root `docs/*.md`): dashboards/data sources, tool catalog, glossary, references.
- `mkdocs.yml` is both configuration and the published information architecture. New user-facing pages should be added to `nav:` so they appear in the site.
- `scripts/fetch-usage-metrics.sh` is a Copilot-specific operational helper. It fetches enterprise or user-level **GitHub Copilot** usage NDJSON via the REST API and expects `GITHUB_TOKEN`.
- `data-samples/` contains example enterprise and user NDJSON payloads modeled after the **GitHub Copilot Usage Metrics API** schema.
- `.github/workflows/deploy-pages.yml` builds the site with Python + `mkdocs build --strict` and publishes the generated `site/` directory to GitHub Pages.

## Key Conventions

- Keep content aligned to the existing taxonomy instead of inventing new top-level sections: adoption content goes under `docs/adoption/`, impact/ROI content under `docs/impact/`, reusable executive artifacts under `docs/exec-templates/`, and shared reference material in root `docs/`.
- Default voice is vendor-neutral ("AI coding agent", "AI coding tool", "AI-assisted development"). Cite specific vendors only as examples or inside clearly labeled vendor-specific sections.
- Most pages are written as skimmable playbooks: short lead-in, prerequisites or framing, numbered steps and tables, then a closing `## What to do next` section with actionable bullets.
- Prefer linking to authoritative vendor docs (GitHub Copilot, etc.) over restating API or product documentation in full.
- Use MkDocs Material features already enabled in `mkdocs.yml` and already common in the docs: admonitions, tabbed blocks (`===`), Mermaid diagrams, task lists, and copyable code blocks.
- Keep Mermaid diagrams simple; the existing guidance caps them at roughly 10-12 nodes.
- Tool catalog entries follow the table-driven template in `docs/tool-catalog.md`: what it's for, when to use, setup effort, data retention, cost, links, and a short quick start.
- When adding a page, update `mkdocs.yml` navigation in the same change. Unlisted markdown files can exist, but they do not become part of the browsable site structure automatically.
