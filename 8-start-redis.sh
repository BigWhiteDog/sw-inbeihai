#!/bin/bash
source ./8-define-small8.sh
for i in ${iparr[@]}
do
{
    echo "start redis server @ 10.30.12.$i"
    ssh root@10.30.12.$i "cd ~/redis_dir/redis_cluster; ./redis-server ./redis.conf"
}
done