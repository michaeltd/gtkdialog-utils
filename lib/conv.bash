#source "${HOME}/.bashrc.d/.stl/distance.bash"
mltokm() {
    #shellcheck disable=SC2005
    # printf "%.2f\n" "$(echo "scale=2;${1} * 1.609344"|bc -ql)"
    printf "%.2f\n" "$(echo "scale=2;${1} / 0.621371192237334"|bc -ql)"
}

kmtoml(){
    #shellcheck disable=SC2005
    printf "%.2f\n" "$(echo "scale=2;${1} * 0.621371192237334"|bc -ql)"
}
export -f kmtoml mltokm

#source "${HOME}/.bashrc.d/.stl/temp.bash"
ctof() {
    # printf "%.2f\n" "$(echo "scale=2;((9/5) * ${1}) + 32"|bc -ql)"
    # °F = °C * 1.8000 + 32.00
    printf "%.2f\n" "$(echo "scale=2;(${1} * 1.8) + 32"|bc -ql)"
}

ftoc() {
    # printf "%.2f\n" "$(echo "scale=2;(${1} - 32) * (5 / 9)"|bc -ql)"
    # °C = °F - 32/1.8000
    printf "%.2f\n" "$(echo "scale=2;(${1} - 32) / 1.8"|bc -ql)"
}
export -f ctof ftoc

kgtolb(){
    # printf "%.2f\n" "$(echo "scale=2;${1} / 0.45359237"|bc -ql)"
    printf "%.2f\n" "$(echo "scale=2;${1} * 2.20462262185"|bc -ql)"
}

lbtokg(){
    # printf "%.2f\n" "$(echo "scale=2;${1} * 0.45359237"|bc -ql)"
    printf "%.2f\n" "$(echo "scale=2;${1} / 2.20462262185"|bc -ql)"
}
export -f kgtolb lbtokg
