#source "${HOME}/.bashrc.d/.stl/distance.bash"
mltokm() {
    #shellcheck disable=SC2005
    printf "%.2f\n" "$(echo "scale=2;${1} * 1.609344"|bc -ql)"
}

kmtoml(){
    #shellcheck disable=SC2005
    printf "%.2f\n" "$(echo "scale=2;${1} * 0.621371192237334"|bc -ql)"
}
export -f kmtoml mltokm

#source "${HOME}/.bashrc.d/.stl/temp.bash"
ctof() {
    echo "scale=2;((9/5) * ${1}) + 32"|bc -ql
}

ftoc() {
    echo "scale=2;(${1} - 32) * (5 / 9)"|bc -ql
}
export -f ctof ftoc

kgtolb(){
    # echo "scale=2;${1} * 2.20462262185"|bc -ql
    echo "scale=2;${1} / 0.45359237"|bc -ql
}

lbtokg(){
    echo "scale=2;${1} * 0.45359237"|bc -ql
}
export -f kgtolb lbtokg
