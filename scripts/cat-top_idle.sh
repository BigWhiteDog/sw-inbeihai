#!/bin/bash

while true;
do
idle=`top -n 1 -b | grep "Cpu(s):" | awk '{print $8}'`
# echo $idle
tatol_cpu_usage=$(echo $idle | awk '{printf("%.2f",100-$1)}')
echo $tatol_cpu_usage > /mnt/nfs/sdc_web_data/cpu_usage
sleep 1
done
