#!/usr/bin/env bash
set -euo pipefail

# post-flash-setup.sh — run once after flashing Piantor Pro BT firmware.
# Configures keyd for this keyboard only.

PIANTOR_ID="1d50:615e"

if ! command -v keyd &>/dev/null; then
    echo "Install keyd first:"
    echo "  sudo dnf copr enable atim/keyd && sudo dnf install keyd"
    exit 1
fi

# Remove any stale Piantor section first
sudo sed -i '/^\['"$PIANTOR_ID"'\]/,/^\[/ { /^\['"$PIANTOR_ID"'\]/d; /^\[/!d }' /etc/keyd/default.conf 2>/dev/null || true

# Append Piantor-specific section
sudo tee -a /etc/keyd/default.conf &>/dev/null <<PIANTOR

[$PIANTOR_ID]
leftmeta = leftcontrol
shift+rightalt+7 = backslash
PIANTOR

sudo systemctl restart keyd
echo "Done — Piantor: LGUI→LCTRL, ÷→\\"
