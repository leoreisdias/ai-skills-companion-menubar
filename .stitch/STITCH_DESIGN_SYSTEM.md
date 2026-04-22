# Stitch Design System Export

**Project ID:** `14905588168099202156`
**Asset:** `assets/a77fb7d66c7b4003a0aee2ca7108c756`
**Display Name:** `Arcane Ivory`
**Theme:** light, Inter, 8px roundness
**Primary Color:** `#2F3A32`

This file preserves the design-system content exposed by the Stitch MCP. Use `.stitch/DESIGN.md` for implementation guidance; use this file when you want to see the generated source language Stitch attached to the project.

## Generated Design MD

# Design System Specification: The Tactile Architect

This document outlines the visual language and structural logic for a high-end AI Skills Companion. This design system moves beyond the "standard" developer tool aesthetic by prioritizing tonal depth, editorial-grade typography, and a "Tactile Architect" philosophy. The goal is to create an environment that feels like a premium, physical workspace: precise, warm, and highly intentional.

## 1. Overview & Creative North Star

**Creative North Star: The Tactile Architect**

This system rejects the cold, sterile nature of traditional developer environments in favor of "Soft Utility." We treat the interface as a series of stacked, premium materials. It is defined by high-density information layouts that remain breathable through intentional asymmetry and a sophisticated neutral palette.

Unlike generic frameworks, this design system breaks the "template" look by using tonal layering instead of rigid borders. It is designed to feel like high-quality stationery or a physical desktop: utilitarian yet premium.

## 2. Colors

The palette is rooted in warm neutrals to reduce eye strain during long development sessions, contrasted by a deep, authoritative forest-green accent.

### Surface Hierarchy And The No-Line Rule

To achieve a high-end editorial feel, explicit 1px solid borders for sectioning are discouraged. Boundaries should be defined through background color shifts or tonal transitions.

- **Canvas (`background`):** `#FBF9F3`
- **Surface Low (`surface_container_low`):** `#F5F3ED`
- **Surface High (`surface_container_highest`):** `#E4E2DD`
- **Primary (`primary`):** `#1A241D`
- **Accent Container (`primary_container`):** `#2F3A32`
- **Secondary Text:** `#6C655B`

## 3. Typography

The typography uses Inter to keep small-scale utility UI readable while preserving an editorial quality at larger sizes.

- **Display and Headline:** around `1.5rem` for main module titles.
- **Titles:** around `1rem` for component headers.
- **Body:** `0.875rem` and `0.75rem` for dense tool UI.
- **Labels:** small uppercase labels can be used for metadata and tags.

## 4. Elevation And Depth

Depth is a function of light and material, not heavy artificial shadows.

- **Tonal Layering:** static containers should generally use surface changes instead of shadows.
- **Ghost Border:** if a boundary is required, use `outline_variant` (`#C3C8C2`) at low opacity.
- **Ambient Shadows:** floating menus can use soft shadows such as `0 12px 32px rgba(36, 34, 31, 0.06)`.
- **Subtle Blur:** floating Mac-native overlays may use backdrop blur with a mostly opaque surface color.

## 5. Components

### Buttons

- **Primary:** `#1A241D` background, white text, 8px radius, no gradient.
- **Secondary/Tonal:** warm neutral fills such as `#EBE1D4`.
- **Hover:** deepen the tone instead of brightening it.

### Input Fields

- **Surface:** `#FFFFFF`
- **Border:** low-opacity ghost outline.
- **Focus:** 1px charcoal-green border rather than a bright blue ring.

### Cards And Lists

- Prefer tonal states and whitespace over hard dividers.
- Use 8px radius for containers and 4px radius for nested controls like chips and code blocks.

### AI Skill Chip

Use a soft green-on-green treatment, for example `#D9E6DA` background with `#131E17` text, to identify AI-specific states without neon styling.

## 6. Do And Do Not

### Do

- Use whitespace and tonal surfaces as separators.
- Use asymmetrical utility layouts when they improve scanning.
- Maintain accessible contrast.

### Do Not

- Do not use pure black for primary text.
- Do not rely on standard hard borders as the main sectioning device.
- Do not use bright saturated colors for status indicators.

## Named Color Tokens From Stitch

| Token | Value |
| --- | --- |
| `background` | `#fbf9f3` |
| `surface` | `#fbf9f3` |
| `surface_container_lowest` | `#ffffff` |
| `surface_container_low` | `#f5f3ed` |
| `surface_container` | `#f0eee8` |
| `surface_container_high` | `#eae8e2` |
| `surface_container_highest` | `#e4e2dd` |
| `on_background` | `#1b1c18` |
| `on_surface` | `#1b1c18` |
| `on_surface_variant` | `#434844` |
| `primary` | `#1a241d` |
| `primary_container` | `#2f3a32` |
| `primary_fixed` | `#d9e6da` |
| `secondary` | `#645d54` |
| `secondary_container` | `#ebe1d4` |
| `outline` | `#747873` |
| `outline_variant` | `#c3c8c2` |
| `error` | `#ba1a1a` |
| `error_container` | `#ffdad6` |
