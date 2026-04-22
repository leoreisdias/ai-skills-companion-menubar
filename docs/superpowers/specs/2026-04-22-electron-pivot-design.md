# Electron Pivot Design

Date: 2026-04-22
Status: ready for user review

## Quick Read

AI Skills Companion will move from a compact Swift/AppKit menu-bar popover into a full Electron desktop app with a dedicated React window, Tailwind styling, and a reduced menu-bar companion. The milestone-one goal is full parity with the current app plus one new feature: local portable JSON Catalog Backup.

The Swift app stays in the repository as a legacy reference during the migration. The Electron app becomes the product runtime.

## Reader Context

This spec is for the engineer or agent implementing the Electron rebuild. Assume they know React/Electron, but not this product's current Swift implementation, local skill-folder conventions, or the Stitch design exploration.

The implementation should use:

- Current behavior reference: `Sources/myAgentSkills/`
- Visual reference: `.stitch/DESIGN.md`
- Raw Stitch archive: `.stitch/designs/`
- Handoff summary: `docs/electron-stitch-milestone-handoff.md`
- Human-facing Stitch guide: `docs/design-reference/stitch-electron-reference.md`

## Product Decision

Build a full Electron replacement for the current AppKit app.

Milestone one includes:

- A dedicated desktop window for the main UI.
- A reduced menu-bar item with open window, hide/close window, and quit behavior.
- Feature parity with the current `Hub`, `Per Agent`, and `Global` tabs.
- App update checking equivalent to the current GitHub Releases flow.
- Tailwind-powered React UI that follows the Stitch visual direction.
- A local-only Catalog Backup export flow.

Milestone one does not include:

- GitHub-backed catalog sync.
- Catalog import.
- Skill profiles.
- AI Companion discovery mode.
- Project skill-set management.
- Slash command browser.
- SDK-based categorization.
- Skill creation inside the app.
- Accounts, teams, sharing, premium tiers, cloud vaults, or remote sync.

## Current App Behavior To Preserve

### Menu Bar Shell

The current AppKit app runs as a menu-bar utility. Left click toggles the popover. Right click opens a small menu with `Quit AI Skills Companion`. The popover closes when the app resigns active, when the user clicks outside, or when the user presses `Esc`.

The Electron app should preserve the menu-bar presence, but the menu-bar item should no longer be the primary UI. It should provide quick control over the dedicated Electron window:

- `Open AI Skills Companion`
- `Hide AI Skills Companion` or `Close Window`
- `Quit AI Skills Companion`

The exact label can be tuned during implementation, but the behavior should be simple and Mac-native.

### Hub

The Hub remains the official `skills.sh` catalog browser.

It must:

- Resolve `npx` in GUI-safe paths.
- Run `npx --yes skills find <query>`.
- Parse structured search results from command output.
- Show command output in a collapsible or inspectable area.
- Let the user copy a skill source.
- Let the user copy the real install command for a search result, GitHub shorthand, full URL, or local path.
- Avoid trying to replace the interactive `skills.sh` install prompt. The product should prepare commands and let the user paste them into their terminal.

### Per Agent

The Per Agent view shows installed skills across agent-specific folders.

Milestone-one source folders:

- Global: `~/.agents/skills`
- Codex: `~/.codex/skills`
- Claude: `~/.claude/skills`
- Gemini: `~/.gemini/skills`
- OpenCode: `~/.config/opencode/skills`

Compatibility note: the current Swift app scans `~/.gemini/antigravity/skills`. The Electron rebuild should support `~/.gemini/skills` for the new milestone decision and may also show the legacy Antigravity folder as an additional detected path if it exists.

It must:

- Scan local folders for skill directories containing `SKILL.md`.
- Parse frontmatter `name` and `description` when available.
- Fall back to folder name and body text when frontmatter is missing.
- Search by name, description, source label, bucket, and agent id.
- Filter by source.
- Let the user copy the skill name.
- Let the user open `SKILL.md`.
- Let the user reveal the containing folder.
- Run `npx --yes skills check`.
- Run `npx --yes skills update`.
- Show command output and status for check/update actions.

