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
BR="$(type -P chrome||type -P firefox||type -P firefox-esr||type -P seamonkey)" \
  ED="$(type -P gedit||type -P kate||type -P mousepad||type -P gvim)" \
  FM="$(type -P nautilus||type -P thunar||type -P xfe||type -P doublecmd)" \
  TM="$(type -P gnome-terminal||type -P konsole||type -P xfce4-terminal||type -P terminology)" \
  SH="$(type -P yash||type -P dash||type -P ksh||type -P sh)" \
  GL="Super_L+Left" GR="Super_L+Right"
export rcfile="${HOME}/.$(basename "${BASH_SOURCE[0]}").rc"
source "${rcfile}"

export todofile="${HOME}/.$(basename "${BASH_SOURCE[0]}").todos"

source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/MAIN"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ABOUT"
source "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/OPTS"

case "${1}" in
    -d | --dump) echo "${MAIN}";;
    *) "${GTKDIALOG}" --program=MAIN --geometry='130x115+64+64';;
esac
