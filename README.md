# SUMON 9X — Combined Setup (Banner + Prompt)

One file, two things:
1. Shows the "SUMON 9X" DARK-style banner once — pink box, block
   letters, gradient, green "Boot Script 2.0". Fixed to a safe width
   (SCALE=1) so it fits typical phone screens without wrapping/cutting.
2. Installs a simplified pink prompt:
   ```
   ┌─[SUMON]─(~)
   └──╼ your command here
   ```
   (no "@termux", no long folder path — always shows a clean `(~)`)

## Install (one time)

```
chmod +x sumon9x_setup.sh
cp sumon9x_setup.sh ~/sumon9x_setup.sh
echo 'source ~/sumon9x_setup.sh' >> ~/.bashrc
source ~/.bashrc
```

## If ~/.bashrc has old duplicate lines

If you added `source ~/sumon9x_setup.sh` more than once in past attempts,
clean it up so it only runs once:
```
grep -v "sumon9x_setup.sh\|bin/banner.sh" ~/.bashrc > ~/.bashrc.clean
mv ~/.bashrc.clean ~/.bashrc
echo 'source ~/sumon9x_setup.sh' >> ~/.bashrc
source ~/.bashrc
```

## Resize the banner

Open `sumon9x_setup.sh`, find `SCALE=1` near the top of `draw_banner()`,
and change it to `SCALE=2` for bigger letters (check it still fits your
screen width first).
