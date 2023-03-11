#!/bin/bash
for i in {1..16}
do
{
    # ssh root@10.30.12.$i "mkdir -p ~/redis_dir/redis_cluster"
    # scp ./redis-server root@10.30.12.$i:~/redis_dir/redis_cluster/redis-server
    # scp ./redis_cluster/redis.conf root@10.30.12.$i:~/redis_dir/redis_cluster/redis.conf
    # scp -r ./dwarf root@10.30.12.$i:~/
    # ssh root@10.30.12.$i 'cp -r ~/dwarf/md5 ~/dwarf/md5_a'
    scp -r ./scripts root@10.30.12.$i:~/
    # ssh root@10.30.12.$i "./scripts/init-dsid.sh"
}
done

# for i in {17..32}
# do
# {
#     scp /home/zcq/beihai/beihai/build/new_eth.bin root@10.30.12.$i:~/new_beihai/
# }
# done