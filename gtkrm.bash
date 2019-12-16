#!/bin/bash
#
#shellcheck source=/dev/null

#shellcheck disable=SC2155 # GO HOME SHELLCHECK, YOU'RE DRUNK!!!
[[ -z "${GTKDIALOG}" ]] && export GTKDIALOG="$(type -P gtkdialog)"

[[ -z "${GTKDIALOG}" ]] && echo "You need gtkdialog for this!" >&2 && exit 1

source ~/.bashrc.d/.stl/string.sh

#shellcheck disable=SC2155 # GO HOME SHELLCHECK, YOU'RE DRUNK!!!
export hscalevol="$(digits_only "$(~/bin/sndvol report 2>&1)")"
#shellcheck disable=SC2034 # GO HOME SHELLCHECK, YOU'RE DRUNK!!!
BR="firefox" ED="gvim" FM="doublecmd" TM="terminology" SH="/bin/tcsh"

export rcfile="$(dirname "$(realpath "${BASH_SOURCE[0]}")")/$(basename "${BASH_SOURCE[0]}").rc"

source "${rcfile}"

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ABOUT"

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/OPTIONS"

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/MAIN"

case "${1}" in
    -d | --dump) echo "${MAIN}";;
    *) "${GTKDIALOG}" --program=MAIN --geometry=+64+64;;
esac
