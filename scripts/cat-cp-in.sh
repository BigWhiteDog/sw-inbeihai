#!/bin/bash

cat /sys/fs/cgroup/dsid/test-1/dsid.dsid-cp > 1-cp.txt
cat /sys/fs/cgroup/dsid/dsid.dsid-cp > 2-cp.txt
cat 1-cp.txt | head -12 | tail -1 | awk '{print $2}' > /mnt/nfs/sdc_web_data/dwarf-traffic
cat 1-cp.txt | head -14 | tail -1 | awk '{print $2}' > /mnt/nfs/sdc_web_data/dwarf-capability
cat 2-cp.txt | head -12 | tail -1 | awk '{print $2}' > /mnt/nfs/sdc_web_data/redis-traffic
cat 2-cp.txt | head -14 | tail -1 | awk '{print $2}' > /mnt/nfs/sdc_web_data/redis-capability
sleep 0.8