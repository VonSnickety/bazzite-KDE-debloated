# bazzite-kde

A minimal KDE Plasma desktop on Bazzite-DX focused on desktop gaming and development.

## Features

**Desktop Environment:**
*   **KDE Plasma:** Full-featured desktop with Wayland support
*   **SDDM:** Display manager
*   **Minimal Applications:** Dolphin, Konsole, Ark, Spectacle

**Gaming:**
*   **Steam:** Primary gaming platform (pre-installed in Bazzite)
*   **Lutris:** Alternative game launcher (pre-installed in Bazzite)
*   **MangoHud:** FPS overlay and performance monitoring
*   **GameMode:** Automatic performance optimizations

**Development Tools:**
*   VS Code, Docker, Podman (from Bazzite-DX base)
*   Container development support
*   System monitoring and debugging tools

**Utilities:**
*   Firefox browser
*   Fastfetch system information
*   Tmux terminal multiplexer

## What's Removed

This image aggressively removes bloat for a clean desktop experience:

*   **No handheld support** (Steam Deck, ROG Ally, etc.)
*   **No emulators** (RetroArch, Dolphin, PCSX2, etc.)
*   **No streaming tools** (OBS, Sunshine, Moonlight)
*   **No extra gaming launchers** (Heroic, Bottles)
*   **No accessibility tools**
*   **No printing/scanning support**
*   **No Android containers** (Waydroid)

## Installation

This image is built on Bazzite-DX. To switch to this image, run:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/vonsnickety/bazzite-hyprland:latest
```

After the command finishes, reboot your system:

```bash
systemctl reboot
```

## Customization

*   **Packages:** Modify `build_files/build.sh` to add or remove packages
*   **Desktop Settings:** Use KDE System Settings after installation
*   **User Configs:** Adjust files in `build_files/skel/.config/` (currently only fastfetch)

## Building Your Own Image

For instructions on building your own custom Bazzite image, see the [official Bazzite documentation](https://universal-blue.org/images/bazzite/building/).
