#!/bin/bash
source ./8-define-small8.sh
for i in ${iparr[@]}
do
{
    echo "add dwarf: md5 sort wordcount md5_a @ 10.30.12.$i"
    ssh root@10.30.12.$i "~/scripts/swim.sh"
}
done