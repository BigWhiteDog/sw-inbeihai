#!/bin/bash
while true;
do
redis-benchmark -t get -n 50 -c 1 -h 192.168.1.176 | tail -2 | head -1 | awk '{print $1, $5}' > 1.tmp;
cp 1.tmp /mnt/nfs/sdc_web_data/redis-latency ;
sleep 1;
done