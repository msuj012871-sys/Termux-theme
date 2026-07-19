#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#  SUMON 9X - Boot Script 2.0
#  Same style as "DARK" boot banner (pink box + gradient block
#  text + green subtitle), rebranded to SUMON 9X.
# ============================================================

clear

# ---- Colors (256-color ANSI) ----
PINK='\033[38;5;213m'      # box border
GREEN='\033[38;5;46m'      # subtitle text
RESET='\033[0m'
BOLD='\033[1m'

# Gradient colors used across the block letters (purple -> blue -> cyan)
C1='\033[38;5;93m'   # purple
C2='\033[38;5;99m'   # violet
C3='\033[38;5;69m'   # blue
C4='\033[38;5;75m'   # sky blue
C5='\033[38;5;51m'   # cyan
C6='\033[38;5;50m'   # teal

# ---- Block-style ASCII art for "SUMON 9X" ----
LINE1="  ▄▄▄▄▄ █  █ █▀▄▀█ ▄▄▄▄▄ █▄  █     ▄▄▄▄▄ ▀▄  ▄▀"
LINE2="  █      █  █ █ █ █ █  █▄█ █ █▄█    █      █▄▄█ "
LINE3="  ▀▀▀▀▀  █  █ █ █ █ █▀▀▀▀ █  ▀█     ▀▀▀▀▀ ▄▀  ▀▄"
LINE4="  ▄▄▄▄█ ▀▄▄▄▀ █   █ █  █  █   █     ▄▄▄▄█ █    █"

# ---- Print top+bottom border helper ----
border() {
    printf "${PINK}╔"
    for i in $(seq 1 58); do printf "═"; done
    printf "╗${RESET}\n"
}
border_bottom() {
    printf "${PINK}╚"
    for i in $(seq 1 58); do printf "═"; done
    printf "╝${RESET}\n"
}
side() {
    printf "${PINK}║${RESET}%s${PINK}║${RESET}\n" "$1"
}

echo ""
border
side "                                                          "
printf "${PINK}║${RESET}  ${C1}${BOLD}${LINE1}${RESET}${PINK}║${RESET}\n"
printf "${PINK}║${RESET}  ${C2}${BOLD}${LINE2}${RESET}${PINK}║${RESET}\n"
printf "${PINK}║${RESET}  ${C3}${BOLD}${LINE3}${RESET}${PINK}║${RESET}\n"
printf "${PINK}║${RESET}  ${C4}${BOLD}${LINE4}${RESET}${PINK}║${RESET}\n"
side "                                                          "
printf "${PINK}║${RESET}                                    ${GREEN}Boot Script 2.0${RESET}   ${PINK}║${RESET}\n"
border_bottom
echo ""

# ---- Prompt line like the screenshot: [SUMON9X@termux]-(~) ----
printf "${PINK}┌─${RESET}[${C5}SUMON${RESET}${C6}9X${RESET}@termux]${PINK}─(~)${RESET}\n"
printf "${PINK}└─▶${RESET} apt update ${PINK}&&${RESET} apt upgrade\n"
echo ""

# ---- Actual update commands (uncomment to run for real) ----
# pkg update -y && pkg upgrade -y
