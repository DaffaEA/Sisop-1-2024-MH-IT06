#!/bin/bash
time=$(date +"%Y%m%d%H%M%S")
touch /home/shittim/metrics_agg_$time.log
echo -n "minimum" >> /home/shittim/metrics_agg_$time.log

for i in {1..7}
do
     echo -n ",$(awk -F ',' -v col="$i" 'NR==1 {min=$col} NR>1 && $col<min {min=$col} NR==60 {exit} END {print min}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log
done

echo -n ",$(awk -F ',' 'NR==1 {print $8}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log
echo -n ",$(awk -F ',' 'NR==1 {min=$9} NR>1 && $col<min {min=$9} NR==60 {exit} END {print min}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log

echo -e -n "\nmaximum" >> /home/shittim/metrics_agg_$time.log

for i in {1..7}
do
    echo -n ",$(awk -F ',' -v col="$i" 'NR==1 {max=$col} NR>1 && $col>max {max=$col} NR==60 {exit} END {print max}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log
done

echo -n ",$(awk -F ',' 'NR == 1 {print $8}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log
echo -n ",$(awk -F ',' 'NR==1 {max=$9} NR>1 && $col>max {max=$9} NR==60 {exit} END {print max}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log

echo -e -n "\naverage" >> /home/shittim/metrics_agg_$time.log

for i in {1..7}
do
avg_val=$(awk -F ',' -v col="$i" '{sum += $col} END {if (NR > 0) print sum / NR}' /home/shittim/log/*.log)
    echo -n ",$avg_val" >> /home/shittim/metrics_agg_$time.log
done

echo -n ",$(awk -F ',' 'NR == 1 {print $8}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log
echo -n ",$(awk -F ',' '{sum += $9} END {if (NR > 0) print sum / NR}' /home/shittim/log/*.log)" >> /home/shittim/metrics_agg_$time.log

mv /home/shittim/metrics_agg_$time.log /home/shittim/log/

chmod 600 /home/shittim/log/metrics_agg_$time.log

#0 * * * * /home/shittim/Sisop-1-2024-MH-IT06/soal_4/aggregate_minutes_to_hourly_log.sh
