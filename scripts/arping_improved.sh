#!/bin/bash

trap 'echo "Ping exit (Ctrl-C)"; exit 1' 2

PREFIX=$1
INTERFACE=$2

# Проверка параметров
#  аналог такой проверки 
#  if [ -z "$INTERFACE" ]; then
#  [[ - это синтаксическое расширение BASH (не POSIX compatible)
if [[ "$INTERFACE" == "" ]]; then
	echo "INTERFACE is not defined" >&2
	exit 1
fi 

#for SUBNET in {0..255}
#do
for HOST in {1..255}
do
	echo -ne "[*] check IP: $PREFIX.$HOST: "
	
	if arping -c 1 -w 1 -I "$INTERFACE" "$PREFIX.$HOST"  1>/dev/null ; then
		echo "YES"
	else
		# Если код не 1 то это какая то ошибка и нет смысла идти дальше
		if [[ $? != 1 ]]; then
			exit 1
		fi		
		echo "-"
	fi
done
#done
