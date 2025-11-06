#!/bin/bash

set -ouex pipefail

### Remove Bloat/Unused Packages

# Remove Waydroid (Android container support) - including selinux package
rpm-ostree override remove waydroid waydroid-selinux || true

# Remove Emulators (only remove if they exist)
rpm-ostree override remove \
    retroarch \
    pcsx2 \
    ppsspp \
    snes9x \
    nestopia \
    || true

# Remove VR Support (only remove if they exist)
rpm-ostree override remove \
    || true

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Basic utilities
dnf5 install -y tmux

### Hyprland Rice Setup

# Enable Hyprland COPR repository
dnf5 -y copr enable solopasha/hyprland

# Core Hyprland components
dnf5 install -y \
    hyprland \
    hyprpaper \
    hypridle \
    hyprlock \
    xdg-desktop-portal-hyprland

# Disable COPRs so they don't end up enabled on the final image
dnf5 -y copr disable solopasha/hyprland

# Status bar & launcher
dnf5 install -y \
    waybar \
    rofi-wayland

# Terminal emulator
dnf5 install -y kitty

# Essential Wayland utilities (removed cliphist, wf-recorder - not in Fedora repos)
dnf5 install -y \
    wl-clipboard \
    grim \
    slurp \
    swappy

# Notifications
dnf5 install -y mako

# System utilities
dnf5 install -y \
    brightnessctl \
    playerctl \
    pavucontrol \
    network-manager-applet \
    blueman

# Fonts for rice (these are likely already installed in bazzite-dx, install extra if available)
dnf5 install -y \
    fira-code-fonts \
    jetbrains-mono-fonts-all \
    fontawesome-fonts-all \
    || true

# File manager & viewers (using Dolphin from KDE)
dnf5 install -y \
    dolphin \
    imv \
    mpv \
    zathura \
    zathura-pdf-mupdf

# Theme engines
dnf5 install -y \
    qt5ct \
    qt6ct \
    kvantum \
    papirus-icon-theme

#### System Services

systemctl enable podman.socket


