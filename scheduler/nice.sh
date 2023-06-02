#!/bin/bash
nice -n 19 ./thread >> /dev/null && echo 19 &
nice -n 18 ./thread >> /dev/null && echo 18 &
nice -n 11 ./thread >> /dev/null && echo 11 &
nice -n 10 ./thread >> /dev/null && echo 10 &
nice -n 1 ./thread >> /dev/null && echo 1 &
nice -n 0 ./thread >> /dev/null && echo 0 &

sleep 20
