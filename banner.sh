#!/usr/bin/env bash

if [[ -t 1 && -z "${NO_COLOR:-}" ]]; then
    PURPLE=$'\033[38;5;141m'
    VIOLET=$'\033[38;5;99m'
    RESET=$'\033[0m'
else
    PURPLE=''
    VIOLET=''
    RESET=''
fi

printf '\n%s' "$PURPLE"
printf '       ✦･ﾟ: *✧･ﾟ:*  K A Y R A  *:･ﾟ✧*:･ﾟ✦\n'
printf '       ░▒▓█▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░\n'
printf '%s' "$VIOLET"

if command -v figlet >/dev/null 2>&1 && figlet -f slant 'KAYRA' 2>/dev/null; then
    :
else
    printf '  ██╗  ██╗ █████╗ ██╗   ██╗██████╗  █████╗\n'
    printf '  ██║ ██╔╝██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗\n'
    printf '  █████╔╝ ███████║ ╚████╔╝ ██████╔╝███████║\n'
    printf '  ██╔═██╗ ██╔══██║  ╚██╔╝  ██╔══██╗██╔══██║\n'
    printf '  ██║  ██╗██║  ██║   ██║   ██║  ██║██║  ██║\n'
    printf '  ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝\n'
fi

printf '%s' "$PURPLE"
printf '       ✦ ░▒▓█▓▒░ ✦ ░▒▓█▓▒░ ✦ ░▒▓█▓▒░ ✦\n'
printf '%s\n' "$RESET"
