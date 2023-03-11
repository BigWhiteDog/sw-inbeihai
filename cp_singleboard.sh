#!/bin/bash
brd_ip=10.30.12.15

ssh root@$brd_ip "mkdir -p ~/redis_dir"
scp ./redis-server root@$brd_ip:~/redis_dir/redis-server
scp ./redis-6.2.1/redis.conf root@$brd_ip:~/redis_dir/redis.conf
# scp -r ./dwarf root@$brd_ip:~/
# ssh root@$brd_ip 'cp -r ~/dwarf/md5 ~/dwarf/md5_a'
scp -r ./scripts root@$brd_ip:~/