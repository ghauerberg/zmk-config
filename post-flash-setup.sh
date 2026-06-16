#!/usr/bin/env bash
set -euo pipefail

# post-flash-setup.sh
# Run AFTER flashing the new firmware (feature/linux-mac branch).
# Sets up Linux host to work with the Danish-layout keymap.

echo "=== Post-flash setup for Piantor Pro BT (Danish layout) ==="

# ── 1. Keyd: remap LGUI → LCTRL on the Piantor only ──
if command -v keyd &>/dev/null; then
    # Check if Piantor section already exists
    if grep -q '^1d50:615e' /etc/keyd/default.conf 2>/dev/null; then
        echo "✓ Piantor already configured in /etc/keyd/default.conf"
    else
        echo "Adding Piantor section to /etc/keyd/default.conf..."
        sudo tee -a /etc/keyd/default.conf &>/dev/null <<'KEYDEOF'

[1d50:615e]
leftmeta = leftcontrol
KEYDEOF
        sudo systemctl restart keyd
        echo "✓ keyd restarted — LGUI→LCTRL active for Piantor"
    fi
else
    echo "⚠ keyd not found. Install it: sudo dnf copr enable atim/keyd && sudo dnf install keyd"
fi

# ── 2. Danish input source (GNOME Wayland) ──
if command -v gsettings &>/dev/null; then
    current_sources=$(gsettings get org.gnome.desktop.input-sources sources 2>/dev/null || echo "")
    if echo "$current_sources" | grep -qi 'dk'; then
        echo "✓ Danish input source already present"
    else
        echo "Adding Danish (no dead keys) input source..."
        # GNOME stores sources as [('xkb', 'us'), ('xkb', 'dk+nodeadkeys'), ...]
        new_sources=$(echo "$current_sources" | sed "s/]$/, ('xkb', 'dk+nodeadkeys')]/")
        gsettings set org.gnome.desktop.input-sources sources "$new_sources" 2>/dev/null && \
            echo "✓ Danish (no dead keys) added — switch to it in top-right menu" || \
            echo "⚠ Could not set input source. Add manually: Settings → Keyboard → Input Sources → + → Danish (no dead keys)"
    fi
else
    echo "⚠ gsettings not available. Add Danish layout manually:"
    echo "   Settings → Keyboard → Input Sources → + → Danish (no dead keys)"
fi

# ── 3. Per-device input source via udev rule (optional) ──
# This makes the Danish layout apply automatically when the Piantor is plugged in.
# Requires python3 and the input-remapper or a custom udev rule.
echo
echo "=== Per-device layout (optional) ==="
echo "GNOME Wayland does NOT support per-device input sources natively."
echo "For fully automatic switching, consider:"
echo "  - A manual keyboard shortcut to toggle layouts"
echo "  - A udev rule + script (see docs/ for examples)"
echo "  - Using the input-source switcher in the top bar"

echo
echo "=== Done ==="
echo "1. Switch to Danish (no dead keys) input source (top-right menu)"
echo "2. Test double-tap A/E/O → å/æ/ø"
echo "3. Test ⌘C/⌘V on Linux (now sends Ctrl+C/V via keyd)"
