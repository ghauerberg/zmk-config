# Piantor Pro BT — Keymap Reference

> **Host layout matters.** The firmware sends HID scancodes; the host OS decides
> which character each one produces. This keymap's symbol layers use
> **US-layout positions**, and the Danish letters (å/æ/ø) are produced with
> **macOS Option combos**. On Linux the same scancodes resolve differently — see
> [macOS vs Linux differences](#macos-vs-linux-differences).

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

The right-most right thumb is `*` via the **keypad asterisk** scancode
(`&kp KP_ASTERISK`, HID `0x55`). Keypad scancodes are not translated by the host
layout, so it reliably types `*` on every host — unlike `&kp STAR`, which is
`Shift+8` (`*` on Linux Danish but `(` on macOS Danish).

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

## macOS vs Linux differences

The firmware emits the same HID scancodes on both platforms, so the host layout
decides the character. This keymap was written against a **US-position host
layout on macOS**, with Danish letters added as Option combos. The audit below
was checked against the macOS Danish keylayout and the X11 `dk(nodeadkeys)`
layout.

### Works the same on both (no change needed)

| Character | Keymap binding | macOS | Linux |
|-----------|----------------|-------|-------|
| `*` *(right thumb)* | `&kp KP_ASTERISK` | keypad `*` | keypad `*` |
| `$` | `&kp DLLR` | Shift+4 | Shift+4 |
| `%` | `&kp PRCNT` | Shift+5 | Shift+5 |
| `&` | `&kp AMPS` | Shift+6 | Shift+6 |
| `/` | `&kp FSLH` | Shift+7 | Shift+7 |
| `(` `)` | `&kp LPAR` `&kp RPAR` | Shift+8 / Shift+9 | Shift+8 / Shift+9 |
| `+` | `&kp PLUS` | `+` | `+` |

### Differs — handle per OS

`US` = US-position host layout (what main assumes). `DK` = Danish (no dead keys).

| Character | macOS (US positions) | Linux (Danish) | Recommended fix |
|-----------|----------------------|----------------|-----------------|
| `@` | `&kp AT` (Shift+2) | `AltGr+2` = `&kp RA(N2)` | `&kp RA(N2)` |
| `\` | `&kp BSLH` (the `\` key) | `AltGr+<` = `&kp RA(NUBS)` | `&kp RA(NUBS)` |
| `\|` | `&kp PIPE` (Shift+`\`) | `AltGr+<` = `&kp RA(NUBS)` | `&kp RA(NUBS)` |
| `~` | `&kp TILDE` (Shift+`` ` ``) | `AltGr+¨` = `&kp RA(RBKT)` | `&kp RA(RBKT)` |
| `` ` `` | `&kp GRAVE` | `Shift+¨` = `&kp LS(RBKT)` | `&kp LS(RBKT)` |
| `:` | `&kp COLON` (Shift+;) | `Shift+.` = `&kp LS(DOT)` | `&kp LS(DOT)` |
| `?` | `&kp QMARK` (Shift+/) | `Shift+-` = `&kp LS(MINUS)` | `&kp LS(MINUS)` |
| `å` `æ` `ø` | `&kp LA(A)` `&kp LA(SQT)` `&kp LA(O)` | Option combos (same) | no change |
| `;` `,` `.` `-` | `&kp SEMI` etc. | same on Danish | no change |

The Danish letters only work if the host is set to Danish (no dead keys) on both
OSes; on a US host they print `å`/`ø`/`¨`.

The cleanest resolution is a **two-layer OS split** (a BASE/NUMBER/SYMBOL set per
OS, toggled at runtime like the `feature/os-mode-layers` branch), so each platform
gets its own exact binding instead of one compromise set.

### `⌘` vs `Ctrl`

The base-layer `⌘` (Z position) is `LGUI`. macOS shortcuts (⌘C/⌘V, ⌘⇧3/4) use it
directly. On Linux, either send `LC(...)`/`LCTRL` in a Linux layer, or remap the
keyboard's `leftmeta` → `leftcontrol` with
[keyd](https://github.com/rvaiya/keyd) (see the `feature/linux-mac` branch's
`keyd-piantor.conf`).
