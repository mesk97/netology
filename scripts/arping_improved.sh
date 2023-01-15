#!/bin/bash
PREFIX=$1
INTERFACE=$2

trap 'echo "Ping exit (Ctrl-C)"; exit 1' 2

#for SUBNET in {0..255}
#do
for HOST in {1..255}
do
	echo "[*] IP : $PREFIX.$HOST"
	arping -c 1 -w 1 -I $INTERFACE "$PREFIX.$HOST" 2> /dev/null
done
#done
