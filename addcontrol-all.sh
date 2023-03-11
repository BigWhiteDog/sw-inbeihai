#!/bin/bash
for i in {1..16}
do
{
    echo "add control @ 10.30.12.$i"
    ssh root@10.30.12.$i "~/scripts/addcontrol_dsid.sh"
}
done