### Global Library

The Global Library manages `~/.agents/skills`.

It must:

- Read active skills from `~/.agents/skills`.
- Read disabled skills from `~/.agents/skills/.disabled`.
- Treat a skill folder as valid when it contains `SKILL.md`.
- Parse `SKILL.md` frontmatter and body fallback metadata.
- Read optional categorization from `~/.agents/skills/skills.json`.
- Show category labels, platforms, and tags when the taxonomy file is valid.
- Show an invalid or missing `skills.json` state without blocking the flat skill list.
- Search local skills by display name, original name, description, and folder.
- Filter by category when categorization exists.
- Copy original skill name.
- Open `SKILL.md`.
- Reveal skill folder.
- Disable an active skill by moving it to `~/.agents/skills/.disabled/<folder>`.
- Re-enable a disabled skill by moving it back to `~/.agents/skills/<folder>`.
- Move a skill folder to macOS Trash after confirmation.
- Rename the display label by updating the skill entry in `skills.json`.
- Preserve existing `skills.json` scopes, tags, and platforms when renaming.

### Auto Categorization

The app must preserve the current Codex-backed categorization flow for milestone one, even if a later milestone replaces it with SDK-based categorization.

It must:

- Resolve the `codex` CLI in GUI-safe paths.
- Offer append-missing categorization when skills are uncategorized or `skills.json` is missing.
- Offer re-categorization when all skills are categorized.
- Build a prompt from the current global skill snapshot.
- Run Codex in the `~/.agents/skills` working directory.
- Stream output into the app.
- Write or update `skills.json` through the Codex run.
- Reload the Global Library after a successful run.
- Surface missing Codex runtime, invalid JSON, and failed process errors clearly.

### App Updates

The Electron app should preserve the existing GitHub Releases update check behavior.

It must:

- Show the current app version.
- Check GitHub Releases for newer versions.
- Distinguish up-to-date, update-available, and failure states.
- Offer release page opening.
- Offer DMG download/open behavior if the release exposes a DMG.

If packaging work makes this impossible in the first scaffold pass, the UI may show a wired disabled state, but the implementation plan should include a dedicated task to port the current `AppUpdateService` behavior.

## New Feature: Catalog Backup

Catalog Backup is the first new feature. It exports a portable JSON file that captures selected local skill sources, their lock metadata when available, and their taxonomy metadata when available.

### User Journey

The user opens `Catalog Backup`, chooses which sources to include, scans them, reviews portability warnings, and exports `ai-skills-catalog.json`.

The first version is export-only. The app should not import the catalog yet.

### Selectable Sources

The UI should allow these source toggles:

- Global: `~/.agents/skills`
- Codex: `~/.codex/skills`
- Claude: `~/.claude/skills`
- Gemini: `~/.gemini/skills`
- OpenCode: `~/.config/opencode/skills`

All toggles should show whether the path exists, how many skills were detected, and how many are portable.

### Backup Compatibility Rule

Automatic restore compatibility only applies to skills installed in a way that produced `skills-lock.json` metadata. Skills without lock metadata are still included for visibility, but must be marked as not automatically restorable.

This should be explicit in the UI and in the exported JSON.

### Metadata Sources

The export should merge three kinds of data:

- Filesystem scan: folder name, local path, source bucket, enabled or disabled state, `SKILL.md` metadata.
- `skills-lock.json`: source, source type, hash or other install metadata produced by the skills CLI.
- `skills.json`: scope/category, display name override, platforms, and tags where available.

For Global, taxonomy comes from `~/.agents/skills/skills.json`.

For non-global sources, taxonomy should be included only when the source folder has a compatible `skills.json` or when a future implementation explicitly maps global taxonomy across sources. Milestone one should not invent categories for non-global skills.

### Export Shape

The exported file should be a separate artifact and should not mutate `skills.json`.

Recommended filename:

```text
ai-skills-catalog.json
```

Recommended schema:

```json
{
  "schemaVersion": 1,
  "generatedAt": "2026-04-22T00:00:00.000Z",
  "app": {
    "name": "AI Skills Companion",
    "version": "0.0.0"
  },
  "compatibility": {
    "restoreRequiresSkillsCliLock": true,
    "importSupported": false
  },
  "sources": [
    {
      "id": "global",
      "label": "Global",
      "path": "~/.agents/skills",
      "selected": true,
      "exists": true,
      "skillCount": 2,
      "portableCount": 1,
      "nonPortableCount": 1
    }
  ],
  "skills": [
    {
      "id": "global:frontend-design",
      "folder": "frontend-design",
      "name": "frontend-design",
      "displayName": "Frontend Design",
      "description": "Create distinctive, production-grade frontend interfaces.",
      "sourceBucket": "global",
      "relativePath": "frontend-design",
      "absolutePath": "~/.agents/skills/frontend-design",
      "enabled": true,
      "portable": true,
      "taxonomy": {
        "scope": "frontend",
        "scopeLabel": "Frontend",
        "platforms": ["generic"],
        "tags": ["ui", "design", "frontend"]
      },
      "install": {
        "source": "owner/repo",
        "sourceType": "github",
        "computedHash": "sha256:example-lock-hash"
      }
    },
    {
      "id": "global:local-only-skill",
      "folder": "local-only-skill",
      "name": "local-only-skill",
      "displayName": "Local Only Skill",
      "description": "Local skill without lock metadata.",
      "sourceBucket": "global",
      "relativePath": "local-only-skill",
      "absolutePath": "~/.agents/skills/local-only-skill",
      "enabled": true,
      "portable": false,
      "taxonomy": null,
      "install": null,
      "warnings": [
        "No skills-lock.json metadata was found, so this skill is included for inventory only."
      ]
    }
  ]
}
```

### Export Destination

Milestone one should use a native save dialog by default. The default filename should be `ai-skills-catalog.json`. If save dialog support is blocked during implementation, the fallback destination is the user's Downloads folder with a timestamped filename.

### Error States

Catalog Backup must handle:

- Source folder does not exist.
- Source folder exists but has no skills.
- `SKILL.md` is unreadable.
- `skills.json` is missing.
- `skills.json` is invalid.
- `skills-lock.json` is missing.
- `skills-lock.json` is invalid.
- User cancels the save dialog.
- Write failure when exporting.

Warnings should not block export unless the app cannot write the file.

## Information Architecture

Use a persistent left sidebar rather than the current three-tab popover.

Milestone-one navigation:

- Overview
- Skill Library
- Hub
- Per Agent
- Global Library
- Catalog Backup
- Coming Soon
- Settings

### Overview

Overview is an operational home screen. It should not become a KPI dashboard.

It should show:

- Source coverage and runtime health.
- Quick actions for refresh, search Hub, open Catalog Backup, and check updates.
- A short list of current warnings such as missing `npx`, invalid `skills.json`, or no portable backup metadata.

### Skill Library

Skill Library is the primary inventory view. It should merge the user's local sources into a table-first browsing experience.

It should show:

- Skill name.
- Source bucket.
- Category/scope when available.
- Tags when available.
- Enabled/disabled state when relevant.
- Portability status when lock metadata exists or is missing.
- Right-side inspector for the selected skill.

Skill Library does not need to replace every specialized action from Hub, Per Agent, or Global Library. It is the main place to understand what exists.

### Hub

Hub focuses on official `skills.sh` search and install command preparation.

### Per Agent

Per Agent focuses on agent-folder inventory and update/check actions.

### Global Library

Global Library focuses on `~/.agents/skills` management actions and categorization.

### Catalog Backup

Catalog Backup focuses on local export.

### Coming Soon

Coming Soon should list deferred ideas without fake functionality:

