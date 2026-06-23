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

## OS-Mode Switching

This keymap has two complete sets of layers — one for macOS (US layout) and one for Linux (Danish nodeadkeys layout). The OLED shows **`MAC`** or **`LNX`** to indicate the active mode.

**Toggle between modes:**
1. Press **ESC + G** together → BT layer
2. Press the **left thumb** (inner) → switch to **MAC** mode
3. Press the **right thumb** (inner) → switch to **LNX** mode

---

**Legend:**
- `tap` / `hold` = single tap / hold
- `▼` = transparent (passes through to layer below)
- `·` = no action

Layout applies to both MAC and LNX modes unless noted with **(MAC)** or **(LNX)**.

---

## Layer 0 — MAC / Layer 1 — LNX (Base)

```
┌─────────┬─────┬─────┬───────┬─────┬─────┐       ┌─────┬─────┬─────┬───────┬─────┬──────┐
│   TAB   │  Q  │  W  │   E   │  R  │  T  │       │  Y  │  U  │  I  │   O   │  P  │ BSPC │
│         │     │     │(MAC)æ │     │     │       │     │     │     │(MAC)ø │     │      │
│         │     │     │(LNX)æ │     │     │       │     │     │     │(LNX)ø │     │      │
├─────────┼─────┼─────┼───────┼─────┼─────┤       ├─────┼─────┼─────┼───────┼─────┼──────┤
│   ESC   │  A  │  S  │   D   │  F  │  G  │       │  H  │  J  │  K  │   L   │  ;  │  RET │
│hld:MOUSE│(MAC)å│hld:⌥│ hld:⌃ │hld:⌘│hld:NAV│     │     │hld:⌘│hld:⌃│ hld:⌥  │(LNX);│      │
│         │(LNX)å│     │       │     │       │       │     │     │     │        │(MAC);│      │
├─────────┼─────┼─────┼───────┼─────┼─────┤       ├─────┼─────┼─────┼────────┼──────┼──────┤
│   ⌘/⌃   │  Z  │  X  │   C   │  V  │  B  │       │  N  │  M  │  ,  │   .    │  /   │ DEL  │
│MAC:⌘    │     │     │hld:⌘C  │hld:⌘V│     │       │     │     │     │        │(LNX)?│      │
│LNX:⌃    │     │     │hld:⌃C  │hld:⌃V│     │       │     │     │     │        │      │      │
└─────────┴─────┴─────┴───────┴─────┴─────┘       └─────┴─────┴─────┴────────┴──────┴──────┘
                       ┌──────┬───────┬───────┐ ┌───────┬───────┬─────┐
                       │ ⌘/⌃  │  NUM  │ SHIFT │ │ SPACE │  SYM  │ TAB │
                       │MAC:⌘ │       │       │ │       │       │     │
                       │LNX:⌃ │       │       │ │       │       │     │
                       └──────┴───────┴───────┘ └───────┴───────┴─────┘
```

**Danish characters (MAC)** — via Option combos (macOS US layout):
| Hold | Result |
|------|--------|
| A hold | å |
| E hold | æ |
| O hold | ø |

**Danish characters (LNX)** — via hold-taps (Danish layout):
| Key | Tap | Hold |
|-----|-----|------|
| E | e | æ |
| A | a | å |
| O | o | ø |
| ; | ; (LS(COMMA)) | : (LS(DOT), shift) |
| / | / (LS(N7)) | ? (LS(MINUS), shift) |

**Home row mods** (hold, balanced, 280ms, opposite-hand only):

| Key | Tap | Hold |
|-----|-----|------|
| ESC | Esc | MOUSE layer |
| A | a | å (MAC) / å (LNX) |
| S | s | ⌥ Alt |
| D | d | ⌃ Ctrl |
| F | f | ⌘ Cmd |
| G | g | NAV layer |
| J | j | ⌘ Cmd (right) |
| K | k | ⌃ Ctrl (right) |
| L | l | ⌥ Alt (right) |
| C | c | ⌘C / ⌃C (copy) |
| V | v | ⌘V / ⌃V (paste) |

