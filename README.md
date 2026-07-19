# SUMON Banner — type ANYTHING and it shows in the pink-box style

## One-time setup

```
mkdir -p ~/bin
cp banner.sh ~/bin/banner.sh
echo 'source ~/bin/banner.sh' >> ~/.bashrc
source ~/.bashrc
```

## Three ways to use it

### 1. One-off: type a command manually
```
banner HELLO WORLD
```

### 2. "Banner mode" — type ANYTHING, no command needed
This is what you asked for: enter a special mode where every single
thing you type + Enter turns into the banner, automatically.

```
bannermode
```

Then just type and press Enter, e.g.:
```
> SUMON
> HELLO 9X
> WHATEVER I WANT
```
Each line instantly shows as the pink-box gradient banner. Type
`exit` (or `quit`) to leave banner mode and go back to your normal
Termux prompt.

### 3. Fancy custom prompt (from earlier) — optional, separate feature
If you also want your regular prompt line styled like
`┌─[SUMON@termux]─(~)`, that's the PS1 change from before — unrelated
to `bannermode`, you can have both.

## Supported characters
A–Z, 0–9, space (auto-uppercased). Tell me if you want symbols like
`!`, `-`, `@` added to the pixel font too.
