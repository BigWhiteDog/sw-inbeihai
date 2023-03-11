#!/bin/bash
source ./8-define-small8.sh
for i in ${iparr[@]}
do
{
    echo "add control @ 10.30.12.$i"
    ssh root@10.30.12.$i "~/scripts/addcontrol_dsid.sh"
}
done