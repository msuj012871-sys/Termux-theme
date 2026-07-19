# SUMON — Boot Script 2.0 (exact match to the DARK reference)

This is `sumon_full.sh` — a self-contained script (no figlet/toilet
dependency, so it always renders correctly) that reproduces the exact
look of your reference screenshot:

- pink rounded box
- solid filled block letters, purple → blue → cyan gradient (left to right)
- green "Boot Script 2.0" bottom-right inside the box
- colored `[SUMON@termux]-(~)` prompt line
- runs `apt update && apt upgrade` at the end, just like the screenshot

## How to install it into your existing Termux-theme repo

```
cd ~/Termux-theme
grep -rl "SUMON" . --include="*.sh"
```
This shows you which file currently prints the banner (probably something
like `sumon/logo.sh`).

Replace that file's content with `sumon_full.sh` from this zip:

```
cp sumon_full.sh ~/Termux-theme/sumon/logo.sh   # adjust path to match what grep showed
chmod +x ~/Termux-theme/sumon/logo.sh
```

Then run your normal install/boot command again:

```
bash install.sh
```

## Or just test it standalone first

```
chmod +x sumon_full.sh
bash sumon_full.sh
```

## Customize

- `WORD="SUMON"` — change the text (only S,U,M,O,N letters are defined;
  ping me if you need other letters added to the pixel font).
- `GRAD=(...)` — the color sequence (256-color ANSI codes), left to right.
- `PIX="██"` — controls how "fat" each pixel block looks.
