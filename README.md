# SUMON 9X — Combined Setup (Banner + Prompt)

One file, two things:
1. Shows the full "SUMON 9X" DARK-style banner once (pink box, block
   letters, gradient, green "Boot Script 2.0").
2. Installs the pink prompt style so every command you type shows as:
   ```
   ┌─[SUMON@termux]─(~)
   └──╼ your command here
   ```

## Install (one time)

```
chmod +x sumon9x_setup.sh
echo 'source ~/sumon9x_setup.sh' >> ~/.bashrc
cp sumon9x_setup.sh ~/sumon9x_setup.sh
source ~/.bashrc
```

That's it. From now on, every time you open Termux you'll see the
banner once, then your prompt will be the pink `┌─[SUMON@termux]─(~)`
style for every command you type.
