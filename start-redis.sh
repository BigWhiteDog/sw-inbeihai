#!/bin/bash
for i in {1..16}
do
{
    echo "start redis server @ 10.30.12.$i"
    ssh root@10.30.12.$i "cd ~/redis_dir/redis_cluster; ./redis-server ./redis.conf"
}
done