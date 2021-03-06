#!/usr/bin/env bash
#
##shellcheck source=/dev/null disable=SC2155

[[ -z "${GTKDIALOG}" ]] && export GTKDIALOG="$(type -P gtkdialog)"
[[ -z "${GTKDIALOG}" ]] && echo "You need gtkdialog for this!" >&2 && exit 1

declare -rx GDU_DIR_NAME="$(dirname "$(realpath "${BASH_SOURCE[0]}")")" \
	GDU_BASE_NAME="$(basename "$(realpath "${BASH_SOURCE[0]}")")"

declare -rx GDU_UI_DIR="${GDU_DIR_NAME}/ui" \
	GDU_LIB_DIR="${GDU_DIR_NAME}/lib"

declare -rx GDU_RC="${HOME}/.${GDU_BASE_NAME/.bash/.rc}" \
	GDU_TODO="${HOME}/.${GDU_BASE_NAME/.bash/.todos}"

declare -rx TMP_DIR="/tmp/${USER}/$(basename "${BASH_SOURCE[0]/.bash/}")/${$}/"
mkdir -p "${TMP_DIR}" 

for i in "${GDU_UI_DIR}"/*.src; do
    source "${i}"
done

case "${1}" in
    -h|--help) echo "Usage: ${GDU_BASE_NAME} [-(-c)alc]|[-(-s)earch]|[-(-t)odos]|[-o|--conv]" >&2;;
    -c|--calc) "${GTKDIALOG}" --program=CALC;;
    -s|--search) "${GTKDIALOG}" --program=FIND;;
    -t|--todos) "${GTKDIALOG}" --program=TODOS;;
    -o|--conv) "${GTKDIALOG}" --program=CONV;;
    -d|--debug) export > /tmp/${$}.tmp && "${PAGER}" /tmp/${$}.tmp;;
    *) "${GTKDIALOG}" --program=MAIN;;
esac
