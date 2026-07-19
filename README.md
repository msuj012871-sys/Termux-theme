# SUMON 9X — Combined Setup (Banner + Prompt, auto-fits your screen)

One file, two things:
1. Shows the full "SUMON 9X" DARK-style banner once — pink box, block
   letters, gradient, green "Boot Script 2.0". The letters now
   **auto-scale to your actual terminal width** (using `tput cols`),
   so the box never wraps or gets cut off, and stays as big as
   possible for your screen/font size.
2. Installs the pink prompt style so every command you type shows as:
   ```
   ┌─[SUMON@termux]─(~)
   └──╼ your command here
   ```

## Install (one time)

```
chmod +x sumon9x_setup.sh
cp sumon9x_setup.sh ~/sumon9x_setup.sh
echo 'source ~/sumon9x_setup.sh' >> ~/.bashrc
source ~/.bashrc
```

## If it still looks too big/small

The banner size depends on your Termux font size and screen width.
- Smaller font in Termux settings → banner appears bigger (more
  columns fit) and vice versa.
- You can also force a specific scale instead of auto: open
  `sumon9x_setup.sh`, find the line `SCALE=$(( AVAIL / GLYPHW ))` and
  replace it with a fixed number, e.g. `SCALE=2`.
