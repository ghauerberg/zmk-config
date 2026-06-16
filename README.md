# Piantor Pro BT — Keymap Reference

> **⚠ This keymap requires the host OS to be set to Danish (no dead keys) layout.**
> On macOS: System Settings → Keyboard → Input Sources → Add Danish.
> On Linux (GNOME): Settings → Keyboard → Input Sources → Add Danish (no dead keys).
> Characters like `å` `æ` `ø` are produced by sending the scancode that the Danish layout
> interprets as that character (e.g. `&kp LBKT` → `å`, `&kp SEMI` → `æ`, `&kp SQT` → `ø`).
> Symbols `@` `|` `~` `` ` `` and `^` also change position; `$` stays the same (`⇧4`).

## Building & Flashing

### GitHub Actions (recommended)

Every push to this repo triggers a GitHub Actions build automatically. To get your firmware:

1. Push your changes to GitHub
2. Go to **Actions** → select the latest **Build ZMK firmware** run
3. Once green, download the `firmware` artifact (a `.zip`)
4. Unzip — you'll find these files for the Piantor:
   - `piantor_pro_bt_left-nice_view-zmk.uf2` — left half
   - `piantor_pro_bt_right-nice_view-zmk.uf2` — right half
   - `piantor_pro_bt_left-settings_reset-zmk.uf2` — left half settings reset
   - `piantor_pro_bt_right-settings_reset-zmk.uf2` — right half settings reset

### Flashing a half

Each half is flashed independently via USB:

1. Plug the half into your computer via USB-C
2. Double-tap the **reset button** on the PCB — the controller will mount as a USB drive called `NICENANO` (or similar)
3. Drag and drop the `.uf2` file onto the drive
4. The drive will disappear and the controller will reboot automatically
5. Repeat for the other half

> Flash the **right half first**, then the left. The left half is the central (USB/BLE host) and will try to pair with the right on first boot.

### Settings reset

If you're having pairing issues between the halves or with a host device, flash the settings reset firmware to both halves (in any order), then re-flash the normal firmware.

---

**Legend:**
- `tap` / `hold` / `2×` = single tap / hold / double tap
- `▼` = transparent (passes through to layer below)
- `·` = no action

---

## Layer 0 — QWERTY (Base)

```
┌─────────┬─────┬─────┬─────────┬─────┬─────┐       ┌─────┬─────┬─────┬─────────┬─────┬──────┐
│   TAB   │  Q  │  W  │    E    │  R  │  T  │       │  Y  │  U  │  I  │    O    │  P  │ BSPC │
│         │     │     │ 2×: æ   │     │     │       │     │     │     │  2×: ø  │     │      │
├─────────┼─────┼─────┼─────────┼─────┼─────┤       ├─────┼─────┼─────┼─────────┼─────┼──────┤
│   ESC   │  A  │  S  │    D    │  F  │  G  │       │  H  │  J  │  K  │    L    │  ;  │  RET │
│hld:MOUSE│hld:⌘│hld:⌥│  hld:⌃  │hld:⌘│hld:NAV│     │     │hld:⌘│hld:⌃│  hld:⌥  │ ①   │      │
│         │2×: å│     │         │     │     │       │     │     │     │         │     │      │
├─────────┼─────┼─────┼─────────┼─────┼─────┤       ├─────┼─────┼─────┼─────────┼─────┼──────┤
│   ⌘     │  Z  │  X  │    C    │  V  │  B  │       │  N  │  M  │  ,  │    .    │  /  │ DEL  │
│         │     │     │ hld:⌘C  │hld:⌘V│    │       │     │     │     │         │ ②   │      │
└─────────┴─────┴─────┴─────────┴─────┴─────┘       └─────┴─────┴─────┴─────────┴─────┴──────┘
                             ┌──────┬─────┬───────┐ ┌───────┬─────┬─────┐
                             │  ⌥   │ NUM │ SHIFT │ │ SPACE │ SYM │ TAB │
                             └──────┴─────┴───────┘ └───────┴─────┴─────┘
