# Executive Template Artifact Maintenance Workflow

This workflow keeps markdown template pages and downloadable executive artifacts in sync.

## Canonical mapping

| Markdown template page | Downloadable artifact | Format |
|------------------------|-----------------------|--------|
| `kpi-table.md` | `artifacts/ai-coding-kpi-table-template.docx` | DOCX |
| `roi-one-pager.md` | `artifacts/ai-coding-roi-one-pager-template.docx` | DOCX |
| `qbr-outline.md` | `artifacts/ai-coding-qbr-outline-template.pptx` | PPTX |
| `measurement-plan.md` | `artifacts/ai-coding-measurement-plan-template.docx` | DOCX |

## Source-of-truth rule

- The markdown pages in `docs/exec-templates/` are the source of truth.
- Downloadable artifacts are published outputs for direct reuse.
- If markdown and artifact content differ, update the artifact to match markdown.

## Update workflow

1. Edit the markdown template page first.
2. Regenerate the mapped artifact using the updated markdown content.
3. Confirm the template page download link points to the expected artifact.
4. Confirm the templates index (`docs/exec-templates/index.md`) still exposes the artifact.
5. Run `mkdocs build --strict`.

## Naming and placement rules

- Keep artifacts in `docs/exec-templates/artifacts/` so MkDocs publishes them.
- Use stable filenames prefixed with `ai-coding-` to avoid link churn. (Older `copilot-` prefixed artifacts may be retained as redirect aliases for one release cycle to preserve external links.)
- Do not rename artifacts unless there is a strong reason; if renamed, update all links in the same PR.

## PR checklist

- [ ] Markdown template updates complete.
- [ ] Mapped artifact regenerated and committed.
- [ ] Download links verified on template page and templates index.
- [ ] `mkdocs build --strict` passes.
