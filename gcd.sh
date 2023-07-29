#!/usr/bin/bash

# 用途: 
#   最大公約数を出力する
#       
# 書式: 
#   gcd.sh num1 num2
#       
# 解説: 
#   2つの自然数を引数とする
#   1つの自然数の最大公約数を出力とする
#   その他、正しくない入力を行った際はエラー終了する
#       
# 戻り値:
#   0   正常終了
#   1   ユーザの入力間違い

CMDNAME=`basename $0`

function gcd() {
    if [ $(($1 % $2)) -eq 0 ]; then
        return $2
    fi
    return $(gcd $2 $(($1 % $2)))
}


if [ $# -ne 2 ]; then
    echo "USAGE: $CMDNAME num1 num2" 1>&2
    exit 1
fi

for arg in $@;
do
    if ! expr "$arg" : "^[1-9][0-9]*$" >/dev/null; then
        echo "ERROR: Enter natural numbers" 1>&2
        exit 1
    fi
done


gcd $1 $2
echo $?
