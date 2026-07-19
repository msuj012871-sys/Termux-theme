# SUMON 9X — Boot Script 2.0

Same pink-border box + gradient block-text + green "Boot Script 2.0"
style as your screenshot, just rebranded from **DARK** to **SUMON 9X**.

## Install in Termux

1. Copy `sumon9x.sh` into Termux (e.g. via a file manager, `termux-setup-storage`,
   or `curl`/`scp`).
2. Make it executable:
   ```
   chmod +x sumon9x.sh
   ```
3. Test it:
   ```
   bash sumon9x.sh
   ```
4. To make it run automatically every time Termux starts, add it to your
   `.bashrc`:
   ```
   echo 'bash ~/sumon9x.sh' >> ~/.bashrc
   ```
5. To make it a real **boot script** (runs on device boot, needs the
   Termux:Boot add-on app installed from F-Droid/Play Store):
   ```
   mkdir -p ~/.termux/boot
   cp sumon9x.sh ~/.termux/boot/sumon9x.sh
   chmod +x ~/.termux/boot/sumon9x.sh
   ```

## Customize

- Colors are set near the top of the script (`PINK`, `GREEN`, `C1`–`C6`)
  using 256-color ANSI codes — change the numbers after `38;5;` to shift
  the palette.
- The `apt update && apt upgrade` line at the bottom is just a printed
  demo line matching the screenshot. If you want it to actually run
  those commands on boot, uncomment the last line in the script:
  ```
  pkg update -y && pkg upgrade -y
  ```
