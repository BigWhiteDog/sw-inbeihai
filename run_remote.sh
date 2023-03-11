#!/bin/bash
# for i in {17..32}
# do
#     scp eth_cg_linux.bin root@10.30.12.$i:~/new_beihai/
# done

# for i in {1..16}
# do
#     echo "probe host $i"
#     ssh root@10.30.12.$i "poweroff"
# done

for i in {17..32}
do
    echo "probe host $i"
    # ssh root@10.30.12.$i "poweroff"
    # ssh root@10.30.12.$i "~/new_beihai/a.out ~/new_beihai/new_eth.bin ~/new_beihai/nvme.dtb"
    ssh root@10.30.12.$i 'find ~ -iname "2.dtb"'
done

# for i in {17..20}
# do
#     echo "probe host $i"
#     # ssh root@10.30.12.$i "poweroff"
#     ssh root@10.30.12.$i "~/new_beihai/a.out ~/new_beihai/new_eth.bin ~/new_beihai/nvme.dtb"
# done

# for i in {25..32}
# do
#     echo "probe host $i"
#     # ssh root@10.30.12.$i "poweroff"
#     ssh root@10.30.12.$i "~/new_beihai/a.out ~/new_beihai/new_eth.bin ~/new_beihai/nvme.dtb"
# done

# for i in {1..16}
# do
# {
#     echo "probe host $i"
#     # ssh root@10.30.12.$i "ls ~/redis_dir/redis_cluster"
#     # ssh root@10.30.12.$i 'pkill redis'
#     # ssh root@10.30.12.$i "cd ~/redis_dir/redis_cluster; rm dump.rdb; rm nodes-6379.conf"
#     # scp ./redis-server root@10.30.12.$i:~/redis_dir/redis_cluster/redis-server
#     # scp ./redis_cluster/redis.conf root@10.30.12.$i:~/redis_dir/redis_cluster/redis.conf
#     # ssh root@10.30.12.$i "./scripts/init-dsid.sh"
#     # ssh root@10.30.12.$i 'cp -r ~/dwarf/md5 ~/dwarf/md5_a'
# }
# done