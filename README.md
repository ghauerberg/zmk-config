# Piantor Pro BT — Keymap Reference

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
│hld:MOUSE│hld:⌘│hld:⌥│  hld:⌃  │hld:⌘│hld:NAV│     │     │hld:⌘│hld:⌃│  hld:⌥  │     │      │
│         │2×: å│     │         │     │     │       │     │     │     │         │     │      │
├─────────┼─────┼─────┼─────────┼─────┼─────┤       ├─────┼─────┼─────┼─────────┼─────┼──────┤
│   ⌘     │  Z  │  X  │    C    │  V  │  B  │       │  N  │  M  │  ,  │    .    │  /  │ DEL  │
│         │     │     │ hld:⌘C  │hld:⌘V│    │       │     │     │     │         │     │      │
└─────────┴─────┴─────┴─────────┴─────┴─────┘       └─────┴─────┴─────┴─────────┴─────┴──────┘
                             ┌──────┬─────┬───────┐ ┌───────┬─────┬─────┐
                             │  ⌥   │ NUM │ SHIFT │ │ SPACE │ SYM │ TAB │
                             └──────┴─────┴───────┘ └───────┴─────┴─────┘
```

**Home row mods** (hold, 250 ms):

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
                      │  ⌃   │  ▼  │ SHIFT │ │ SHIFT │   ~   │   *   │
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
