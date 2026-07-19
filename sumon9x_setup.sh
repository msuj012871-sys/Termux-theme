#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#  SUMON 9X — Combined Setup
#  1) Shows the full DARK-style banner (pink box + block letters
#     + gradient + green "Boot Script 2.0")
#  2) Installs the pink prompt style:
#       ┌─[SUMON@termux]─(~)
#       └──╼ your command here
# ============================================================

# ---------- PART 1: draw the banner ----------
draw_banner() {
    clear
    RESET='\033[0m'
    BOLD='\033[1m'
    PINK='\033[38;5;213m'
    GREEN='\033[38;5;46m'

    declare -A F
    F[A]="01110 10001 10001 11111 10001 10001 10001"
    F[B]="11110 10001 10001 11110 10001 10001 11110"
    F[C]="01111 10000 10000 10000 10000 10000 01111"
    F[D]="11110 10001 10001 10001 10001 10001 11110"
    F[E]="11111 10000 10000 11110 10000 10000 11111"
    F[F]="11111 10000 10000 11110 10000 10000 10000"
    F[G]="01111 10000 10000 10011 10001 10001 01111"
    F[H]="10001 10001 10001 11111 10001 10001 10001"
    F[I]="01110 00100 00100 00100 00100 00100 01110"
    F[J]="00111 00010 00010 00010 00010 10010 01100"
    F[K]="10001 10010 10100 11000 10100 10010 10001"
    F[L]="10000 10000 10000 10000 10000 10000 11111"
    F[M]="10001 11011 10101 10101 10001 10001 10001"
    F[N]="10001 11001 10101 10101 10011 10001 10001"
    F[O]="01110 10001 10001 10001 10001 10001 01110"
    F[P]="11110 10001 10001 11110 10000 10000 10000"
    F[Q]="01110 10001 10001 10001 10101 10010 01101"
    F[R]="11110 10001 10001 11110 10100 10010 10001"
    F[S]="01111 10000 10000 01110 00001 00001 11110"
    F[T]="11111 00100 00100 00100 00100 00100 00100"
    F[U]="10001 10001 10001 10001 10001 10001 01110"
    F[V]="10001 10001 10001 10001 10001 01010 00100"
    F[W]="10001 10001 10001 10101 10101 11011 10001"
    F[X]="10001 10001 01010 00100 01010 10001 10001"
    F[Y]="10001 10001 01010 00100 00100 00100 00100"
    F[Z]="11111 00001 00010 00100 01000 10000 11111"
    F[0]="01110 10001 10011 10101 11001 10001 01110"
    F[1]="00100 01100 00100 00100 00100 00100 01110"
    F[2]="01110 10001 00001 00010 00100 01000 11111"
    F[3]="11110 00001 00001 00110 00001 00001 11110"
    F[4]="00010 00110 01010 10010 11111 00010 00010"
    F[5]="11111 10000 11110 00001 00001 10001 01110"
    F[6]="00110 01000 10000 11110 10001 10001 01110"
    F[7]="11111 00001 00010 00100 01000 01000 01000"
    F[8]="01110 10001 10001 01110 10001 10001 01110"
    F[9]="01110 10001 10001 01111 00001 00010 01100"
    F[' ']="000 000 000 000 000 000 000"

    WORD="SUMON 9X"
    GAP=2
    PIX="███"
    GRAD=(93 92 63 69 68 74 75 81 51 50 45)
    NCOL=${#GRAD[@]}

    local -a ROWS
    for r in 0 1 2 3 4 5 6; do ROWS[$r]=""; done

    local li L rows r
    for (( li=0; li<${#WORD}; li++ )); do
        L="${WORD:$li:1}"
        [[ -z "${F[$L]}" ]] && L=' '
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

    local GLYPHW=${#ROWS[0]}
    local LINEW=$(( GLYPHW * 3 ))
    local SUB="Boot Script 2.0"
    local BOXW=$(( LINEW + 6 ))
    (( BOXW < ${#SUB} + 8 )) && BOXW=$(( ${#SUB} + 8 ))

    hline() {
        printf "${PINK}%s" "$1"
        for ((i=0;i<BOXW;i++)); do printf "─"; done
        printf "%s${RESET}\n" "$2"
    }

    echo ""
    hline "╭" "╮"
    printf "${PINK}│${RESET}%*s${PINK}│${RESET}\n" "$BOXW" ""

    local leftpad=$(( (BOXW - LINEW) / 2 ))
    local row bit idx c rightpad rep
    for r in 0 1 2 3 4 5 6; do
        row="${ROWS[$r]}"
        for rep in 1 2; do
            printf "${PINK}│${RESET}%*s" "$leftpad" ""
            for ((c=0; c<${#row}; c++)); do
                bit="${row:$c:1}"
                idx=$(( c % NCOL ))
                if [[ "$bit" == "1" ]]; then
                    printf "\033[1;38;5;%sm%s${RESET}" "${GRAD[$idx]}" "$PIX"
                else
                    printf "   "
                fi
            done
            rightpad=$(( BOXW - leftpad - LINEW ))
            printf "%*s${PINK}│${RESET}\n" "$rightpad" ""
        done
    done

    printf "${PINK}│${RESET}%*s${PINK}│${RESET}\n" "$BOXW" ""
    local subpad=$(( BOXW - ${#SUB} - 2 ))
    printf "${PINK}│${RESET}%*s${GREEN}${BOLD}%s${RESET}  ${PINK}│${RESET}\n" "$subpad" "" "$SUB"
    hline "╰" "╯"
    echo ""
}

# ---------- PART 2: the pink prompt style ----------
set_prompt() {
    PS1="\[\033[38;5;213m\]┌─\[\033[0m\][\[\033[38;5;51m\]SUMON\[\033[0m\]@termux]\[\033[38;5;213m\]─(\[\033[0m\]\w\[\033[38;5;213m\])\[\033[0m\]\n\[\033[38;5;213m\]└──╼\[\033[0m\] "
}

draw_banner
set_prompt        done
        rightpad=$(( BOXW - leftpad - LINEW ))
        printf "%*s${PINK}│${RESET}\n" "$rightpad" ""
    done

    printf "${PINK}│${RESET}%*s${PINK}│${RESET}\n" "$BOXW" ""
    local subpad=$(( BOXW - ${#SUB} - 2 ))
    printf "${PINK}│${RESET}%*s${GREEN}${BOLD}%s${RESET}  ${PINK}│${RESET}\n" "$subpad" "" "$SUB"
    hline "╰" "╯"
    echo ""
}

# ---------- PART 2: the pink prompt style ----------
set_prompt() {
    PS1="\[\033[38;5;213m\]┌─\[\033[0m\][\[\033[38;5;51m\]SUMON\[\033[0m\]@termux]\[\033[38;5;213m\]─(\[\033[0m\]\w\[\033[38;5;213m\])\[\033[0m\]\n\[\033[38;5;213m\]└──╼\[\033[0m\] "
}

draw_banner
set_prompt
