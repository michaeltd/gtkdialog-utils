#!/bin/bash
#
#shellcheck source=/dev/null

#shellcheck disable=SC2155 # GO HOME SHELLCHECK, YOU'RE DRUNK!!!
[[ -z "${GTKDIALOG}" ]] && export GTKDIALOG="$(type -P gtkdialog)"
[[ -z "${GTKDIALOG}" ]] && echo "You need gtkdialog for this!" >&2 && exit 1

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/MAIN"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ABOUT"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/OPTS"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/CALC"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/TODOS"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/FIND"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/CONVS"

case "${1}" in
    -d | --dump) echo "${MAIN} ${ABOUT} ${OPTS} ${CALC} ${TODOS} ${FIND} ${CONVS}";;
    *) "${GTKDIALOG}" --program=MAIN --geometry='170x115+64+64';;
esac
