ml2km() {
    #shellcheck disable=SC2005
    printf "%.2f\n" "$(echo "scale=2;${1} / 0.621371192237334"|bc -ql)"
}

km2ml(){
    #shellcheck disable=SC2005
    printf "%.2f\n" "$(echo "scale=2;${1} * 0.621371192237334"|bc -ql)"
}

c2f() {
    printf "%.2f\n" "$(echo "scale=2;(${1} * 1.8) + 32"|bc -ql)"
}

f2c() {
    printf "%.2f\n" "$(echo "scale=2;(${1} - 32) / 1.8"|bc -ql)"
}

kg2lb(){
    # printf "%.2f\n" "$(echo "scale=2;${1} / 0.45359237"|bc -ql)"
    printf "%.2f\n" "$(echo "scale=2;${1} * 2.20462262185"|bc -ql)"
}

lb2kg(){
    # printf "%.2f\n" "$(echo "scale=2;${1} * 0.45359237"|bc -ql)"
    printf "%.2f\n" "$(echo "scale=2;${1} / 2.20462262185"|bc -ql)"
}
export -f km2ml ml2km c2f f2c kg2lb lb2kg
