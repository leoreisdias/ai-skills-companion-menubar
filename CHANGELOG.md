# Changelog

All notable changes to this project will be documented in this file.

## [Next Release] - Unreleased

### Added
- Global `Check for Updates` flow in the popover header.
- GitHub Releases integration to detect newer versions of AI Skills Companion.
- Inline update banner with `Download DMG` and `Open Release` actions.
- Automatic DMG download to the user's Downloads folder, followed by automatic opening of the downloaded file.

### Changed
- App version metadata is now aligned with the public GitHub release versioning scheme.
- README now documents the update flow and the recommended `/Applications` replacement path for upgrades.

## [0.1.0] - 2026-03-09

### Added
- First public release of **AI Skills Companion**, a native macOS menu bar app for browsing and managing AI skills.
- `Hub` tab for official `skills.sh` discovery and install-command preparation.
- `Per Agent` tab for inspecting skills installed across common agent folders.
- `Global` tab for browsing the local `~/.agents/skills` library.
- Local skill management actions in `Global`, including disable, re-enable, and move-to-Trash.
- Optional `skills.json` categorization support for grouping local skills into custom sections.
- `Auto Categorize` flow powered by Codex CLI, with in-app confirmation and live output.
- DMG packaging flow for GitHub Releases.

### Changed
- The product naming was finalized around the current app language:
  - `AI Skills Companion`
  - `Hub`
  - `Per Agent`
  - `Global`
- Official installs now use a copy-first CLI flow instead of opening a terminal automatically.
- Search behavior in `Per Agent` and `Global` was moved to explicit search (`Search` button or `Enter`) for better scalability.

### Fixed
- Multiple layout and alignment fixes across `Hub`, `Per Agent`, and `Global`.
- Improved empty states, category visibility, and card consistency in the `Global` tab.
- Cleaner command output behavior by hiding low-value path debugging details on successful runs.
