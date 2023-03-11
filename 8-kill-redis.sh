#!/bin/bash
source ./8-define-small8.sh
for i in ${iparr[@]}
do
{
    echo "pkill @ 10.30.12.$i"
    ssh root@10.30.12.$i 'pkill redis'
}
done

for i in ${iparr[@]}
do
{
    echo "rm files @ 10.30.12.$i"
    ssh root@10.30.12.$i 'cd ~/redis_dir/redis_cluster; rm dump.rdb; rm nodes-6379.conf'
}
done