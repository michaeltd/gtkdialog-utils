#!/bin/bash
#
#shellcheck source=/dev/null

digits_only() {
    echo "${*//[![:digit:]]}"
}

#shellcheck disable=SC2155 # GO HOME SHELLCHECK, YOU'RE DRUNK!!!
export hscalevol="$(digits_only "$(~/bin/sndvol report 2>&1)")"
#shellcheck disable=SC2155 # GO HOME SHELLCHECK, YOU'RE DRUNK!!!
[[ -z "${GTKDIALOG}" ]] && export GTKDIALOG="$(type -P gtkdialog)"

[[ -z "${GTKDIALOG}" ]] && echo "You need gtkdialog for this!" >&2 && exit 1

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ABOUT_DIALOG"

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/MAIN_DIALOG"

case "${1}" in
    -d | --dump) echo "${MAIN_DIALOG}";;
    *) "${GTKDIALOG}" --program=MAIN_DIALOG --geometry=+64+64;;
esac