- AI Companion discovery mode.
- Nested folder display.
- Tag filters and saved views.
- Skill profiles.
- Project skill sets.
- Slash command browser.
- SDK-based categorization.
- GitHub-backed catalog sync.

### Settings

Settings should expose:

- Detected `npx` path and attempted paths.
- Detected `codex` path and attempted paths.
- Source folder paths.
- Menu-bar behavior.
- Update-check details.
- Design/theme mode if implemented.

## Visual Design

Use the Stitch direction as design inspiration, not as literal product copy.

Core rules:

- Warm ivory canvas: `#FBF9F3`.
- Low warm sidebar surface: `#F5F3ED`.
- Raised neutral grouped surface: `#F0EEE8`.
- Selected/high surface: `#E4E2DD`.
- Primary text/action: `#1A241D`.
- Moss accent: `#2F3A32`.
- Secondary metadata: `#6C655B`.
- Use Inter.
- Use 8px radii for primary controls and containers.
- Avoid giant cards, fake graphs, marketing hero sections, profile menus, gradients, glassy decoration, and social/product-growth language.
- Prefer tables, rows, inspectors, toolbars, settings groups, and command output panels.

The React implementation should translate the design into shared components rather than pasting generated Stitch HTML.

## Architecture

Use Electron with a React renderer and a TypeScript main/preload boundary.

Recommended top-level structure:

```text
legacy/appkit/
electron/
  main/
  preload/
  renderer/
  shared/
```

The exact file names can be finalized in the implementation plan, but the boundaries should be:

- `main`: Electron app lifecycle, tray/menu-bar item, BrowserWindow, native dialogs, shell open/reveal, filesystem mutations, process execution.
- `preload`: safe IPC bridge exposing typed app APIs to the renderer.
- `renderer`: React UI, routing/navigation, state, presentational components.
- `shared`: types, schemas, path/source definitions, parser contracts.
- `legacy/appkit`: current Swift app moved intact as reference once the Electron scaffold owns the root app runtime.

### IPC Boundary

The renderer must not access Node APIs directly. It should call typed preload APIs.

Recommended API groups:

- `runtime.getNpxResolution()`
- `runtime.getCodexResolution()`
- `skills.searchOfficial(query)`
- `skills.prepareInstallCommand(source)`
- `skills.checkUpdates()`
- `skills.updateAll()`
- `inventory.scanSources(options)`
- `global.loadLibrary()`
- `global.setSkillEnabled(skillId, enabled)`
- `global.trashSkill(skillId)`
- `global.renameSkill(skillId, displayName)`
- `categorization.run(mode, instruction)`
- `catalogBackup.scanSources(sourceIds)`
- `catalogBackup.exportCatalog(request)`
- `appUpdates.check()`
- `appUpdates.downloadAndOpen(info)`
- `shell.openPath(path)`
- `shell.revealPath(path)`
- `clipboard.writeText(text)`

IPC payloads should be serializable JSON, not class instances.

### Process Execution

Process execution belongs in Electron main. It should preserve the current GUI-safe runtime behavior:

- Resolve binaries from `PATH`.
- Also try common macOS locations such as `/opt/homebrew/bin`, `/usr/local/bin`, `/usr/bin`, and `~/.local/bin`.
- Set `HOME`.
- Set color-disabling environment variables.
- Capture stdout, stderr, exit code, attempted paths, executable path, and working directory.

### Filesystem Safety

Filesystem mutations belong in Electron main.

Rules:

- Disable moves active skill folders into `.disabled`.
- Re-enable moves disabled folders back to active root.
- Do not overwrite an existing destination folder.
- Trash uses native macOS Trash behavior when available.
- Rename display label only mutates `skills.json`, not the folder or `SKILL.md`.
- Catalog Backup export writes a separate JSON file and never mutates `skills.json`.

## Data Model

Shared TypeScript types should model these concepts:

- `AgentSource`
- `RuntimeResolution`
- `CommandResult`
- `OfficialSkillSearchResult`
- `InstalledSkillRecord`
- `GlobalSkillRecord`
- `SkillCatalogDefinition`
- `SkillCategorizationEntry`
- `SkillCategorizationState`
- `CatalogBackupSource`
- `CatalogBackupSkill`
- `CatalogBackupDocument`

