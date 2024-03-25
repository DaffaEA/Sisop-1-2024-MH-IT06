#!/bin/bash

time=$(date +"%Y%m%d%H%M%S")

data=$(free -m)
size=$(du -sh /home/shittim)

mem=$(echo "$data" | awk 'NR==2{print $2","$3","$4","$7}')
swap=$(echo "$data" | awk 'NR==3{print $2","$3","$4}')
sizee=$(echo "$size" | cut -f1)

mkdir -p /home/shittim/log
echo "$mem,$swap,/home/shittim,$sizee" > /home/shittim/log/metrics_$time.log

#* * * * * sleep 60 && /home/shittim/Sisop-1-2024-MH-IT06/soal_4/minute_log.sh
