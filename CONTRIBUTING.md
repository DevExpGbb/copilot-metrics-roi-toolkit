# Contributing to the Copilot Metrics & ROI Toolkit

Thank you for helping improve this toolkit! Here's how to contribute.

## How to Update Content

1. **Fork and clone** the repository
2. **Install dependencies**: `pip install mkdocs-material`
3. **Run locally**: `mkdocs serve` → open http://localhost:8000
4. **Edit markdown** files in `/docs`
5. **Submit a PR** with a clear description of changes

## Content Guidelines

- **Keep it skimmable**: Use headings, bullets, short tables, and callouts
- **End sections with "What to do next"**: 1–3 actionable bullets
- **Link, don't rewrite**: Prefer linking to authoritative sources over reproducing content
- **Use admonitions** for warnings, tips, and scope limitations:
  ```markdown
  !!! warning "Scope Limitation"
      Usage metrics do not include GitHub.com Chat or Mobile activity.
  ```

## Adding a Tool to the Catalog

Follow this template in `docs/tool-catalog.md`:

| Field | Description |
|-------|-------------|
| **What it's for** | One sentence |
| **When to use** | Customer maturity level |
| **Setup effort** | Low / Medium / High |
| **Data retention** | What history is available |
| **Cost notes** | Free / infrastructure required |
| **Links** | Repo + docs |
| **Quick start** | 3–5 steps |

## Adding a Playbook

Create a new file in `docs/playbooks/` and add it to the `nav` in `mkdocs.yml`.

## Updating Executive Template Artifacts

When you update any page under `docs/exec-templates/`, keep the downloadable artifact aligned:

1. Edit the markdown template page first (source-of-truth).
2. Regenerate the mapped artifact in `docs/exec-templates/artifacts/`.
3. Verify links from the template page and `docs/exec-templates/index.md`.
4. Run `mkdocs build --strict` before opening a PR.

See `docs/exec-templates/artifact-maintenance.md` for the full mapping and workflow.

## Style

- Use [MkDocs Material](https://squidfundly.github.io/mkdocs-material/) features (admonitions, tabs, mermaid)
- Keep Mermaid diagrams simple (max 10–12 nodes)
- No external diagram tools — everything stays in-page

## Review Process

1. All changes go through PR review
2. Content changes should be verified with `mkdocs build` (no errors)
3. Tag releases quarterly (v1.0, v1.1, etc.)
