#!/bin/bash

./memUsage.sh > memUsage.dat &

mkfifo pipe

while [ 1 ]; do tail -64 memUsage.dat> pipe; done &

watch -n 1 'gnuplot -e "set terminal dumb;p \"pipe\" with lines"'