---

## Layer 2 — NUM_MAC / Layer 3 — NUM_LINUX

**MAC** (US layout):

```
┌──────┬─────┬─────┬─────┬─────┬─────┐       ┌─────┬─────┬─────┬─────┬─────┬──────┐
│  $   │  1  │  2  │  3  │  4  │  5  │       │  6  │  7  │  8  │  9  │  0  │ BSPC │
├──────┼─────┼─────┼─────┼─────┼─────┤       ├─────┼─────┼─────┼─────┼─────┼──────┤
│  ?   │ /\  │  %  │  @  │  :  │ -/_ │       │  +  │  {  │  (  │  )  │  }  │  =   │
│      │2×:\ │     │     │     │2×:_ │       │     │     │     │     │     │      │
├──────┼─────┼─────┼─────┼─────┼─────┤       ├─────┼─────┼─────┼─────┼─────┼──────┤
│  |   │  !  │  #  │  &  │  ^  │  ~  │       │ '/" │  [  │  ]  │  `  │ /\  │      │
│      │     │     │     │     │     │       │2×:" │     │     │     │2×:\ │      │
└──────┴─────┴─────┴─────┴─────┴─────┘       └─────┴─────┴─────┴─────┴─────┴──────┘
                      ┌──────┬─────┬───────┐ ┌───────┬───────┬───────┐
                      │  ⌃   │  ▼  │ SHIFT │ │ SHIFT │   ~   │   `   │
                      └──────┴─────┴───────┘ └───────┴───────┴───────┘
```

**LNX** (Danish layout):

```
┌──────┬─────┬─────┬─────┬─────┬─────┐       ┌─────┬─────┬─────┬─────┬─────┬──────┐
│  $   │  1  │  2  │  3  │  4  │  5  │       │  6  │  7  │  8  │  9  │  0  │ BSPC │
│⌥4    │     │     │     │     │     │       │     │     │     │     │     │      │
├──────┼─────┼─────┼─────┼─────┼─────┤       ├─────┼─────┼─────┼─────┼─────┼──────┤
│  ?   │ /\  │  %  │  @  │  ;  │ -/_ │       │  -  │  {  │  (  │  )  │  }  │  =   │
│⇧-    │hld:\ │     │⌥2   │⇧.   │hld:_│       │     │⌥7   │⇧8   │⇧9   │⌥0   │⇧0    │
├──────┼─────┼─────┼─────┼─────┼─────┤       ├─────┼─────┼─────┼─────┼─────┼──────┤
│  |   │  !  │  #  │  &  │  ^  │  ~  │       │ '"/ │  [  │  ]  │  `  │ /\  │      │
│⌥=    │     │     │⇧6   │⇧]   │⌥]   │       │hld:"│⌥8   │⌥9   │⇧=   │hld:\│      │
└──────┴─────┴─────┴─────┴─────┴─────┘       └─────┴─────┴─────┴─────┴─────┴──────┘
                      ┌──────┬─────┬───────┐ ┌───────┬───────┬───────┐
                      │  ⌃   │  ▼  │ SHIFT │ │ SHIFT │   ~   │   `   │
                      │      │     │       │ │       │  ⌥]   │  ⇧=   │
                      └──────┴─────┴───────┘ └───────┴───────┴───────┘
```

