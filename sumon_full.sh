#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#  SUMON - Boot Script 2.0
#  Same look as the "DARK" reference:
#   - pink rounded box
#   - solid filled 8-bit style block letters, purple->blue->cyan gradient
#   - green "Boot Script 2.0" bottom-right inside the box
#   - colored prompt line + apt update && apt upgrade
#  100% self-contained (no figlet/toilet font needed, always looks right)
# ============================================================

clear
RESET='\033[0m'
BOLD='\033[1m'
PINK='\033[38;5;213m'
GREEN='\033[38;5;46m'

# ---- 5x7 pixel font, 1 = filled block, 0 = empty ----
declare -A F
F[S]="01111 10000 10000 01110 00001 00001 11110"
F[U]="10001 10001 10001 10001 10001 10001 01110"
F[M]="10001 11011 10101 10101 10001 10001 10001"
F[O]="01110 10001 10001 10001 10001 10001 01110"
F[N]="10001 11001 10101 10101 10011 10001 10001"

WORD="SUMON"
GAP=2
PIX="██"

GRAD=(93 92 63 69 68 74 75 81 51 50 45)
NCOL=${#GRAD[@]}

declare -a ROWS
for r in 0 1 2 3 4 5 6; do ROWS[$r]=""; done

for (( li=0; li<${#WORD}; li++ )); do
    L="${WORD:$li:1}"
    read -ra rows <<< "${F[$L]}"
    for r in 0 1 2 3 4 5 6; do
        ROWS[$r]="${ROWS[$r]}${rows[$r]}"
    done
    if (( li < ${#WORD}-1 )); then
        for r in 0 1 2 3 4 5 6; do
            ROWS[$r]="${ROWS[$r]}$(printf '0%.0s' $(seq 1 $GAP))"
        done
    fi
done

GLYPHW=${#ROWS[0]}
LINEW=$(( GLYPHW * 2 ))

SUB="Boot Script 2.0"
BOXW=$(( LINEW + 6 ))
(( BOXW < ${#SUB} + 8 )) && BOXW=$(( ${#SUB} + 8 ))

hline() {
    local left="$1" right="$2"
    printf "${PINK}%s" "$left"
    for ((i=0;i<BOXW;i++)); do printf "─"; done
    printf "%s${RESET}\n" "$right"
}

echo ""
hline "╭" "╮"
printf "${PINK}│${RESET}%*s${PINK}│${RESET}\n" "$BOXW" ""

leftpad=$(( (BOXW - LINEW) / 2 ))

for r in 0 1 2 3 4 5 6; do
    row="${ROWS[$r]}"
    printf "${PINK}│${RESET}%*s" "$leftpad" ""
    for ((c=0; c<${#row}; c++)); do
        bit="${row:$c:1}"
        idx=$(( c % NCOL ))
        if [[ "$bit" == "1" ]]; then
            printf "\033[1;38;5;%sm%s${RESET}" "${GRAD[$idx]}" "$PIX"
        else
            printf "  "
        fi
    done
    rightpad=$(( BOXW - leftpad - LINEW ))
    printf "%*s${PINK}│${RESET}\n" "$rightpad" ""
done

printf "${PINK}│${RESET}%*s${PINK}│${RESET}\n" "$BOXW" ""

subpad=$(( BOXW - ${#SUB} - 2 ))
printf "${PINK}│${RESET}%*s${GREEN}${BOLD}%s${RESET}  ${PINK}│${RESET}\n" "$subpad" "" "$SUB"

hline "╰" "╯"
echo ""

printf "${PINK}┌─${RESET}[\033[38;5;51mSUMON${RESET}@termux]${PINK}─(~)${RESET}\n"
printf "${PINK}└──╼${RESET} ${BOLD}apt update${RESET} ${PINK}&&${RESET} ${BOLD}apt upgrade${RESET}\n"
echo ""

apt update -y && apt upgrade -y