```

① `;` = `⇧,` (Shift+Comma) under Danish layout — also on NUMBER layer
② `/` = `⇧7` (Shift+N7) under Danish layout — also on NUMBER layer

**Home row mods** (hold, 280 ms):

| Key | Tap | Hold | Double tap |
|-----|-----|------|------------|
| ESC | Esc | MOUSE layer | — |
| A | a | ⌘ Cmd | å |
| S | s | ⌥ Alt | — |
| D | d | ⌃ Ctrl | — |
| F | f | ⌘ Cmd | — |
| G | g | NAV layer | — |
| J | j | ⌘ Cmd (right) | — |
| K | k | ⌃ Ctrl (right) | — |
| L | l | ⌥ Alt (right) | — |
| E | e | — | æ |
| O | o | — | ø |
| C | c | ⌘C (copy) | — |
| V | v | ⌘V (paste) | — |
| '/″ *(NUMBER layer)* | ' | — | " |
| -/_ *(NUMBER layer)* | - | — | _ |
| /\\ *(NUMBER layer)* | / | — | \ |

---

## Layer 1 — NUMBER (hold left NUM thumb)

```
┌──────┬─────┬─────┬─────┬─────┬─────┐       ┌─────┬─────┬─────┬─────┬─────┬──────┐
│  $   │  1  │  2  │  3  │  4  │  5  │       │  6  │  7  │  8  │  9  │  0  │ BSPC │
├──────┼─────┼─────┼─────┼─────┼─────┤       ├─────┼─────┼─────┼─────┼─────┼──────┤
│  ?   │ /\  │  %  │  @  │  :  │ -/_ │       │  +  │  {  │  (  │  )  │  }  │  =   │
│      │2×:\ │     │     │     │2×:_ │       │     │     │     │     │     │      │
├──────┼─────┼─────┼─────┼─────┼─────┤       ├─────┼─────┼─────┼─────┼─────┼──────┤
│  |   │  !  │  #  │  &  │  ^  │  ~  │       │ '/″ │  [  │  ]  │  `  │ /\  │      │
│      │     │     │     │     │     │       │2×:" │     │     │     │2×:\ │      │
└──────┴─────┴─────┴─────┴─────┴─────┘       └─────┴─────┴─────┴─────┴─────┴──────┘
                      ┌──────┬─────┬───────┐ ┌───────┬───────┬───────┐
                      │  ⌃   │  ▼  │ SHIFT │ │ SHIFT │   ~   │   `   │
                      └──────┴─────┴───────┘ └───────┴───────┴───────┘
```

---

## Layer 2 — SYMBOL (hold right SYM thumb)

```
┌──────┬──────┬──────┬──────┬──────┬──────┐       ┌───────┬───────┬───────┬───────┬─────┬──────┐
│ TAB  │  !   │  @   │  #   │  $   │  %   │       │ PG_UP │ PG_DN │ PG_UP │ HOME  │ END │ BSPC │
├──────┼──────┼──────┼──────┼──────┼──────┤       ├───────┼───────┼───────┼───────┼─────┼──────┤
│  ⌃   │⌘⇧4  │ ⌘⇧3  │  ·   │  ⌘   │  ·   │       │   ←   │   ↓   │   ↑   │   →   │ ESC │  `   │
│      │(scr4)│(scr3)│      │      │      │       │       │       │       │       │     │      │
├──────┼──────┼──────┼──────┼──────┼──────┤       ├───────┼───────┼───────┼───────┼─────┼──────┤
│  ⇧   │  ·   │  ·   │  ·   │  ·   │ ⌃B   │       │  ⌃R   │  ⌃W   │  ⌥H   │  ⌥L   │  |  │  ~   │
└──────┴──────┴──────┴──────┴──────┴──────┘       └───────┴───────┴───────┴───────┴─────┴──────┘
                      ┌──────┬───────┬───────┐ ┌───────┬───────┬───────┐
                      │  ⌥   │   ⌃   │ SHIFT │ │   ▼   │   ·   │   ▼   │
                      └──────┴───────┴───────┘ └───────┴───────┴───────┘
