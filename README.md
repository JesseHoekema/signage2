# Digital Signage

[![Co-authored with Claude Opus 4.6](https://img.shields.io/badge/Co--authored%20with-Claude%20Opus%204.6-cc785c?logo=anthropic&logoColor=white)](https://claude.ai)

A browser-based digital signage application built with Flask and vanilla JavaScript.

![Player View](screenshots/player-view.png)

## Quick Start

```bash
git clone https://github.com/AiryAir/signage2
cd signage2

# Linux/macOS
./run.sh

# Windows (PowerShell)
.\run.ps1
```

Open `http://localhost:5000` in your browser.

On first run, you'll be prompted to set an admin username and password.

## Features

### Widgets
- **Clock** — configurable 12/24h time format, multiple date formats
- **Countdown Timer** — with progress bar and color-coded warnings
- **Announcements** — static, crossfade carousel, or marquee scroll modes
- **RSS Feeds** — list, rotate, or ticker display modes with configurable refresh interval
- **iframes** — embed any web content
- **Images** — single image with cover fit
- **Videos** — local files or YouTube embeds with autoplay and mute toggle
- **Slideshows** — multi-image with configurable timer and crossfade
- **Weather** — current conditions, 3-day forecast via Open-Meteo API (no API key needed), geocoding search

### Layout & Display
- **Configurable Grid** — 1x1 up to 6x6 layouts with inline add/remove buttons
- **Zone Merging** — click merge handles between adjacent zones, split horizontally or vertically
- **Screen Resolution** — configurable resolution with presets, grid preview matches aspect ratio
- **Portrait Support** — set a portrait resolution (e.g. 1080x1920) for vertically mounted displays
- **Google Fonts** — 30+ font options for global and per-zone typography
- **Zone Backgrounds** — transparent, solid color, glassmorphism, or image per zone
- **Global Backgrounds** — solid color, CSS gradients, or uploaded images
- **Top Bar Modes** — always visible, overlay, auto-hide, or hidden
- **OLED Burn-in Protection** — periodic pixel shift to prevent static element burn-in

### Configuration
- **Two-Panel Editor** — Figma-style layout with grid preview on the left and context panel on the right
- **Inline Grid Editing** — add rows/columns with `+` buttons on grid edges, remove specific rows/columns with `x` buttons
- **Inline Editing** — click a zone to edit; no modals, changes save to state instantly
- **Display Settings Access** — `← Display Settings` button in zone editor for quick navigation
- **Zone Type Picker** — visual card grid with icons instead of dropdowns
- **Tabbed Zone Editor** — Content, Style, and Schedule tabs per zone
- **Accordion Settings** — collapsible global settings sections (background, typography, top bar, screen, burn-in)
- **Live Preview** — toggle a slide-out panel with real-time iframe preview
- **Toast Notifications** — non-blocking feedback replaces alert dialogs
- **Unsaved Changes Warning** — pulsing save button and beforeunload prompt

### Management
- **Multi-Display** — manage unlimited displays from one dashboard
- **Real-Time Updates** — config changes push instantly to displays via Server-Sent Events (SSE)
- **Remote Management** — heartbeat polling with online/offline status indicators as fallback
- **Content Scheduling** — time-based and day-of-week content overrides per zone

## Installation

### Linux / macOS

```bash
./run.sh
```

### Windows (PowerShell)

```powershell
.\run.ps1
```

### Docker

```bash
docker compose up -d
```

The run scripts automatically create a virtual environment and install dependencies.

## Usage

1. Login at `http://localhost:5000`
2. Create a new display from the dashboard
3. Click **Configure** to open the two-panel editor
4. Use the `+` / `x` buttons on the grid edges to add or remove rows and columns
5. Click a zone to select it — the right panel shows Content, Style, and Schedule tabs
6. Click the merge handles (blue circles) between zones to merge them
7. Pick a zone type from the card grid, configure its settings
8. Click `← Display Settings` to access global settings (background, font, top bar, screen, burn-in)
9. Hit **Save Changes** — connected displays update instantly via SSE
10. Open the player URL in fullscreen on your display device

### Weather Widget
1. Click a zone and set type to "Weather"
2. Enter a city name and click **Search** to geocode
3. Choose temperature units (C/F) and refresh interval

### Zone Merging
1. Click the blue merge handle (circle) between two adjacent zones
2. The zones combine into one
3. To split, click the horizontal or vertical split icon on a merged zone

### Content Scheduling
1. Select a zone (announcement, image, video, slideshow, iframe, or RSS)
2. Switch to the **Schedule** tab
3. Click **Add Schedule** to create time-based content overrides
4. Set start/end times, select active days, and enter override content

### Remote Management
- Display cards show green "Online" / grey "Offline" badges
- Players connect via SSE for instant config updates on save
- Heartbeat polling (every 30s) as fallback if SSE disconnects

## Reset Password

Run `./run.sh` (or `.\run.ps1`) and choose option **3** from the menu.

## Screenshots

| Player | Config | Dashboard |
|--------|--------|-----------|
| ![Player](screenshots/player-view.png) | ![Config](screenshots/display-config.png) | ![Dashboard](screenshots/admin-dashboard.png) |

## License

Open source. Use freely.
