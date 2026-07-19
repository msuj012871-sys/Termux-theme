# SUMON 9X — Combined Setup (Banner + Prompt, mobile-sized)

One file, two things:
1. Shows the "SUMON9X" DARK-style banner once — pink box, block
   letters, gradient, green "Boot Script 2.0". Width kept narrow
   (fits phone screens), height tripled per row so letters still
   look big and bold vertically.
2. Installs a simplified pink prompt:
   ```
   ┌─[SUMON]─(~)
   └──╼ your command here
   ```

## Install (one time — cleans up old duplicate lines first)

```
grep -v "sumon9x_setup.sh\|bin/banner.sh" ~/.bashrc > ~/.bashrc.clean
mv ~/.bashrc.clean ~/.bashrc
chmod +x sumon9x_setup.sh
cp sumon9x_setup.sh ~/sumon9x_setup.sh
echo 'source ~/sumon9x_setup.sh' >> ~/.bashrc
source ~/.bashrc
```

## Adjust size

Open `sumon9x_setup.sh`, inside `draw_banner()`:
- `SCALE=1` → width of each pixel (raise to 2 for wider letters, only
  if it still fits your screen)
- `HEIGHT=3` → how many lines tall each pixel row is (raise for
  taller letters, lower if it feels too tall)
