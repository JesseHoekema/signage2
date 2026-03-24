# Digital Signage

[![Co-authored with Claude Opus 4.6](https://img.shields.io/badge/Co--authored%20with-Claude%20Opus%204.6-cc785c?logo=anthropic&logoColor=white)](https://claude.ai)

A browser-based digital signage system built with Flask and vanilla JavaScript. Design layouts, configure widgets, and push updates to displays in real time.

![Player View](screenshots/player-view.png)

## Quick Start

```bash
git clone https://github.com/AiryAir/signage2
cd signage2
./run.sh        # Linux/macOS
.\run.ps1       # Windows PowerShell
```

Open `http://localhost:5000`. On first run you'll set an admin password.

Docker: `docker compose up -d`

## Features

**Widgets**: Clock, countdown timer, announcements (static/crossfade/marquee), RSS feeds (list/rotate/ticker), weather (Open-Meteo, no API key), images, videos (with mute toggle), slideshows, iframes

**Layout**: 1x1 to 6x6 grid with inline add/remove buttons, zone merging via click handles, horizontal and vertical splitting, configurable screen resolution with portrait support, OLED burn-in protection

**Editor**: Two-panel Figma-style config editor, visual zone type picker, per-zone Content/Style/Schedule tabs, live preview, 30+ Google Fonts, zone backgrounds (transparent/color/glass/image), global backgrounds (color/gradient/image)

**Management**: Multi-display dashboard, real-time config push via SSE, heartbeat polling fallback, per-zone content scheduling by time and day

<details>
<summary><strong>Full feature list</strong></summary>

### Widgets
- Clock with 12/24h format and multiple date formats
- Countdown timer with progress bar and color-coded warnings
- Announcements with static, crossfade, and marquee scroll modes
- RSS feeds with list, rotate, and ticker modes, configurable refresh interval (1-60 min)
- Weather with current conditions, 3-day forecast, geocoding search (Open-Meteo, no API key)
- Images with cover fit
- Videos with local file and YouTube embed support, mute toggle (always muted in preview)
- Slideshows with configurable timer and crossfade transitions
- iframes for embedding any web content

### Layout & Display
- 1x1 to 6x6 grid layouts
- Inline grid editing: green `+` buttons to add rows/columns, red `x` buttons to remove specific rows/columns
- Zone merging via blue click handles between adjacent zones
- Horizontal and vertical zone splitting
- Screen resolution presets (Full HD, QHD, 4K, ultrawide, square) or custom width x height
- Portrait display support for vertically mounted screens
- Per-zone backgrounds: transparent, solid color with opacity, glassmorphism with blur, or image
- Global backgrounds: solid color, CSS gradients, or uploaded images
- Top bar modes: always visible, overlay, auto-hide, or hidden with configurable font weight
- OLED burn-in protection with configurable pixel shift interval
- Per-zone opacity control
- Staggered entrance animations

### Editor
- Two-panel layout: grid preview on the left, context panel on the right
- Click a zone to edit, `← Display Settings` button to go back to global settings
- Visual zone type picker with icon cards
- Per-zone tabs: Content, Style, and Schedule
- Collapsible accordion sections for all settings
- Live preview in a slide-out iframe panel
- Unsaved changes warning with pulsing save button
- Toast notifications for save/error feedback
- 30+ Google Fonts with per-zone or global selection

### Real-Time & Management
- Multi-display dashboard with create/delete
- Real-time config push via Server-Sent Events (SSE), no page reload needed
- Heartbeat polling (every 30s) as fallback with online/offline status badges
- Per-zone content scheduling by time range and day of week
- Auto-refresh every 5 minutes as final fallback
- Public player URLs (no auth required for display screens)
- File uploads for images and backgrounds (16MB limit)

### Deployment
- Single Flask app, no build step, no frontend framework
- SQLite database, zero external services (except Open-Meteo for weather)
- Docker Compose with optional nginx reverse proxy
- Cross-platform startup scripts (bash + PowerShell) with venv management
- Admin credential setup on first run

</details>

## Usage

1. Login and create a display from the dashboard
2. Click **Configure** to open the editor
3. Use `+` / `x` buttons on grid edges to add or remove rows and columns
4. Click a zone to edit it, or click the blue circles between zones to merge them
5. Click `← Display Settings` for global options (background, fonts, screen, burn-in)
6. Hit **Save Changes**. Connected displays update instantly.
7. Open the player URL fullscreen on your display device

## Reset Password

Run `./run.sh` (or `.\run.ps1`) and choose option **3**.

## Screenshots

| Player | Config | Dashboard |
|--------|--------|-----------|
| ![Player](screenshots/player-view.png) | ![Config](screenshots/display-config.png) | ![Dashboard](screenshots/admin-dashboard.png) |

## License

Open source. Use freely.