```

---

## Layer 3 — NAV (hold G)

```
┌──────┬──────┬──────┬──────┬────────┬──────┐       ┌─────────┬──────┬──────┬──────┬──────┬──────┐
│  ·   │  ·   │ ⌘⇧3  │ ⌘⇧4  │ ⌘⌫    │  ·   │       │ tmux [  │  ⌃B  │  ·   │  ·   │  ·   │  ·   │
│      │      │(scr3)│(scr4)│(delwrd)│      │       │(scrl)   │(pre) │      │      │      │      │
├──────┼──────┼──────┼──────┼────────┼──────┤       ├─────────┼──────┼──────┼──────┼──────┼──────┤
│  ·   │ BSPC │ ⇧TAB │ TAB  │  ESC   │  ▼   │       │ tmux P  │tmux N│  ·   │  ·   │  ·   │  ·   │
│      │      │      │      │        │      │       │(prev pn)│(nxt w│      │      │      │      │
├──────┼──────┼──────┼──────┼────────┼──────┤       ├─────────┼──────┼──────┼──────┼──────┼──────┤
│  ·   │ ESC  │ VOL- │ VOL+ │   ·    │  ·   │       │ tmux C  │  ·   │  ·   │  ·   │  ·   │  ·   │
│      │      │      │      │        │      │       │(new win)│      │      │      │      │      │
└──────┴──────┴──────┴──────┴────────┴──────┘       └─────────┴──────┴──────┴──────┴──────┴──────┘
                         ┌──────┬───────┬──────┐ ┌──────┬───────┬──────┐
                         │  ⌥   │ SPACE │  ⌘   │ │  ⌘   │ SPACE │  ⌥   │
                         └──────┴───────┴──────┘ └──────┴───────┴──────┘
```

---

## Layer 4 — MOUSE (hold ESC)

```
┌──────┬──────┬──────┬──────┬──────┬──────┐       ┌──────┬──────┬───────┬────────┬──────┬──────┐
│  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │       │  ▼   │  ▼   │ SCRL↑ │ SCRL↓  │  ▼   │  ▼   │
├──────┼──────┼──────┼──────┼──────┼──────┤       ├──────┼──────┼───────┼────────┼──────┼──────┤
│  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │       │  ←   │  ↓   │   ↑   │   →    │  ▼   │  ▼   │
├──────┼──────┼──────┼──────┼──────┼──────┤       ├──────┼──────┼───────┼────────┼──────┼──────┤
│  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │       │  ▼   │ SPC← │ SPC→  │   ·    │  ▼   │  ▼   │
│      │      │      │      │      │      │       │      │(⌘⌥←) │ (⌘⌥→) │        │      │      │
└──────┴──────┴──────┴──────┴──────┴──────┘       └──────┴──────┴───────┴────────┴──────┴──────┘
                         ┌──────┬──────┬───────┐ ┌──────┬──────┬────────┐
                         │ ⌘V   │  ⌘C  │ SHIFT │ │ BTN1 │ BTN2 │  BASE  │
                         └──────┴──────┴───────┘ └──────┴──────┴────────┘
```

---

## Macros

| Name | Keys sent | Purpose |
|------|-----------|---------|
| tmux `[` | `⌃B` → `[` | Enter scroll/copy mode |
| tmux P | `⌃B` → `p` | Previous pane |
| tmux N | `⌃B` → `n` | Next window |
| tmux C | `⌃B` → `c` | New window |
| tmux % | `⌃B` → `⇧7` | Vertical split |

---

## Layer Access Summary

| How | Layer |
|-----|-------|
| Hold **G** | NAV (layer 3) |
| Hold **ESC** | MOUSE (layer 4) |
| Hold left **NUM** thumb | NUMBER (layer 1) |
| Hold right **SYM** thumb | SYMBOL (layer 2) |

---

## Host Configuration

### macOS

1. **System Settings → Keyboard → Input Sources → Add "Danish"**
2. Set Danish as the Piantor's input source (per-app or per-device via input source menu extra)
3. No key remapping needed — macOS interprets HID scancodes correctly

### Linux (keyd for LGUI → LCTRL)

On Linux, the ZMK `&kp LGUI` (⌘ Cmd) key needs to act as Ctrl for shortcuts like ⌘C/⌘V. Use [keyd](https://github.com/rvaiya/keyd) to remap only the Piantor:

```ini
# /etc/keyd/default.conf (or /etc/keyd/piantor.conf)
[ids]
1d50:615e

[1d50:615e]
leftmeta = leftcontrol
```

1. Install keyd: `sudo dnf copr enable atim/keyd && sudo dnf install keyd`
2. Add the config block above to `/etc/keyd/default.conf`
3. Restart: `sudo systemctl restart keyd`

This makes `LGUI` (the `⌘` key at the Z-position) produce Ctrl on Linux, so ⌘C sends Ctrl+C, ⌘V sends Ctrl+V, etc.

2. **Set Danish (no dead keys) input source:**
   - Settings → Keyboard → Input Sources → Add "Danish (no dead keys)"
   - The "no dead keys" variant is required for `å` (via `&kp LBKT`) to work correctly

### Quick start after flashing

```bash
./post-flash-setup.sh
```

This script:
- Adds the Piantor‑specific keyd section to `/etc/keyd/default.conf`
- Restarts keyd
- Adds Danish (no dead keys) to your GNOME input sources
