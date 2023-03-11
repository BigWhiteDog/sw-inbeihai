#!/bin/bash
# for i in {17..32}
# do
#     scp eth_cg_linux.bin root@10.30.12.$i:~/new_beihai/
# done

# for i in {1..16}
# do
# 	echo "probe host $i"
# 	ssh root@10.30.12.$i "poweroff"
# done

for i in {17..32}
do
    echo "probe host $i"
    ssh root@10.30.12.$i "poweroff"
    # ssh root@10.30.12.$i "~/new_beihai/a.out ~/new_beihai/new_eth.bin ~/new_beihai/nvme.dtb"
done

# for i in {17..20}
# do
#     echo "probe host $i"
#     # ssh root@10.30.12.$i "poweroff"
#     ssh root@10.30.12.$i "~/new_beihai/a.out ~/new_beihai/new_eth.bin ~/new_beihai/nvme.dtb"
# done

