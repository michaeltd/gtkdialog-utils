ml2km() {
    #shellcheck disable=SC2005
    printf "%.2f\n" "$(echo "scale=2;${1} / 0.621371192237334"|bc -ql)"
}

km2ml(){
    #shellcheck disable=SC2005
    printf "%.2f\n" "$(echo "scale=2;${1} * 0.621371192237334"|bc -ql)"
}

c2f() {
    #shellcheck disable=SC2005
    printf "%.2f\n" "$(echo "scale=2;(${1} * 1.8) + 32"|bc -ql)"
}

f2c() {
    #shellcheck disable=SC2005
    printf "%.2f\n" "$(echo "scale=2;(${1} - 32) / 1.8"|bc -ql)"
}

kg2lb(){
    #shellcheck disable=SC2005
    printf "%.2f\n" "$(echo "scale=2;${1} * 2.20462262185"|bc -ql)"
}

lb2kg(){
    #shellcheck disable=SC2005
    printf "%.2f\n" "$(echo "scale=2;${1} / 2.20462262185"|bc -ql)"
}

dec2hex() {
    echo "obase=16;${1}" | bc -l
}

dec2bin() {
    echo "obase=2;${1}" | bc -l
}

hex2dec() {
    echo "ibase=16;${1^^}" | bc -l
}

hex2bin() {
    echo "obase=2;ibase=16;${1^^}" | bc -l
}

bin2dec() {
    echo "ibase=2;${1}" | bc -l
}

bin2hex() {
    echo "obase=16;ibase=2;${1}" | bc -l
}

export -f km2ml ml2km c2f f2c kg2lb lb2kg \
       dec2hex dec2bin hex2dec hex2bin bin2dec bin2hex
