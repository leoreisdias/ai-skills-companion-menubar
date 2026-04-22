# Design System: AI Skills Companion Electron Pivot

**Project ID:** `14905588168099202156`
**Stitch Design System Asset:** `assets/a77fb7d66c7b4003a0aee2ca7108c756`
**Display Name in Stitch:** `Arcane Ivory`

This file captures the Stitch-generated design system for the Electron rebuild. Treat it as visual direction, not product scope. Stitch generated strong layout, color, spacing, and density decisions, but some screen content is intentionally fictional and should not become implementation requirements.

## 1. Visual Theme & Atmosphere

The interface should feel like a calm, high-quality Mac desktop utility: precise, warm, compact, and quietly premium. It is a working application, not a marketing surface. The preferred mood is "soft utility": dense enough for repeated developer use, but breathable through tonal layering and generous alignment.

The app should avoid the default developer dashboard look. Use grouped panels, focused tables, inspectors, and settings-style rows. Favor clear scanning and calm interaction over big metrics, decorative cards, fake analytics, and promotional language.

## 2. Color Palette & Roles

- **Warm Ivory Canvas (`#FBF9F3`)**: Base application background.
- **Low Warm Surface (`#F5F3ED`)**: Sidebar, quiet navigation areas, and background panels.
- **Raised Neutral Surface (`#F0EEE8`)**: Main grouped surfaces and table regions.
- **High Nested Surface (`#E4E2DD`)**: Active navigation states, selected rows, nested utility panels.
- **Paper Surface (`#FFFFFF`)**: Inputs, command output blocks, and table cells that need crisp contrast.
- **Deep Charcoal Green (`#1A241D`)**: Primary actions and high-importance text.
- **Moss Accent (`#2F3A32`)**: Active AI/catalog states, strong selected states, and subdued primary emphasis.
- **Muted Metadata (`#6C655B`)**: Helper text, secondary labels, timestamps, and low-priority counts.
- **Ghost Outline (`#C3C8C2` at low opacity)**: Minimal boundaries only when tonal layering is not enough.
- **Muted Error (`#BA1A1A`)** and **Soft Error Container (`#FFDAD6`)**: Destructive or blocked states, used sparingly.

## 3. Typography Rules

Use Inter as the product font. Keep the application compact and legible:

- Main screen titles use a restrained headline size, around `24px`.
- Section and panel titles use `14px` to `16px`, medium weight.
- Table rows, metadata, and helper text use `12px` to `14px`.
- Labels can use small uppercase text sparingly for source names, status, and compact metadata.
- Do not use negative letter spacing. Avoid oversized hero typography inside the app.

## 4. Component Styling

- **Buttons:** 8px radius, no gradients. Primary buttons use deep charcoal green with white text. Secondary buttons use warm tonal surfaces. Hover states should deepen or shift tone, not become bright.
- **Navigation:** Left sidebar with compact rows. Active states use tonal fills, not heavy borders.
- **Tables and Lists:** Prefer dense rows with clear columns. Avoid card grids for skill inventory. Use selected-row tonal background and a right inspector for details.
- **Inspectors:** Right-side panels should feel like utility panes, with grouped fields and small controls.
- **Inputs and Search:** White or near-white fill, subtle ghost outline, 8px radius, focus state in charcoal green.
- **Chips and Tags:** Small, low-radius chips. AI or catalog-specific chips can use soft green containers.
- **Command Output:** Use quiet monospace blocks on paper or low warm surfaces. Keep error and success states readable without neon color.

## 5. Layout Principles

- Keep a stable app shell: sidebar, top toolbar, main work area, optional right inspector.
- Treat Overview as operational navigation and status, not as a KPI dashboard.
- Skill Library should be table-first. The user is managing local inventory, not browsing a marketplace.
- Catalog Backup should read like a focused utility flow: source selection, scan summary, portability warnings, export action.
- Settings should use grouped rows and explicit paths.
- Coming Soon should be restrained and useful. It should not imply that deferred features already exist.

## 6. Implementation Guardrails

- Use the visual system as inspiration, not as a literal copy of every generated label.
- Keep the visible app name as **AI Skills Companion** unless the product name changes intentionally.
- Reject invented Stitch assumptions such as cloud vaults, accounts, premium tiers, shared libraries, skill creation workflows, and fake usage analytics.
- Do not implement social/profile UI from the mockups.
- Use the generated pages to guide density, color, hierarchy, and component relationships.
- In the React/Tailwind implementation, prefer semantic tokens and shared components over screen-local styling.
