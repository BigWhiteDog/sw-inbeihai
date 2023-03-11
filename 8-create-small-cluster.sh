#!/bin/bash
source ./8-define-small8.sh
all_cmd="~/playground/redis-6.2.1/src/redis-cli --cluster create"
for i in ${iparr[@]}
do
{
    all_cmd+=" 10.30.12.$i:6379"
}
done
all_cmd+=" --cluster-replicas 1"
echo $all_cmd
eval $all_cmd