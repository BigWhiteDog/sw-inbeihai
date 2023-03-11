#!/bin/bash
for i in {1..16}
do
{
    echo "remove control @ 10.30.12.$i"
    ssh root@10.30.12.$i "~/scripts/removecontrol_dsid.sh"
}
done