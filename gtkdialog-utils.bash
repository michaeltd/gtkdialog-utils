#!/usr/bin/env bash
#
#shellcheck source=/dev/null

#shellcheck disable=SC2155 # GO HOME SHELLCHECK, YOU'RE DRUNK!!!
[[ -z "${GTKDIALOG}" ]] && export GTKDIALOG="$(type -P gtkdialog)"
[[ -z "${GTKDIALOG}" ]] && echo "You need gtkdialog for this!" >&2 && exit 1

for i in "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/ui/"*; do
    source "${i}"
done

case "${1}" in
    h|help|-h|--help) echo "Usage: $(basename "${BASH_SOURCE[0]}") [-(-c)alc]|[-(-s)earch]|[-(-t)odos]|[-o|--conv]" >&2;;
    c|calc|-c|--calc) "${GTKDIALOG}" --program=CALC;;
    s|search|-s|--search) "${GTKDIALOG}" --program=FIND;;
    t|todos|-t|--todos) "${GTKDIALOG}" --program=TODOS;;
    o|conv|-o|--conv) "${GTKDIALOG}" --program=CONV;;
    d|debug|-d|--debug) export > /tmp/${$}.tmp && "${PAGER}" /tmp/${$}.tmp;;
    *) "${GTKDIALOG}" --program=MAIN;;
esac
