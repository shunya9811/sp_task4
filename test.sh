#!/usr/bin/bash

# gcdシェルへの入力が間違っている時

## test1 入力値なし 
echo -n > /tmp/$$-ans
./gcd.sh > /tmp/$$-result 2> /dev/null
!(diff /tmp/$$-ans /tmp/$$-result) && echo "Error in test1" >> /tmp/$$-error.log

## test2 入力1個
echo -n > /tmp/$$-ans
./gcd.sh 4 > /tmp/$$-result 2> /dev/null
!(diff /tmp/$$-ans /tmp/$$-result) && echo "Error in test2" >> /tmp/$$-error.log

## test3 入力3個以上
echo -n > /tmp/$$-ans
./gcd.sh 3 4 5 5 > /tmp/$$-result 2> /dev/null
!(diff /tmp/$$-ans /tmp/$$-result) && echo "Error in test3" >> /tmp/$$-error.log

## test4 負の数が入力された場合
echo -n > /tmp/$$-ans
./gcd.sh -4 > /tmp/$$-result 2> /dev/null
!(diff /tmp/$$-ans /tmp/$$-result) && echo "Error in test4" >> /tmp/$$-error.log

## test5 少数が入力された時
echo -n > /tmp/$$-ans
./gcd.sh 4.0 > /tmp/$$-result 2> /dev/null
!(diff /tmp/$$-ans /tmp/$$-result) && echo "Error in test5" >> /tmp/$$-error.log

## test6 文字が入力された時
echo -n > /tmp/$$-ans
./gcd.sh abc > /tmp/$$-result 2> /dev/null
!(diff /tmp/$$-ans /tmp/$$-result) && echo "Error in test6" >> /tmp/$$-error.log


# gcdシェルへの入力が正しい時

# TODO:いくつか例をがあげて行う

## test7 入力 2 4 -> 答え 2
echo "2" > /tmp/$$-ans
./gcd.sh 2 4 > /tmp/$$-result
!(diff /tmp/$$-ans /tmp/$$-result) && echo "error in test7">> /tmp/$$-error.log

## test8 入力 135 45 -> 答え 45
echo "45" > /tmp/$$-ans
./gcd.sh 135 45 > /tmp/$$-result
!(diff /tmp/$$-ans /tmp/$$-result) && echo "error in test8">> /tmp/$$-error.log


if [ -f /tmp/$$-error.log ]; then
        cat /tmp/$$-error.log 1>&2
        rm -f /tmp/$$-*
        exit 1
fi