The implementation plan should include schema validation for JSON files. The preferred approach is a small validation layer close to the parser. Avoid letting invalid `skills.json` or `skills-lock.json` crash the UI.

## Testing Strategy

Testing should focus on the behavior that can lose user trust:

- Parsing `SKILL.md` frontmatter and body fallbacks.
- Parsing official `skills.sh` output.
- Parsing check/update output into skill statuses.
- Loading valid, missing, and invalid `skills.json`.
- Loading valid, missing, and invalid `skills-lock.json`.
- Building Catalog Backup export documents.
- Marking skills with no lock metadata as non-portable.
- Disabling/re-enabling skills without overwriting destinations.
- Rename display label updates preserving taxonomy fields.
- Runtime resolver path selection.
- Command-result formatting with ANSI stripping.
- IPC contracts for core actions.

After TypeScript changes, run:

```bash
npx tsc --noEmit
```

Renderer UI should also have at least smoke coverage for:

- app shell navigation
- empty states
- source filtering
- backup source toggles
- backup export warnings

Manual verification should include:

- Start Electron app locally.
- Confirm tray/menu-bar open, close/hide, and quit.
- Search Hub with a real query.
- Copy an install command.
- Scan Per Agent folders.
- Run check/update commands or verify clear missing-runtime errors.
- Browse Global Library with and without valid `skills.json`.
- Disable and re-enable a disposable test skill.
- Export Catalog Backup and inspect JSON.
- Confirm visual layout against `.stitch/designs/skill-library-corrected-product-state.png` and `.stitch/designs/catalog-backup-corrected-flow.png`.

## Migration Sequence

The implementation should be planned in slices:

1. Preserve the Swift app under `legacy/appkit`.
2. Scaffold Electron, React, TypeScript, and Tailwind v4.
3. Build typed main/preload/renderer boundaries.
4. Port pure parsing and model logic with tests.
5. Port runtime/process services.
6. Port filesystem inventory and global library services.
7. Build the app shell and visual system.
8. Port Hub.
9. Port Per Agent.
10. Port Global Library and categorization.
11. Build Catalog Backup scan/export.
12. Port app update checking.
13. Wire menu-bar/tray behavior.
14. Run full verification and adjust polish against Stitch references.

## Acceptance Criteria

The milestone is complete when:

- The Electron app launches as the main product runtime.
- The menu-bar item can open, hide/close, and quit the app.
- The Swift/AppKit implementation remains available in a legacy reference folder.
- Hub feature parity works.
- Per Agent feature parity works for the milestone source folders.
- Global Library feature parity works.
- Codex auto-categorization still works or clearly reports missing Codex runtime.
- GitHub Releases update checking is preserved.
- Catalog Backup exports a valid local `ai-skills-catalog.json`.
- Non-portable skills are included with explicit warnings.
- The UI follows the Stitch-inspired warm utility design without copying invented product scope.
- TypeScript validation passes with `npx tsc --noEmit`.

## Open Decisions For Later

These are intentionally not blockers for milestone one:

- Exact import behavior for `ai-skills-catalog.json`.
- GitHub-backed backup repository shape.
- Whether AI Companion discovery mode should move folders or use a safer overlay mechanism.
- Nested folder semantics for skill groups.
- Skill profile activation rules and conflict handling.
- Whether SDK categorization should replace or coexist with CLI categorization.

## Self-Review Notes

- Completeness scan: no unresolved blanks remain.
- Scope check: the spec covers one implementation milestone, despite being large, because the goal is a runtime replacement with parity and one new export feature.
- Ambiguity check: Catalog import, GitHub sync, profiles, project skill sets, and SDK categorization are explicitly out of scope.
- Consistency check: source paths match the latest milestone decision, with the current Gemini Antigravity path documented as legacy compatibility.
