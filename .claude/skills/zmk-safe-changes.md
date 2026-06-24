# ZMK Keymap Changes — Safety Guide

## Before editing the keymap

1. **Work on a feature branch** — never push untested changes to `main`.
2. **Read the file first** — understand the current layer structure, `#define` values,
   and behavior definitions before editing.

## Common pitfalls

### Invalid modifier macros

ZMK uses specific modifier function macros. Do NOT use generic names:

| Wrong | Correct | Notes |
|-------|---------|-------|
| `SHIFT(x)` | `LS(x)` or `RS(x)` | Left/Right Shift |
| `CTRL(x)` | `LC(x)` or `RC(x)` | Left/Right Control |
| `ALT(x)` | `LA(x)` or `RA(x)` | Left/Right Alt |
| `GUI(x)` | `LG(x)` or `RG(x)` | Left/Right GUI/Cmd |

Number keys use `N0`–`N9`, not bare digits: `&kp LS(N4)` not `&kp LS(4)`.

### Layer numbering

Layer indices are determined by the **order layers appear in the keymap node**, starting
at 0. The `#define` constants must match that order exactly. If you add, remove, or
reorder a layer, update ALL `#define` values.

**Verify:** count the layers in the `keymap {}` block top-to-bottom and confirm each
`#define` matches its position (0-indexed).

### Binding cell count

Every behavior has a fixed `#binding-cells` count:

| Cells | Examples |
|-------|----------|
| 0 | `&trans`, `&none`, `&td_quot`, macros |
| 1 | `&kp SPACE`, `&mo NUMBER`, `&to BASE` |
| 2 | `&hrm_l LALT S`, `&lt NAV G`, `&bt BT_SEL 0` |

A mismatch causes a DTS binding error. Count carefully when using hold-taps and
layer-taps — they always take exactly 2 arguments.

### Key count per layer

Every layer needs exactly **42 bindings** for a 3x6+3 split (Piantor Pro):
- 3 rows x 6 columns x 2 halves = 36
- 3 thumb keys x 2 halves = 6

A wrong count causes a silent misalignment or DTS error.

### Kconfig in `.conf` files

Zephyr strict mode rejects unknown Kconfig symbols. Only use symbols that exist in
ZMK's Zephyr base. `CONFIG_ZMK_*` options are ZMK-specific. `CONFIG_USB_*` and other
non-`ZMK` prefixes are Zephyr-level — verify they exist before adding.

**Not Kconfig:** `ZMK_POINTING_DEFAULT_MOVE_VAL` is a C preprocessor `#define`, not a
Kconfig symbol. Set it in the keymap file before `#include <dt-bindings/zmk/pointing.h>`,
not in `.conf`.

### User-defined behaviors

In ZMK v0.3, you **cannot** instantiate new nodes with `compatible = "zmk,behavior-mouse-move"`
or similar pointing behavior compatibles. Use the built-in `&mmv`, `&msc`, `&mkp` behaviors
with custom `MOVE_X()`/`MOVE_Y()` values via `#define` instead.

## Verification checklist

Before pushing, verify:

- [ ] Every `#define LAYER_NAME N` matches the layer's position in `keymap {}`
- [ ] Each layer has exactly 42 bindings
- [ ] No undefined modifier macros (`SHIFT`, `CTRL`, `ALT`, `GUI`)
- [ ] Number keys use `N0`–`N9` (not bare `0`–`9`)
- [ ] All `.conf` Kconfig symbols are valid (no undefined symbols)
- [ ] Hold-tap / layer-tap bindings have exactly 2 arguments
- [ ] Combos reference valid key positions (0–41 for Piantor)

## After pushing

Monitor the GitHub Actions build. Common error patterns in the CI log:

| Log pattern | Cause |
|-------------|-------|
| `SHIFT(4)` unexpanded in DTS | Invalid modifier macro |
| `Aborting due to Kconfig warnings` | Unknown `.conf` symbol |
| `lacks binding` | User-defined DTS node with unsupported `compatible` |
| Wrong number of cells | `#binding-cells` mismatch |
