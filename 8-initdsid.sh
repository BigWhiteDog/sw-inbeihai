#!/bin/bash
source ./8-define-small8.sh
for i in ${iparr[@]}
do
{
    echo "init dsid @ 10.30.12.$i"
    ssh root@10.30.12.$i "~/init-dsid.sh"
}
done