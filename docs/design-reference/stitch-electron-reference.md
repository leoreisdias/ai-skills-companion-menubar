# Stitch Reference For The Electron Rebuild

Use this when implementing the Electron app UI and product shell. It gives the quick answer first, then points to the full local archive.

## Quick Win

The useful part of the Stitch work is the product feel: warm neutral desktop utility, compact local-inventory workflows, table-first skill management, and focused inspector panels. The generated copy is not authoritative.

Local reference files:

- Design source: [`.stitch/DESIGN.md`](../../.stitch/DESIGN.md)
- Raw Stitch design-system export: [`.stitch/STITCH_DESIGN_SYSTEM.md`](../../.stitch/STITCH_DESIGN_SYSTEM.md)
- Screen manifest: [`.stitch/metadata.json`](../../.stitch/metadata.json)
- Downloaded HTML and screenshots: [`.stitch/designs/`](../../.stitch/designs/)
- Earlier handoff note: [`docs/electron-stitch-milestone-handoff.md`](../electron-stitch-milestone-handoff.md)

## Follow This

- Warm ivory canvas with moss/charcoal accents.
- Stable desktop shell with left navigation.
- Central tables/lists for skill inventory and source scanning.
- Right inspector panels for selected skill details.
- Settings-style rows for paths, menu-bar behavior, and safety options.
- Compact controls with low radius, restrained depth, and tonal layering.
- Catalog Backup as a local export flow with source selection and portability warnings.

## Do Not Treat As Scope

Stitch invented some product ideas. Keep these out of milestone one:

- Creating skills inside the app.
- Accounts, teams, sharing, cloud sync, or cloud vaults.
- Premium tiers or marketplace/social proof language.
- Profile menus, notifications, and fake user activity.
- Fake analytics or KPI dashboard framing.
- Any app name other than **AI Skills Companion**.

## Screen Index

| Screen | Local Screenshot | Local HTML | How To Read It |
| --- | --- | --- | --- |
| Overview - AI Skills Companion | `.stitch/designs/overview-ai-skills-companion.png` | `.stitch/designs/overview-ai-skills-companion.html` | Operational home and source coverage inspiration. |
| Skill Library - Corrected Product State | `.stitch/designs/skill-library-corrected-product-state.png` | `.stitch/designs/skill-library-corrected-product-state.html` | Best primary library reference: table plus inspector. |
| Skill Library - Full Table View | `.stitch/designs/skill-library-full-table-view.png` | `.stitch/designs/skill-library-full-table-view.html` | Useful density/table reference. |
| Skill Library (Refined) | `.stitch/designs/skill-library-refined.png` | `.stitch/designs/skill-library-refined.html` | Visual polish reference; verify content before copying. |
| Catalog Backup - Corrected Flow | `.stitch/designs/catalog-backup-corrected-flow.png` | `.stitch/designs/catalog-backup-corrected-flow.html` | Best Catalog Backup workflow reference. |
| Catalog Backup - Local Export Flow | `.stitch/designs/catalog-backup-local-export-flow.png` | `.stitch/designs/catalog-backup-local-export-flow.html` | Alternate backup layout and export-state reference. |
| Catalog Backup | `.stitch/designs/catalog-backup.png` | `.stitch/designs/catalog-backup.html` | Inspiration only; content may be noisier. |
| Hub - AI Skills Companion | `.stitch/designs/hub-ai-skills-companion.png` | `.stitch/designs/hub-ai-skills-companion.html` | Search/install command preparation reference. |
| Per Agent - AI Skills Companion | `.stitch/designs/per-agent-ai-skills-companion.png` | `.stitch/designs/per-agent-ai-skills-companion.html` | Installed skills across agent folders. |
| Global Library - AI Skills Companion | `.stitch/designs/global-library-ai-skills-companion.png` | `.stitch/designs/global-library-ai-skills-companion.html` | Global skills management, categories, tags, disabled state. |
| Settings - AI Skills Companion | `.stitch/designs/settings-ai-skills-companion.png` | `.stitch/designs/settings-ai-skills-companion.html` | Local paths, menu-bar behavior, safety, appearance. |
| Coming Soon - AI Skills Companion | `.stitch/designs/coming-soon-ai-skills-companion.png` | `.stitch/designs/coming-soon-ai-skills-companion.html` | Restrained roadmap pattern for deferred features. |

## Implementation Notes

When the Electron build starts, do not paste the static Stitch HTML into React. Translate the system into shared app shell components:

- `AppShell`
- `SidebarNav`
- `TopToolbar`
- `SkillTable`
- `SkillInspector`
- `SourcePicker`
- `CommandOutput`
- `SettingsSection`

The design is approved as inspiration, but the milestone spec still owns the product truth.