`\` on LNX layer is a placeholder — needs testing on Linux.

---

## Layer 4 — SYM_MAC / Layer 5 — SYM_LINUX

**MAC** (US layout):

```
┌──────┬──────┬──────┬──────┬──────┬──────┐       ┌───────┬───────┬───────┬───────┬─────┬──────┐
│ TAB  │  !   │  @   │  #   │  $   │  %   │       │ PG_UP │ PG_DN │ PG_UP │ HOME  │ END │ BSPC │
├──────┼──────┼──────┼──────┼──────┼──────┤       ├───────┼───────┼───────┼───────┼─────┼──────┤
│  ⌃   │ ⌘⇧4  │ ⌘⇧3  │  ·   │  ⌘   │  ·   │       │   ←   │   ↓   │   ↑   │   →   │ ESC │  `   │
├──────┼──────┼──────┼──────┼──────┼──────┤       ├───────┼───────┼───────┼───────┼─────┼──────┤
│  ⇧   │  ·   │  ·   │  ·   │  ·   │ ⌃B   │       │  ⌃R   │  ⌃W   │  ⌥H   │  ⌥L   │  |  │  ~   │
└──────┴──────┴──────┴──────┴──────┴──────┘       └───────┴───────┴───────┴───────┴─────┴──────┘
                      ┌──────┬──────┬───────┐ ┌───────┬───────┬───────┐
                      │  ⌥   │  ⌃   │ SHIFT │ │   ▼   │   ·   │   ▼   │
                      └──────┴──────┴───────┘ └───────┴───────┴───────┘
```

**LNX** (Danish layout): same visual layout, different HID codes for `@` (`⌥2`), `$` (`⌥4`), `` ` `` (`⇧=`), `|` (`⌥=`), `~` (`⌥]`).

---

## Layer 6 — NAV (hold G, shared)

```
┌──────┬──────┬──────┬──────┬────────┬──────┐       ┌─────────┬──────┬──────┬──────┬──────┬──────┐
│  ·   │  ·   │ ⌘⇧3  │ ⌘⇧4  │ ⌘⌫    │ BT   │       │ tmux[   │  ⌃B  │  ·   │  ·   │  ·   │  ·   │
│      │      │(scr3)│(scr4)│(delwrd)│clear │       │(scroll) │(prev)│      │      │      │      │
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

## Layer 7 — MOUSE_MAC / Layer 8 — MOUSE_LINUX (hold ESC)

**MAC** (Cmd+C/V):

```
┌──────┬──────┬──────┬──────┬──────┬──────┐       ┌──────┬──────┬───────┬────────┬──────┬──────┐
│  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │       │  ▼   │  ▼   │ SCRL↑ │ SCRL↓  │  ▼   │  ▼   │
├──────┼──────┼──────┼──────┼──────┼──────┤       ├──────┼──────┼───────┼────────┼──────┼──────┤
│  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │       │  ←   │  ↓   │   ↑   │   →    │  ▼   │  ▼   │
├──────┼──────┼──────┼──────┼──────┼──────┤       ├──────┼──────┼───────┼────────┼──────┼──────┤
│  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │  ▼   │       │  ▼   │ SPC← │ SPC→  │   ·    │  ▼   │  ▼   │
└──────┴──────┴──────┴──────┴──────┴──────┘       └──────┴──────┴───────┴────────┴──────┴──────┘
                       ┌──────┬──────┬───────┐ ┌──────┬──────┬───────────┐
                       │ ⌘V   │  ⌘C  │ SHIFT │ │ BTN1 │ BTN2 │ BASE_MAC  │
                       └──────┴──────┴───────┘ └──────┴──────┴───────────┘
```

**LNX** (Ctrl+C/V): same layout, thumbs are `⌃V` / `⌃C` / `BASE_LINUX`.

---

## Layer 9 — BT (ESC+G combo)

| Key | Action |
|-----|--------|
| Right home row (J K L ;) | BT profile 0-3 |
| Left middle thumb | `&to BASE_LINUX` |
| Left inner thumb (most right of left cluster) | `&to BASE_MAC` |

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
| Hold **G** | NAV (layer 6) |
| Hold **ESC** | MOUSE (layer 7/8) |
| Hold **NUM** thumb | NUM_MAC / NUM_LINUX (layer 2/3) |
| Hold **SYM** thumb | SYM_MAC / SYM_LINUX (layer 4/5) |
| **ESC + G** (combo) | BT (layer 9) |
