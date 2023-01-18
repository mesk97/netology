#!/bin/bash

function get_random_symbol() {
	MATRIX="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
	len=$1
	echo ${MATRIX:$((RANDOM%${#MATRIX})):len}
}

LENGTH="10"
n=1

while [ $n -le $LENGTH ]
do
	S=$(get_random_symbol 1)
	PASS="$PASS$S"
	(( n+=1 ))
done

echo "$PASS"
exit 0

