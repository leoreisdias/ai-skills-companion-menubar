# Electron Pivot Stitch Handoff

Date: 2026-04-22

## Stitch Project

- Project: `AI Skills Companion Electron Pivot`
- Project ID: `14905588168099202156`
- Resource: `projects/14905588168099202156`
- Local Stitch archive:
  - Design source: `.stitch/DESIGN.md`
  - Raw Stitch design-system export: `.stitch/STITCH_DESIGN_SYSTEM.md`
  - Screen manifest: `.stitch/metadata.json`
  - HTML and PNG references: `.stitch/designs/`
  - Reader-facing guide: `docs/design-reference/stitch-electron-reference.md`

## How To Use The Local Archive

The archive preserves the Stitch output as design inspiration. Use the PNGs for layout, hierarchy, density, color, and product feel. Use the HTML only as a structural reference. Do not treat generated copy, fake data, or invented product affordances as implementation requirements.

## Visual Direction To Keep

- Warm neutral desktop utility palette:
  - Canvas: `#FBF9F3`
  - Sidebar / low surface: `#F5F3ED`
  - Selected / high surface: `#E4E2DD`
  - Primary text / action: `#1A241D`
  - Secondary text: `#6C655B`
  - Moss accent: `#2F3A32`
- Calm Mac-like product feel, closer to Raycast / Linear / GitHub settings than a marketing dashboard.
- Low-radius controls, subtle tonal layering, compact rows, tables, inspectors, grouped settings.
- Sidebar navigation plus focused work areas. Avoid a KPI dashboard as the primary structure.

## Product Assumptions To Reject

Stitch sometimes invented these. They are not part of milestone one:

- Creating skills inside the app.
- Creating workspaces.
- Learning paths.
- Shared/team libraries.
- Premium tiers or accounts.
- User avatars, notifications, profile menus.
- Cloud vaults, cloud sync, encrypted remote destinations.
- Template marketplace language.
- Skill social proof or fake usage metrics.
- "Tactile Architect" as visible branding.

## Milestone-One Screens Generated

The following screens were generated during the Stitch loop for the current milestone. Some may appear under refined titles in Stitch, but these are the important product surfaces:

- `Skill Library - Corrected Product State`
  - Screen resource: `projects/14905588168099202156/screens/f22ce27e616e491a8a5e09f607c04140`
  - Purpose: primary inventory table plus right inspector for selected skill.
- `Catalog Backup - Corrected Flow`
  - Screen resource: `projects/14905588168099202156/screens/8f5f45e864414ec397c80371d2ee68d6`
  - Purpose: local portable JSON export flow with source selection, portability preview, and export actions.
- `Hub - AI Skills Companion`
  - Screen resource: `projects/14905588168099202156/screens/cc63283453fb44558f3cf334957fcbb4`
  - Purpose: official `skills.sh` search, install command preparation, and command output.
- `Per Agent - AI Skills Companion`
  - Screen resource: `projects/14905588168099202156/screens/7bfd05e214e1483b936197fe67da437a`
  - Purpose: inspect installed skills across agent folders and run update/check commands.
- `Global Library - AI Skills Companion`
  - Screen resource: `projects/14905588168099202156/screens/f879b1fed7734248aa508cf7f9a5c6c0`
  - Purpose: manage `~/.agents/skills`, categories, tags, disabled skills, trash, and auto-categorization.
- `Overview - AI Skills Companion`
  - Screen resource: `projects/14905588168099202156/screens/01214e21491444c09f24753a61739c62`
  - Purpose: operational home screen with real quick actions and source coverage.
- `Settings - AI Skills Companion`
  - Screen resource: `projects/14905588168099202156/screens/09dc8770309941e38a0e95d41a1b8070`
  - Purpose: local paths, runtime detection, reduced menu bar behavior, safety, appearance.
- `Coming Soon - AI Skills Companion`
  - Screen resource: `projects/14905588168099202156/screens/8b470c470d384760ba5fa80390f114a6`
  - Purpose: restrained roadmap for deferred ideas without implying active functionality.

## Milestone-One Product Scope

- Full replacement of the Swift/AppKit runtime with Electron.
- Keep the Swift/AppKit app in a legacy reference folder while porting behavior.
- Main Electron app uses a dedicated React window.
- Reduced menu bar item remains for milestone one:
  - Open window.
  - Close/hide window.
  - Quit.
- Use Tailwind for styling in the Electron renderer.
- Preserve current functional parity:
  - Hub search/install command preparation.
  - Per-agent installed skill inspection.
  - Global library browsing and local skill management.
  - `skills.json` categorization and tags.
  - Codex auto-categorization flow.
  - Update checks and update-all command output.
- Add Catalog Backup as the first new feature.

## Catalog Backup Behavior

- Export a separate file, likely `ai-skills-catalog.json`.
- Do not mutate the existing `skills.json`.
- Sources selectable in milestone one:
  - Global: `~/.agents/skills`
  - Codex: `~/.codex/skills`
  - Claude: `~/.claude/skills`
  - Gemini: `~/.gemini/skills`
  - OpenCode: `~/.config/opencode/skills`
- Export should merge:
  - `skills.sh` lock metadata for portability.
  - `skills.json` taxonomy where available.
  - Source bucket and local folder identity.
- Skills without lock metadata should appear in the export as non-portable / not automatically restorable.
- Import can come later; milestone one is export-oriented.

## Deferred Features

- AI Companion discovery mode.
- Nested skill-folder display.
- First-class tag filters and saved views.
- Skill profiles that hide non-profile skills safely.
- Project skill sets.
- Slash command browser.
- SDK-based categorization via Codex/Claude SDK.
- GitHub-backed catalog sync.
